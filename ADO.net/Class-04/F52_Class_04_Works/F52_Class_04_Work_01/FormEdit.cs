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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace F52_Class_04_Work_01
{
    public partial class FormEdit : Form
    {
        public FormEdit()
        {
            InitializeComponent();
        }

        private void FormEdit_Load(object sender, EventArgs e)
        {
            LoadCombo();
        }

        private void LoadCombo()
        {
            using (SqlConnection con = new SqlConnection(DbConHelper.ConStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT id FROM Books", con))
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        comboBox1.Items.Add(dr.GetInt32(0).ToString());
                    }
                    con.Close();
                    
                }
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(DbConHelper.ConStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Books WHERE id=@i", con))
                {
                    cmd.Parameters.AddWithValue("@i", comboBox1.Text);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        textBox2.Text = dr.GetString(1);
                        dateTimePicker1.Value = dr.GetDateTime(2);
                        textBox3.Text = dr.GetDecimal(3).ToString("0.00");
                    }
                    con.Close();

                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(DbConHelper.ConStr))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Books SET Title= @t, PublishDate=@p,CoverPrice= @r WHERE id=@i", con))
                {
                    cmd.Parameters.AddWithValue("@i", this.comboBox1.Text);
                    cmd.Parameters.AddWithValue("@t", this.textBox2.Text);
                    cmd.Parameters.AddWithValue("@p", this.dateTimePicker1.Value);
                    cmd.Parameters.AddWithValue("@r", this.textBox3.Text);
                    con.Open();
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Data updated", "Success", MessageBoxButtons.OK,
                            MessageBoxIcon.Information);
                        
                    }
                    con.Close();
                }
            }
        }
    }
}
