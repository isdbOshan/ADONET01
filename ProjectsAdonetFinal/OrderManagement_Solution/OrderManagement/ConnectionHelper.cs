using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrderManagement
{
    public static class ConnectionHelper
    {
        public static string ConnectionString
        {
            get
            {
                string db = Path.Combine(Path.GetFullPath(@"..\..\"), "OrderManagement.mdf");
                return  $@"Data Source=(localdb)\mssqllocaldb;AttachDbFilename={db};Initial Catalog=OrderManagement;Trusted_Connection=True";
            }
        }
    }
}
