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

namespace OrderManagement
{
    public partial class Form1 : Form
    {
        DataTable dt = new DataTable();
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConnectionHelper.ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Products", con))
                {
                    da.Fill(dt);
                }
            }
            DataGridViewComboBoxColumn col1 = new DataGridViewComboBoxColumn();
            col1.DataPropertyName = "ProductId";
            col1.DisplayMember = "ProductName";
            col1.ValueMember = "ProductId";
            col1.DataSource = dt;

            this.dataGridView1.Columns.Add(col1);
            //DataGridViewTextBoxColumn col2 = new DataGridViewTextBoxColumn();
            //col2.DataPropertyName = "Price";
            //col2.ReadOnly = true;
            //this.dataGridView1.Columns.Add(col2);
            DataGridViewTextBoxColumn col3 = new DataGridViewTextBoxColumn();
            col3.DataPropertyName = "Quantity";
            this.dataGridView1.Columns.Add(col3);
           
        }

        private void button1_Click(object sender, EventArgs e)
        {
            dataGridView1.EndEdit();
            List<Data> values = new List<Data>();
            
            for(int i=0; i< dataGridView1.Rows.Count; i++)
            {
                int? v1=null, v2=null;
                if (dataGridView1.Rows[i].Cells[0].Value!=null)
                {
                    v1 = int.Parse(dataGridView1.Rows[i].Cells[0].Value.ToString());
                }
                if (dataGridView1.Rows[i].Cells[1].Value != null)
                {
                    v2 = int.Parse(dataGridView1.Rows[i].Cells[2].Value.ToString());
                }
                if(v1.HasValue && v2.HasValue)
                {
                    values.Add(new Data { v1=v1.Value, v2=v2.Value });
                }
            }
        }
    }
}
public class Data
{
    public int v1 { get; set; }
    public int v2 { get; set; }
}
