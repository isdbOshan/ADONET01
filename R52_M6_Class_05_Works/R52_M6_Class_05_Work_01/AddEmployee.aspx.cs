using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace R52_M6_Class_05_Work_01
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            string fileName = "";
            var fu = FormView1.FindControl("fu") as FileUpload;
            if (fu != null)
            {
                if (fu.HasFile)
                {
                    if(fu.PostedFile.ContentLength> 0){
                        string ext = Path.GetExtension(fu.PostedFile.FileName);
                        fileName = Path.GetFileNameWithoutExtension(Path.GetRandomFileName()) + ext;
                        string savePath = Server.MapPath("~/Pictures/")+ fileName;
                        fu.PostedFile.SaveAs(savePath);
                        e.Values["Picture"] = fileName;
                        alertSuccess.Visible= true;
                    }
                    else
                    {
                        e.Cancel = true;
                        alertFailed.Visible = true;
                    }
                }
                else
                {
                    e.Cancel = true;
                    alertFailed.Visible = true;
                }
            }
            else
            {
                e.Cancel = true;
                alertFailed.Visible = true;
            }
            
        }
    }
}