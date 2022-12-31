using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace R52_M5_Class_05_Work_01
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            string picPath = Path.GetFullPath(@"..\..\Pictures");
            using(SqlConnection con= new SqlConnection(DbConnectionHelper.ConStr))
            {
                using(SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Employees", con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    dt.Columns.Add(new DataColumn("Image", typeof(System.Byte[])));
                    for(var i=0; i< dt.Rows.Count; i++)
                    {

                        dt.Rows[i]["Image"] = 
                            File.ReadAllBytes(Path.Combine(picPath, dt.Rows[i]["Picture"].ToString()));
                    }
                    this.dataGridView1.AutoGenerateColumns= false;
                    this.dataGridView1.DataSource= dt;
                }
            }
        }
    }
}
