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
    public partial class FormView : Form
    {
        public FormView()
        {
            InitializeComponent();
        }

        private void FormView_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            using(SqlConnection con= new SqlConnection(DbConHelper.ConStr))
            {
                using(SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Books", con))
                {
                    da.Fill(dt);
                    this.dataGridView1.DataSource = dt;
                }
            }
        }
    }
}
