using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace F52_Class_04_Work_01
{
    public static class DbConHelper
    {
        public static string ConStr
        {
            get
            {
                string db = Path.Combine(Path.GetFullPath(@"..\..\"), "M5C5.mdf");
                return $@"Data Source=(localdb)\mssqllocaldb;AttachDbFilename={db};Trusted_Connection=True";
            }
        }
    }
}
