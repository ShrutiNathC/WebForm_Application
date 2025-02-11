﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;
using Project_App.Functionality;
using Project_App.Models;
using Project_App.Service;

namespace Project_App.Account
{
    public partial class Dashboard : System.Web.UI.Page
    {
        IUserOperation userOperation;
        public Dashboard()
        {
            userOperation = new UserOperation();
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            Button2.Visible = false;
            if (!IsPostBack)
            {
                BindGrid();
                //userOperation.GetUsers();

                if (Session["Name"] == null)
                {
                    Response.Redirect("~/Account/Login.aspx");
                }
                string textValue = Session["Name"].ToString();
                Label1.Text = textValue;
            }
        }

        protected void BindGrid()
        {
            List<Users> users = userOperation.GetUsers();
            GridView1.DataSource = users;
            GridView1.DataBind();
        }

        protected void Button1_Submit(object sender, EventArgs e)
        {
            Users users = new Users
            {
                Name = Name_txt.Text,
                Email = Email_txt.Text,
                Password = Password_txt.Text,
            };

            if (string.IsNullOrEmpty(UserIdHiddenField.Value))
            {
                // Create new user
                int temp = userOperation.createAccount(users);
                if (temp > 0)
                {
                    BindGrid();
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
                else
                {
                    Response.Write("Error Adding");
                }
            }
            else
            {
                // Edit existing user
                users.Id = int.Parse(UserIdHiddenField.Value);
                int temp = userOperation.EditAccount(users);
                if (temp > 0)
                {
                    BindGrid();
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
                else
                {
                    Response.Write("Error Editing");
                }
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (e.RowIndex >= 0 && e.RowIndex < GridView1.Rows.Count)
            {
                int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
                if (id == 0)
                {
                    return;
                }
                var temp = userOperation.DeleteAccount(id);
                if (temp > 0)
                {
                    BindGrid();
                }
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            if (e.NewEditIndex >= 0 && e.NewEditIndex < GridView1.Rows.Count)
            {
                int id = Convert.ToInt32(GridView1.DataKeys[e.NewEditIndex].Value);
                Users user = userOperation.GetUsers().FirstOrDefault(u => u.Id == id);
                if (user != null)
                {
                    UserIdHiddenField.Value = user.Id.ToString();
                    Name_txt.Text = user.Name;
                    Email_txt.Text = user.Email;
                    Password_txt.Text = user.Password;
                    Confirm_txt.Text = user.Password;
                    Button1.Text = "Update";
                    Button2.Visible = true;
                }
            }
        }

        protected void Button2_Cancel(object sender, EventArgs e)
        {
            Button2.Visible = false;
            BindGrid();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void Search_TxtBox_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Search_TxtBox.Text))
            {
                string name = Search_TxtBox.Text;
                var searchResults = userOperation.SearchbyName(name);
                if (searchResults != null)
                {
                    GridView1.DataSource = searchResults;
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("No Results Found");
                }

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Search_TxtBox.Text = string.Empty;
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}