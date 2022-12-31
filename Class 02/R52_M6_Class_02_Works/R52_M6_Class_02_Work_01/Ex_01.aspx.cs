using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace R52_M6_Class_02_Work_01
{
    public partial class Ex_01 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadImages();
        }

        private void LoadImages()
        {
            DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/Uploads"));
            this.Repeater1.DataSource= di.GetFiles().ToList()
                .Select(f => new { file = f.Name })
                .ToList();
            this.Repeater1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                if(FileUpload1.PostedFile.ContentLength> 0)
                {
                    string ext = Path.GetExtension(FileUpload1.FileName);
                    string fileName = Path.GetFileNameWithoutExtension(Path.GetRandomFileName()) + ext;
                    string savePath = Path.Combine(Server.MapPath("~/Uploads"), fileName);
                    FileUpload1.PostedFile.SaveAs(savePath);
                    alert.Visible = true;
                    LoadImages();
                }
            }
        }
    }
}