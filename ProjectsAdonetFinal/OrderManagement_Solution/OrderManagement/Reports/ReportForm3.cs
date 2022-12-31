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

namespace OrderManagement.Reports
{
    public partial class ReportForm3 : Form
    {
        public ReportForm3()
        {
            InitializeComponent();
        }

        private void ReportForm3_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConnectionHelper.ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Products", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Products1");
                    ds.Tables["Products1"].Columns.Add(new DataColumn("image", typeof(System.Byte[])));
                    for (var i = 0; i < ds.Tables["Products1"].Rows.Count; i++)
                    {
                        ds.Tables["Products1"].Rows[i]["image"] = File.ReadAllBytes(Path.Combine(Path.GetFullPath(@"..\..\Pictures"), ds.Tables["Products1"].Rows[i]["Picture"].ToString()));
                    }
                    Report3 rpt= new Report3();
                    rpt.SetDataSource(ds);
                    this.crystalReportViewer1.ReportSource= rpt;
                    this.crystalReportViewer1.Refresh();
                }
            }
        }
    }
}
