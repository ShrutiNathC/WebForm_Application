using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project_App.Functionality;
using Project_App.Models;
using Project_App.Service;

namespace Project_App.Account
{
    public partial class Register : System.Web.UI.Page
    {
        IUserOperation userOperation;
        public Register()
        {
            userOperation = new UserOperation();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Users users = new Users
            {
                Name = Name_txt.Text,
                Password = password_txt.Text,
                Email = EmailBox.Text
            };

            int temp = userOperation.createAccount(users);
            if (temp > 0)
            {
                Response.Redirect("~/Account/Login");
            }
            else
            {
                Response.Write("Error creating user");
            }
        }
    }
}