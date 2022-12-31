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
    public partial class ReportForm2 : Form
    {
        public ReportForm2()
        {
            InitializeComponent();
        }

        private void ReportForm2_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConnectionHelper.ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Customers", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Customers");
                    da.SelectCommand.CommandText = "SELECT * FROM Products";
                    da.Fill(ds, "Products");
                    da.SelectCommand.CommandText = "SELECT * FROM Orders";
                    da.Fill(ds, "Orders");
                    da.SelectCommand.CommandText = "SELECT * FROM OrderItems";
                    da.Fill(ds, "OrderItems");
                    Report2 rpt = new Report2();
                    rpt.SetDataSource(ds);
                    this.crystalReportViewer1.ReportSource= rpt;
                    this.crystalReportViewer1.Refresh();
                }
            }
        }
    }
}
