using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace R52_M5_Class_03_Work_01
{
    public partial class Form1 : Form
    {
        DataSet ds;
        BindingSource bsP = new BindingSource();
        BindingSource bsM = new BindingSource();
        
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            //CreateTestData();
            LoadAndSetuo();
        }

        private void LoadAndSetuo()
        {
            ds= new DataSet();
            using (SqlConnection con = new SqlConnection(DbConnectionHelper.ConString))
            {
                using(SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Projects", con))
                {
                    da.Fill(ds, "Projects");
                    da.SelectCommand.CommandText = "SELECT * FROM Milestones";
                    da.Fill(ds, "Milestones");
                    ds.Relations.Add(new DataRelation(
                        "FK_P_M",
                        ds.Tables["Projects"].Columns["ProjectId"],
                         ds.Tables["Milestones"].Columns["ProjectId"]
                        ));
                    bsP.DataSource = ds;
                    bsP.DataMember = "Projects";
                    bsM.DataSource = bsP;
                    bsM.DataMember = "FK_P_M";
                    

                    lblId.DataBindings.Add("Text", bsP, "ProjectId");
                    lblTitle.DataBindings.Add("Text", bsP, "ProjectTitle");
                    lblStart.DataBindings.Add("Text", bsP, "StartDate");

                    this.dataGridView1.DataSource = bsM;
                }
            }
        }

        private void CreateTestData()
        {
            using(SqlConnection con = new SqlConnection(DbConnectionHelper.ConString))
            {
                con.Open();
                for(var i=1;i<=3;i++)
                {
                    string sql = "INSERT INTO Projects VALUES (@i, @t, @s)";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@i", i);
                        cmd.Parameters.AddWithValue("@t", "Project " +i);
                        cmd.Parameters.AddWithValue("@s", DateTime.Now.AddMonths(-(i*5)));
                        cmd.ExecuteNonQuery();
                    }
                }
                for (var i = 1; i <= 3; i++)
                {
                    string sql = "INSERT INTO Milestones VALUES (@i, @t, @c, @p)";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@i", i);
                        cmd.Parameters.AddWithValue("@t", "Milestone " + 1);
                        cmd.Parameters.AddWithValue("@c", DateTime.Now.AddMonths(-(i * 2)));
                        cmd.Parameters.AddWithValue("@p",i);
                        cmd.ExecuteNonQuery();
                        
                    }
                    
                }
                con.Close();
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
           if(bsP.Position < bsP.Count - 1)
            {
                bsP.MoveNext();
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            bsP.MoveFirst();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            bsP.MoveLast();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (bsP.Position > 0)
            {
                bsP.MovePrevious();
            }
        }
    }
}
