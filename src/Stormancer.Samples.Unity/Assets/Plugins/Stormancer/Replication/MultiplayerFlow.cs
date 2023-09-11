using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Stormancer;
using System.Threading.Tasks;
using System;
using Stormancer.Plugins;
using System.Threading;
using UniRx;
using Assets.Companies.Stormancer.Replication;
using Stormancer.Unity3D;
using Stormancer.Replication;

[Serializable]
public class EntityType
{
    public string Id;
    public GameObject Prefab;
}
public class MultiplayerFlow : MonoBehaviour
{
    public int ClientId = 0;

    public string State = "disconnected";

    public EntityType[] Prefabs;

    private IDisposable _connectionStateChangedSubscription;




    private Dictionary<string, GameObject> _entityTypeIndex = new Dictionary<string, GameObject>();

    public int TeamSize { get; set; } = 1;
    public int TeamCount { get; set; } = 4;

    public string EnvironmentId { get; set; } = string.Empty;

    // Start is called before the first frame update
    void Start()
    {



        foreach (var prefab in Prefabs)
        {
            _entityTypeIndex.Add(prefab.Id, prefab.Prefab);
        }

        ClientFactory.SetConfigFactory(() =>
        {

            //var config = ClientConfiguration.Create("http://localhost", "unitedvr", "dev-server");
            var config = ClientConfiguration.Create("http://gc3.stormancer.com", "unitedvr", "dev-server");
            config.Logger = new UnityLogger(Stormancer.Diagnostics.LogLevel.Debug, "stormancer." + this.name);
            config.Plugins.Add(new AuthenticationPlugin());
            config.Plugins.Add(new PartyPlugin());
            config.Plugins.Add(new GameFinderPlugin());
            config.Plugins.Add(new ReplicationPlugin());
            return config;
        });

        var client = ClientFactory.GetClient(ClientId);

        _ = RunMultiplayerFlow(client);

    }

    public void DestroyGameObject(Entity entity)
    {
        if (!ReplicationReady)
        {
            return;
        }
        rep.Entities.RemoveEntity(entity.Id);
    }

    private void OnDestroy()
    {
        var client = ClientFactory.GetClient(ClientId);

        client.Disconnect();
        ClientFactory.ReleaseClient(ClientId);
    }

    private async Task RunMultiplayerFlow(Client client)
    {
        var scene = await ConnectToGameSession_Impl(client, s =>
        {
            _connectionStateChangedSubscription = s.SceneConnectionStateObservable.Subscribe(connectionState =>
            {
                switch (connectionState.State)
                {

                    case Stormancer.Core.ConnectionState.Connected:
                        State = "inGamesession";
                        break;
                    case Stormancer.Core.ConnectionState.Disconnecting:
                    case Stormancer.Core.ConnectionState.Disconnected:
                        rep = null;
                        State = "disconnected";
                        break;
                }

            });


            s.DependencyResolver.Resolve<ReplicationApi>().Configure(b => b
                .ConfigureEntityBuilder(ctx =>
                {
                    var e = ctx.Entity;
                    if (_entityTypeIndex.TryGetValue(e.Type, out var prefab))
                    {

                        var gameObject = ctx.CustomData.ContainsKey("gameObject") ? (GameObject)ctx.CustomData["gameObject"] : Instantiate(prefab, this.transform);


                        e.AddComponent<ReplicatedGameObject>("unity.gameObject", () => new ReplicatedGameObject(gameObject));

                        foreach (var component in gameObject.GetComponentsInChildren<ReplicationBehavior>())
                        {
                            component.Entity = e;
                            component.ConfigureEntity(e);

                        }

                    }
                    else
                    {
                        throw new InvalidOperationException($"Missing prefab {e.Type}.");
                    }

                    return null;
                })
                .ConfigureViewDataPolicy("authority", vdb => vdb)
                .ConfigureViewDataPolicy("@authority", vdb => vdb)
            );


        });

        rep = scene.DependencyResolver.Resolve<ReplicationApi>();
        State = "initGame";
        await rep.WhenAuthoritySynchronized();
        State = "replicated";
        ReplicationReady = true;
    }

    public bool ReplicationReady { get; private set; }

    public void AddGameObject(GameObject gameObject)
    {
        if (!ReplicationReady)
        {
            throw new InvalidOperationException("Can't create entity when replicationReady = false.");
        }
        Debug.unityLogger.Log($"Creating entity for {gameObject.name}");
        rep.CreateEntity("character", e => { }, d =>
        {
            d["gameObject"] = gameObject;
        });
    }

    private ReplicationApi rep;
    async Task<Scene> ConnectToGameSession_Impl(Client client, Action<Scene> gameSessionInitializer)
    {


        var users = client.DependencyResolver.Resolve<UserApi>();
        users.OnGetAuthParameters = () => Task.FromResult(new AuthParameters { Type = "deviceidentifier", Parameters = new Dictionary<string, string> { { "deviceidentifier", Guid.NewGuid().ToString() } } });
        await users.Login();
        State = "authenticated";
        var party = client.DependencyResolver.Resolve<PartyApi>();

        await party.CreateParty(new PartyRequestDto { GameFinderName = "matchmaking", CustomData = "{\"TeamSize\":" + TeamSize + ", \"TeamCount\":" + TeamCount + ", \"EnvironmentId\":\"" + EnvironmentId + "\" }" });

        State = "inParty";
        var gameFinder = client.DependencyResolver.Resolve<GameFinder>();
        var t = gameFinder.WhenGameFoundAsync(CancellationToken.None);

        await party.UpdatePlayerStatus(PartyUserStatus.Ready);
        State = "searching game";

        var ev = await t;
        State = "found game";
        return await client.ConnectToPrivateScene(ev.Data.ConnectionToken, gameSessionInitializer);
    }




    public class ReplicatedGameObject : ComponentData
    {
        public ReplicatedGameObject() { }
        public ReplicatedGameObject(GameObject gameObject)
        {
            GameObject = gameObject;
        }
        public GameObject GameObject { get; }

        public override void Configure(ComponentConfigurationContext ctx)
        {

        }
    }
}
