using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace R52_M5_Class_03_Work_02
{
    public static class DbConnectionHelper
    {
        public static string ConString
        {
            get
            {
                string dbPath = Path.GetFullPath(@"..\..");
                return $@"Data Source=(localdb)\mssqllocaldb;AttachDbFileName={dbPath}\Trainee.mdf;Trusted_Connection=True";
            }
        }
    }
}
