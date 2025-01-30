using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project_App.Functionality;
using Project_App.Service;

namespace Project_App.Account
{
    public partial class Login : System.Web.UI.Page
    {
        IUserOperation userOperation;
        public Login()
        {
            userOperation = new UserOperation();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = Name_Box.Text;
            string password = password_Box.Text;
            int temp = userOperation.Login(name, password);
            Console.WriteLine(temp);
            if (temp > 0)
            {
                Session["Name"] = name;
                Response.Redirect("~/Account/Dashboard.aspx?value=" + name);
            }
            else
            {
                Response.Write("Error Logging In");
            }

            Response.End();
        }


    }
}