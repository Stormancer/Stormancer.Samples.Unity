#nullable enable

using Stormancer.Plugins;
using Stormancer.Replication;
using Stormancer.Unity3D;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using UnityEngine;

namespace Stormancer.Samples.Unity
{
    public enum OnlineState
    {
        NotConnected,
        Authenticating,
        Authenticated,
        JoingingParty,
        InParty,
        JoiningGameSession,
        InGameSession,
        Error = -1
    }

    public class OnlineManager : MonoBehaviour
    {
        //Should be set in the scene
        public string Endpoint = null!;
        public string Account = null!;
        public string App = null!;

        public OnlineState OnlineState = OnlineState.NotConnected;

        private Client? _stormancerClient;
        private TaskCompletionSource<bool> _ConnectToGameSessionTcs = new TaskCompletionSource<bool>();
        private string? _myUserId;

        // Start is called before the first frame update
        async Task Start()
        {
            ClientFactory.SetConfigFactory(() =>
            {

                var config = ClientConfiguration.Create(Endpoint, Account, App);
                config.Logger = new UnityLogger(Stormancer.Diagnostics.LogLevel.Debug, "stormancer." + this.name);
                config.Plugins.Add(new AuthenticationPlugin());
                config.Plugins.Add(new PartyPlugin());
                config.Plugins.Add(new GameFinderPlugin());
                config.Plugins.Add(new GameSessionPlugin());
                return config;
            });

            _stormancerClient = ClientFactory.GetClient(0);

            var gameFinderApi = _stormancerClient.DependencyResolver.Resolve<GameFinder>();
            gameFinderApi.OnGameFinderStateChanged += (GameFinderStatusChangedEvent evt) =>
            {
                Debug.Log($"gamefinder '{evt.GameFinder}' status changed to {evt.Status}");
            };

            gameFinderApi.OnGameFound += (GameFoundEvent gameFoundEvent) =>
            {
                if (OnlineState != OnlineState.JoiningGameSession)
                {
                    return;
                }

                async Task ConnectToGameSession()
                {
                    var gameSessions = _stormancerClient.DependencyResolver.Resolve<GameSession>();
                    try
                    {
                        await _stormancerClient.ConnectToPrivateScene(gameFoundEvent.Data.ConnectionToken, _ => { });

                        _ConnectToGameSessionTcs.TrySetResult(true);
                    }
                    catch (Exception ex)
                    {
                        _ConnectToGameSessionTcs.TrySetException(ex);
                    }
                }

                _ = ConnectToGameSession();
            };

            await Connect();

            await CreateParty();

            await SignalPartyReady();
        }

        private async Task Connect()
        {
            OnlineState = OnlineState.Authenticating;
            try
            {
                //m_stormancerClient was set inside the Start() method
                var users = _stormancerClient!.DependencyResolver.Resolve<UserApi>();
                users.OnGetAuthParameters = () => Task.FromResult(new AuthParameters { Type = "ephemeral", Parameters = new Dictionary<string, string> { } });
                await users.Login();
                _myUserId = users.UserId;
                OnlineState = OnlineState.Authenticated;
            }
            catch (Exception ex)
            {
                OnlineState = OnlineState.Error;
                Debug.LogException(ex);
                throw;
            }
        }

        private async Task CreateParty()
        {
            EnsureStormancerClientSet();

            OnlineState = OnlineState.JoingingParty;
            try
            {
                var parties = _stormancerClient!.DependencyResolver.Resolve<PartyApi>();

                var party = await parties.CreateParty(new PartyRequestDto { GameFinderName = "gamefinder-unity" });
                OnlineState = OnlineState.InParty;
            }
            catch (Exception ex)
            {
                OnlineState = OnlineState.Error;
                Debug.LogException(ex);
                throw;
            }
        }

        public async Task SignalPartyReady()
        {
            EnsureStormancerClientSet();

            OnlineState = OnlineState.JoiningGameSession;
            var parties = _stormancerClient!.DependencyResolver.Resolve<PartyApi>();
            await parties.UpdatePlayerStatus(PartyUserStatus.Ready);
            await _ConnectToGameSessionTcs.Task;
            await parties.UpdatePlayerStatus(PartyUserStatus.NotReady);
            OnlineState = OnlineState.InGameSession;
        }

        private void EnsureStormancerClientSet()
        {
            if (_stormancerClient == null)
            {
                throw new InvalidOperationException("Stormancer client was destroyed");
            }
        }

        public void OnDestroy()
        {
            _stormancerClient?.Dispose();
            _stormancerClient = null;
            _myUserId = null;
            OnlineState = OnlineState.NotConnected;
        }
    }
}
