using UnityEngine;
using System.Collections;
using System;
using System.Threading.Tasks;
using System.Collections.Concurrent;

namespace Stormancer
{
    public class StormancerSceneBehaviour : MonoBehaviour
    {
        // Public fields
        public string AccountId;
        public string Application;
        public string SceneId;
        private Scene _scene;

        private bool _isConnected = false;
        public bool IsConnected
        {
            get
            {
                return this._isConnected;
            }
        }

        public Scene Scene
        {
            get
            {
                return this._scene;
            }
        }
        
        private Client _client;

        private TaskCompletionSource<Scene> _connectedTcs = new TaskCompletionSource<Scene>();

        public Task<Scene> ConnectedTask
        {
            get
            {
                return this._connectedTcs.Task;
            }
        }


        // Use this for initialization
        public async Task<Scene> Connect()
        {
            ClientConfiguration config;
            config = ClientConfiguration.Create("http://api2.stormancer.com:8080", AccountId, Application);
            config.ServerEndpoints = new System.Collections.Generic.List<string>();


            _client = new Client(config);
            Scene scene = null;
            try
            {
                scene = await _client.GetPublicScene(this.SceneId);
                Debug.Log("GetPublicScene Ok");

                lock (this._configLock)
                {
                    this._scene = scene;
                    this._initConfig?.Invoke(this._scene);
                }
                await scene.Connect();
                Debug.Log("Stormancer scene connected");
                this._connectedTcs.SetResult(_scene);
                this._isConnected = true;
            }
            catch (Exception ex)
            {
                this._connectedTcs.SetException(ex);
            }

            return await this.ConnectedTask;
        }

        private object _configLock = new object();
        private Action<Scene> _initConfig = null;

        public void ConfigureScene(Action<Scene> configuration)
        {
            lock (_configLock)
            {
                if (this._scene != null && this._scene.Connected)
                {
                    throw new InvalidOperationException("You must configure the scene before it connects to the server.");
                }
                else
                {
                    this._initConfig += configuration;
                }
            }
        }

        Task _disconnectTask = null;
        public async Task Disconnect()
        {
            if (this._disconnectTask == null)
            {
                var scene = await this.ConnectedTask;
                await scene.Disconnect();
            }
        }

        public void OnDestroy()
        {
            _ = this.Disconnect();
        }

        public void OnApplicationQuit()
        {
            _ = this.Disconnect();
        }
    }
}
