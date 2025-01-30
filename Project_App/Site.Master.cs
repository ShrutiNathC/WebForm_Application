using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_App
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Name"] == null)
            {
                anonymoustemp.Visible = true;
                logintemp.Visible = false;
            }
            else
            {
                logintemp.Visible = true;
                anonymoustemp.Visible = false;
            }

        }
    }
}