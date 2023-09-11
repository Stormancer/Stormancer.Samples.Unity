using Stormancer.Replication;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assets.Companies.Stormancer.Replication
{
    /// <summary>
    /// Provides information to other behaviors regarding the replicated entity associated with the Game object.
    /// </summary>
    public class ReplicationStateBehavior : ReplicationBehavior
    {


        public bool IsAuthority
        {
            get
            {
                return Entity.IsAuthority;
            }
        }
        public override void ConfigureEntity(Entity entity)
        {
        }

       
    }
}
