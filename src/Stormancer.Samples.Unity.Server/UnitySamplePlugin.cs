using Stormancer.Plugins;
using Stormancer.Server;
using Stormancer.Server.Plugins.GameFinder;
using Stormancer.Server.Plugins.Party;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Stormancer.Samples.Unity.Server
{
    internal class UnitySamplePlugin : IHostPlugin
    {
        private const string GAME_SESSION = "unityGameSession";
        private const string GAME_FINDER = "gamefinder-unity";

        public void Build(HostPluginBuildContext ctx)
        {
            ctx.HostStarting += (IHost host) =>
            {
                host.ConfigureGamefinderTemplate(GAME_FINDER, static c => c
                .ConfigureQuickQueue(static options => options
                    .GameSessionTemplate(GAME_SESSION)
                    .AllowJoinExistingGame(true)
                    .TeamCount(4)
                    .TeamSize(1)
                    )
                );

                host.ConfigureGameSession(GAME_SESSION, static b => b
                .EnablePeerDirectConnection(true)
                .CustomizeScene(static s => { })
                );
            };

            ctx.HostStarted += (IHost host) =>
            {
                host.ConfigurePlayerParty(b => b);

                host.EnsureSceneExists("services", "services", false, true);
                host.AddGamefinder(GAME_FINDER, GAME_FINDER);
            };
        }
    }
}
