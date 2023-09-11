using Stormancer;
using Stormancer.Replication;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace Assets.Companies.Stormancer.Replication
{
    public class TransformReplicationBehavior : ReplicationBehavior
    {
        private TransformComponentData component; 

        public override void ConfigureEntity(Entity entity)
        {
            component = new TransformComponentData();
            entity.AddComponent<TransformComponentData>(this.gameObject.name + ".transform", () => component);
        }

        void FixedUpdate()
        {
            if (component != null)
            {
                if (component.Entity.IsAuthority)
                {
                    component.SetPosition(transform);
                }
                else
                {
                    component.GetPosition(transform);
                }
            }
        }


        private class TransformComponentData : ComponentData
        {



            private const int UPDATE_INTERVAL = 0;

            private Vector3 localPosition;
            private Quaternion localRotation;

            public void SetPosition(Transform transform)
            {
                this.localPosition = transform.localPosition;
                this.localRotation = transform.localRotation;
            }

            public void GetPosition(Transform transform)
            {
                transform.localPosition = localPosition;
                transform.localRotation = localRotation;
            }
            private class StoredData
            {
                public Vector3 Position { get; set; }
                public Quaternion Rotation { get; set; }
            }

            public TransformComponentData() { }
            


            public override void Configure(ComponentConfigurationContext ctx)
            {
                ctx.RegisterReplicationPolicy("near", c => c
                    .ViewPolicy("authority")
                    .Reader(ReadDataFrame)
                    .Writer(WriteDataFrame)
                    .MinSendInterval(UPDATE_INTERVAL)
                    .AutoSend(true)
                    .TriggerPrimaryKeyUpdate());
            }

            private object ReadDataFrame(DataFrameReadContext arg)
            {
                var position = new Vector3(arg.Read<float>(), arg.Read<float>(), arg.Read<float>());
                var rotation = new Quaternion(arg.Read<float>(), arg.Read<float>(), arg.Read<float>(), arg.Read<float>());
                return new StoredData { Position = position, Rotation = rotation };
            }

            private void WriteDataFrame(DataFrameWriteContext obj)
            {
                obj.Write(localPosition.x);
                obj.Write(localPosition.y);
                obj.Write(localPosition.z);
                obj.Write(localRotation.x);
                obj.Write(localRotation.y);
                obj.Write(localRotation.z);
                obj.Write(localRotation.w);
            }

            protected override void OnFrameHistoryUpdated()
            {
                var lastFrame = this.InputFrames.Last;
                if (lastFrame != null)
                {
                    var data = lastFrame.Content<StoredData>();
                    localPosition = data.Position;
                    localRotation = data.Rotation;
                }

            }
        }
    }
}
