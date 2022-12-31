﻿using System;
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

namespace OrderManagement.Products
{
    public partial class ProductEdit : Form
    {
        string pictureName = "", oldPictrureName = "";
        public ProductEdit()
        {
            InitializeComponent();
        }

        private void ProductEdit_Load(object sender, EventArgs e)
        {
            LoadComboBox();
        }

        private void LoadComboBox()
        {
            using(SqlConnection con = new SqlConnection(ConnectionHelper.ConnectionString))
            {
                using(SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Products", con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    this.comboBox1.DataSource= dt;
                }
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConnectionHelper.ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Products WHERE ProductId=@i", con))
                {
                    cmd.Parameters.AddWithValue("@i", comboBox1.SelectedValue);
                    con.Open();
                    SqlDataReader dr= cmd.ExecuteReader();
                    if(dr.Read())
                    {
                        textBox2.Text = dr.GetString(1);
                        textBox3.Text= dr.GetDecimal(2).ToString("0.00");
                        dateTimePicker1.Value= dr.GetDateTime(3);
                        pictureBox1.Image = Image.FromFile(Path.Combine(@"..\..\Pictures", dr.GetString(4).ToString()));
                        checkBox1.Checked= dr.GetBoolean(5);
                        oldPictrureName= dr.GetString(4);
                    }
                    con.Close();
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                this.pictureBox1.Image = Image.FromFile(openFileDialog1.FileName);
                this.pictureName = this.openFileDialog1.FileName;
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if(MessageBox.Show("Are your sure to delete?", "Confirm", MessageBoxButtons.YesNo, MessageBoxIcon.Question)== DialogResult.Yes)
            {
                using (SqlConnection con = new SqlConnection(ConnectionHelper.ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("DELETE Products WHERE ProductId=@i", con))
                    {
                        cmd.Parameters.AddWithValue("@i", comboBox1.SelectedValue);
                        con.Open();
                        try
                        {
                            cmd.ExecuteNonQuery();
                            MessageBox.Show("Data deleted", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            LoadComboBox();
                            con.Close();
                        }
                        catch(Exception ex)
                        {
                            MessageBox.Show($"Data delete failed: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                        finally
                        {
                            if(con.State == ConnectionState.Open)
                            {
                                con.Open();
                            }
                        }
                        
                    }
                }
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConnectionHelper.ConnectionString))
            {
                con.Open();
                using (SqlTransaction tran = con.BeginTransaction())
                {
                    using (SqlCommand cmd = new SqlCommand(@"UPDATE Products 
                                            SET ProductName=@n, Price=@p, ExpireDate=@e, Picture=@pic, IsAvailable=@a WHERE
                                            ProductId =@i", con, tran))
                    {
                        cmd.Parameters.AddWithValue("@i", comboBox1.SelectedValue);
                        cmd.Parameters.AddWithValue("@n", textBox2.Text);
                        cmd.Parameters.AddWithValue("@p", textBox3.Text);
                        cmd.Parameters.AddWithValue("@e", dateTimePicker1.Value);
                        cmd.Parameters.AddWithValue("@a", checkBox1.Checked);
                        if (!string.IsNullOrEmpty(pictureName))
                        {
                            string ext = Path.GetExtension(this.pictureName);
                            string fileName = $"{Path.GetFileNameWithoutExtension(Path.GetRandomFileName())}{ext}";
                            string savePath = Path.Combine(Path.GetFullPath(@"..\..\Pictures"), fileName);
                            File.Copy(pictureName, savePath, true);
                            cmd.Parameters.AddWithValue("@pic", fileName);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@pic", oldPictrureName);
                        }
                        try
                        {
                            if (cmd.ExecuteNonQuery() > 0)
                            {
                                MessageBox.Show("Data Saved", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);

                                tran.Commit();
                                
                                pictureName = "";
                            }
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show($"Error: {ex.Message}", "Success", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            tran.Rollback();
                        }
                        finally
                        {
                            if (con.State == ConnectionState.Open)
                            {
                                con.Close();
                            }
                        }
                        con.Close();
                    }
                }
            }
        }
    }
}
