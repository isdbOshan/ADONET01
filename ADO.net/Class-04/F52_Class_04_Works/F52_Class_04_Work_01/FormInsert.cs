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

namespace F52_Class_04_Work_01
{
    public partial class FormInsert : Form
    {
        public FormInsert()
        {
            InitializeComponent();
        }

        private void FormInsert_Load(object sender, EventArgs e)
        {
            GetId();
        }

        private void GetId()
        {
            using (SqlConnection con = new SqlConnection(DbConHelper.ConStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT ISNULL(MAX(id),0)+1 FROM Books", con))
                {
                    con.Open();
                    int id = (int)cmd.ExecuteScalar();
                    con.Close();
                    this.textBox1.Text = id.ToString();
                } 
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(DbConHelper.ConStr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Books VALUES (@i, @t, @p, @r)", con))
                {
                    cmd.Parameters.AddWithValue("@i", this.textBox1.Text);
                    cmd.Parameters.AddWithValue("@t", this.textBox2.Text);
                    cmd.Parameters.AddWithValue("@p", this.dateTimePicker1.Value);
                    cmd.Parameters.AddWithValue("@r", this.textBox3.Text);
                    con.Open();
                    if(cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Data Saved", "Success", MessageBoxButtons.OK, 
                            MessageBoxIcon.Information);
                        textBox1.Clear();
                        textBox2.Clear();
                        textBox3.Clear();
                        dateTimePicker1.Value = DateTime.Today;
                    }
                    con.Close();
                }
            }
        }
    }
}
