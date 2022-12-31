using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace R52_M6_Class_01_Work_01
{
    public partial class Ex_02 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            this.Label1.Text += "Edit clicked <br>";
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            this.Label1.Text += "Action cancelled<br>";
        }
    }
}