using Stormancer.Replication;
using Stormancer.Unity3D;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace Assets.Companies.Stormancer.Replication
{
    public abstract class ReplicationBehavior : MonoBehaviour
    {
        private MultiplayerFlow _flow;

        public abstract void ConfigureEntity(Entity entity);

        /// <summary>
        /// The entity associated with the game object.
        /// </summary>
        public Entity Entity { get; set; }


        protected virtual void Start()
        {
           
            var parent = this.transform.parent.gameObject.GetComponentInParent<ReplicationBehavior>();
            if (parent == null)
            {
                _flow = GetComponentInParent<MultiplayerFlow>();
            }
        }

        protected virtual void Update()
        {
           
            if (_flow != null && Entity == null && _flow.ReplicationReady)
            {
                _flow.AddGameObject(this.gameObject);
            }
        }

        protected virtual void OnDestroy()
        {
            if (_flow != null && Entity !=null && Entity.IsAuthority)
            {
                _flow.DestroyGameObject(Entity);
            }
        }
    }

}