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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace R52_M5_Class_06_Work_01
{
    public partial class FormInsert : Form
    {
        string imageFileName = "";
        string imageFileFullName = "";
        public FormInsert()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if(this.openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                this.imageFileFullName = openFileDialog1.FileName;
                string ext = Path.GetExtension(openFileDialog1.FileName);
                this.imageFileName = Path.GetFileNameWithoutExtension(Path.GetRandomFileName())+ext;
                this.pictureBox1.Image = Image.FromFile(this.openFileDialog1.FileName);
            }
        }

        private void FormInsert_Load(object sender, EventArgs e)
        {
            GetId();
        }
        private void GetId()
        {
            using (SqlConnection con = new SqlConnection(DbConnectionHelper.ConStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT ISNULL(MAX(ProductId),0)+1 FROM Products", con))
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
            File.Copy(imageFileFullName, Path.Combine(Path.GetFullPath(@"..\..\"), "Pictures", imageFileName), true);
            using (SqlConnection con = new SqlConnection(DbConnectionHelper.ConStr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Products VALUES (@i, @n, @p, @m, @e)", con))
                {
                    cmd.Parameters.AddWithValue("@i", this.textBox1.Text);
                    cmd.Parameters.AddWithValue("@n", this.textBox2.Text);
                    cmd.Parameters.AddWithValue("@p", imageFileName);
                    cmd.Parameters.AddWithValue("@m", this.dateTimePicker1.Value);
                    cmd.Parameters.AddWithValue("@e", numericUpDown1.Value);
                    con.Open();
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Data Saved", "Success", MessageBoxButtons.OK,
                            MessageBoxIcon.Information);
                        textBox1.Clear();
                        textBox2.Clear();
                        numericUpDown1.Value=0;
                        imageFileName = "";
                        pictureBox1.Image = null;
                        
                        dateTimePicker1.Value = DateTime.Today;
                    }
                    con.Close();
                }
            }
        }
    }
}
