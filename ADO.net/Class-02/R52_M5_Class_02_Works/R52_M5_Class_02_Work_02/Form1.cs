using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace R52_M5_Class_02_Work_02
{
    public partial class Form1 : Form
    {
        BindingSource bsCustomer = new BindingSource();
        BindingSource bsOrder = new BindingSource();
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            LoadData();
        }

        private void LoadData()
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Customers", con))
                {
                    da.Fill(ds, "Customers");
                    da.SelectCommand.CommandText = "SELECT * FROM Orders";
                    da.Fill(ds, "Orders");
                    DataRelation rel = new DataRelation(
                        "FK_Cust_Ord",
                        ds.Tables["Customers"].Columns["CustomerId"],
                        ds.Tables["Orders"].Columns["CustomerId"]
                        );
                    ds.Relations.Add(rel);
                    bsCustomer.DataSource = ds;
                    bsCustomer.DataMember = "Customers";
                    bsOrder.DataSource = bsCustomer;
                    bsOrder.DataMember = "FK_Cust_Ord";

                    this.dataGridView1.DataSource = bsCustomer;
                    this.dataGridView2.DataSource= bsOrder;
                }
            }
        }
    }
}
