using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace R52_M5_Class_05_Work_01
{
    public static class DbConnectionHelper
    {
        public static string ConStr { get => $@"Data Source=(localDb)\mssqllocaldb;AttachDbFilename={Path.Combine(Path.GetFullPath(@"..\..\"), "M5C05Db.mdf")};Trusted_Connection=True"; }
    }
}
