using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace OrderManagement.Reports
{
    public partial class ReportForm1 : Form
    {
        public ReportForm1()
        {
            InitializeComponent();
        }

        private void ReportForm1_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConnectionHelper.ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Customers", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Customers");
                    Report1 rpt= new Report1();
                    rpt.SetDataSource(ds);
                    this.crystalReportViewer1.ReportSource= rpt;
                    this.crystalReportViewer1.Refresh();


                   

                }
            }
        }
    }
}
