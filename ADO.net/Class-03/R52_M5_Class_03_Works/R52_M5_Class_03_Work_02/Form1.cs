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
    public partial class Form1 : Form
    {
        DataSet ds;
        public Form1()
        {
            InitializeComponent();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            LoadData();
        }

        public void LoadData()
        {
            ds = new DataSet();
            using (SqlConnection con = new SqlConnection(DbConnectionHelper.ConString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Trainees", con))
                {
                    da.Fill(ds, "Trainees");
                    this.dataGridView1.DataSource = ds.Tables["Trainees"];
                }
            }
        }

        private void addToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new AddTrainee { OpenedBy=this}.ShowDialog();
        }
    }
}
