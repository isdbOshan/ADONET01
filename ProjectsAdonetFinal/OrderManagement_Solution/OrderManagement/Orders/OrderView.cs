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

namespace OrderManagement.Orders
{
    public partial class OrderView : Form
    {
        DataSet ds = new DataSet(); 
        BindingSource bso= new BindingSource();
        BindingSource bsoi = new BindingSource();
        public OrderView()
        {
            InitializeComponent();
        }

        private void OrderView_Load(object sender, EventArgs e)
        {
            LoadData();
            AddRelations();
            BindControls();
        }

        private void BindControls()
        {
            bso.DataSource = ds;
            bso.DataMember = "Orders";
            bsoi.DataSource = bso;
            bsoi.DataMember = "FK_O_OI";
            lblId.DataBindings.Add(new Binding("Text", bso, "OrderId"));
            lblOrderDate.DataBindings.Add(new Binding("Text", bso, "OrderDate"));
            lblDeliveryDate.DataBindings.Add(new Binding("Text", bso, "DeliveryDate"));
            lblCustomer.DataBindings.Add(new Binding("Text", bso, "CustomerName"));
            this.dataGridView1.DataSource = bsoi;
        }

        public void LoadData()
        {
            
            if(ds.Tables.Count > 0)
            {
                if (ds.Tables["OrderItems"].Rows.Count > 0)
                {
                    ds.Tables["OrderItems"].Rows.Clear();
                }
                if (ds.Tables["Orders"].Rows.Count > 0)
                {
                    ds.Tables["Orders"].Rows.Clear();
                }
            }
            using (SqlConnection con = new SqlConnection(ConnectionHelper.ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(@"SELECT OrderId, OrderDate, DeliveryDate, c.CustomerId, CustomerName 
                                                                FROM Orders o
                                                                INNER JOIN Customers c ON o.CustomerId = c.CustomerId", con))
                {
                    
                    da.Fill(ds, "Orders");
                    da.SelectCommand.CommandText = @"SELECT OrderId, ProductName,Price, Quantity
                                                    FROM OrderItems oi
                                                    INNER JOIN Products p ON oi.ProductId = p.ProductId";
                    da.Fill(ds, "OrderItems");
                    

                }
            }
        }

        private void AddRelations()
        {
            ds.Tables["Orders"].PrimaryKey = new DataColumn[] { ds.Tables["Orders"].Columns["OrderId"] };
            DataRelation rel = new DataRelation("FK_O_OI",
                ds.Tables["Orders"].Columns["OrderId"],
                ds.Tables["OrderItems"].Columns["OrderId"]);
            ds.Relations.Add(rel);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            bso.MoveFirst();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            bso.MoveLast();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if(bso.Position > 0)
            {
                bso.MovePrevious();
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (bso.Position < bso.Count-1)
            {
                bso.MoveNext();
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            new OrderAdd { MainOrderForm = this }.ShowDialog();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            int orderid  = int.Parse((bso.Current as DataRowView).Row["OrderId"].ToString());
            new OrderItemAdd { MainOrderForm = this, OrderId=orderid }.ShowDialog();
        }
    }
}
