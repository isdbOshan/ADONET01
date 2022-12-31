using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace R52_M5_Class_03_Work_01
{
    public static class DbConnectionHelper
    {
        public static string ConString {
            get
            {
                string dbPath= Path.GetFullPath(@"..\..");
                return $@"Data Source=(localdb)\mssqllocaldb;AttachDbFileName={dbPath}\ProjectDb.mdf;Trusted_Connection=True";
            }
        }
    }
}
