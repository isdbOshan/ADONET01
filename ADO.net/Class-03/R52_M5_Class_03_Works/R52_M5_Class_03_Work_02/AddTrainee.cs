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

namespace R52_M5_Class_03_Work_02
{
    public partial class AddTrainee : Form
    {
        public AddTrainee()
        {
            InitializeComponent();
        }
        public Form1 OpenedBy { get; set; }
        private void AddTrainee_Load(object sender, EventArgs e)
        {
            CreateId();
        }

        private void CreateId()
        {
            using (SqlConnection con = new SqlConnection(DbConnectionHelper.ConString))
            {

                using (SqlCommand cmd = new SqlCommand("SELECT ISNULL(COUNT(TraineeId), 0)+1 FROM Trainees", con))
                {
                    con.Open();
                    int id = (int)cmd.ExecuteScalar();
                    con.Close();
                    textBox1.Text = id.ToString();
                }

            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(DbConnectionHelper.ConString))
            {

                using (SqlCommand cmd = new SqlCommand("INSERT INTO Trainees VALUES(@i, @n, @c, @b, @r)", con))
                {
                    cmd.Parameters.AddWithValue("@i", textBox1.Text);
                    cmd.Parameters.AddWithValue("@n", textBox2.Text);
                    cmd.Parameters.AddWithValue("@c", textBox3.Text);
                    cmd.Parameters.AddWithValue("@b", dateTimePicker1.Value);
                    cmd.Parameters.AddWithValue("@r", checkBox1.Checked);
                    con.Open();
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Data Saved", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        textBox1.Clear();
                        textBox2.Text = "";
                        textBox3.Clear();
                        dateTimePicker1.Value = DateTime.Today;
                        checkBox1.Checked = false;
                    }
                    con.Close();
                    CreateId();


                }

            }
        }

        private void AddTrainee_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.OpenedBy.LoadData();
        }
    }
}
