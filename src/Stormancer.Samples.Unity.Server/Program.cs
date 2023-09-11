using Stormancer.Server.Hosting;

namespace Stormancer.Samples.Unity.Server
{
    public class Program
    {
        public static Task Main(string[] args)
        {

            return ServerApplication.Run(builder => builder
               .Configure(args)
               .AddAllStartupActions()
            );
        }
    }
}