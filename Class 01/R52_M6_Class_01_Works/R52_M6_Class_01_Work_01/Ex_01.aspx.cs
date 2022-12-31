using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace R52_M6_Class_01_Work_01
{
    public partial class Ex_01 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.Label1.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            this.TextBox1.Text = this.TextBox1.Text.ToUpper();
        }
    }
}