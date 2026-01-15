using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace webtabanliproje
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Uygulama başlangıcında çalışan kod
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            EnsureDatabase();
        }

        private void EnsureDatabase()
        {
            try
            {
                // Check and create Messages table if not exists
                string checkTableQuery = "SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Messages'";
                object result = SqlHelper.ExecuteScalar(checkTableQuery);
                int count = result != null ? Convert.ToInt32(result) : 0;

                if (count == 0)
                {
                    string createTableQuery = @"
                        CREATE TABLE [Messages] (
                            [Id] INT IDENTITY(1,1) PRIMARY KEY,
                            [SenderName] NVARCHAR(100) NOT NULL,
                            [SenderEmail] NVARCHAR(100) NOT NULL,
                            [MessageContent] NVARCHAR(MAX) NOT NULL,
                            [SentDate] DATETIME DEFAULT GETDATE(),
                            [IsRead] BIT DEFAULT 0
                        );";
                    SqlHelper.ExecuteNonQuery(createTableQuery);
                }
            }
            catch (Exception)
            {
                // Ignore errors if DB is not ready or connection fails during startup
            }
        }
    }
}