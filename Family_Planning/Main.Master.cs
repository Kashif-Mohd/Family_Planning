﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Family_Planning
{
    public partial class main : System.Web.UI.MasterPage
    {
        string constr = ConfigurationManager.ConnectionStrings["LocalMySql"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            lbeUserName.Text = Convert.ToString(Session["FP_username"]);


            if (Convert.ToString(Session["FP_userid"]) == "team1" || Convert.ToString(Session["FP_userid"]) == "team2" || Convert.ToString(Session["FP_userid"]) == "team3") 
            {
                navError.Visible = false;
                navMenu.Visible = false;
                navdash.Visible = false;
                navChart.Visible = false;
            }

            if (Session["FP_username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (Convert.ToString(Session["WebForm_FP"]) == "dashboard")
                {
                    navdash.Attributes.Add("class", "nav-item active");
                    Session["WebForm_FP"] = null;
                    lbePage.Text = "DASHBOARD";
                }
                else if (Convert.ToString(Session["WebForm_FP"]) == "form_1")
                {
                    navMenu.Attributes.Add("class", "nav-item active");
                    collapse_Table.Attributes.Add("class", "collapse show");
                    form_1.Attributes.Add("class", "collapse-item active");
                    Session["WebForm_FP"] = null;
                    lbePage.Text = "Form-1";
                }
                else if (Convert.ToString(Session["WebForm_FP"]) == "form_2")
                {
                    navMenu.Attributes.Add("class", "nav-item active");
                    collapse_Table.Attributes.Add("class", "collapse show");
                    form_2.Attributes.Add("class", "collapse-item active");
                    Session["WebForm_FP"] = null;
                    lbePage.Text = "Form-2";
                }
                else if (Convert.ToString(Session["WebForm_FP"]) == "Task")
                {
                    navMenu.Attributes.Add("class", "nav-item active");
                    collapse_Table.Attributes.Add("class", "collapse show");
                    Task.Attributes.Add("class", "collapse-item active");
                    Session["WebForm_FP"] = null;
                    lbePage.Text = "Pending Task";
                }
                else if (Convert.ToString(Session["WebForm_FP"]) == "Followups")
                {
                    navMenu.Attributes.Add("class", "nav-item active");
                    collapse_Table.Attributes.Add("class", "collapse show");
                    Followups.Attributes.Add("class", "collapse-item active");
                    Session["WebForm_FP"] = null;
                    lbePage.Text = "Pending Followups";
                }
                else if (Convert.ToString(Session["WebForm_FP"]) == "methodRemoval")
                {
                    navMenu.Attributes.Add("class", "nav-item active");
                    collapse_Table.Attributes.Add("class", "collapse show");
                    methodRemoval.Attributes.Add("class", "collapse-item active");
                    Session["WebForm_FP"] = null;
                    lbePage.Text = "Removal Method";
                }
                else if (Convert.ToString(Session["WebForm_FP"]) == "duplicate_form1")
                {
                    navError.Attributes.Add("class", "nav-item active");
                    collapse_Error.Attributes.Add("class", "collapse show");
                    duplicate_form1.Attributes.Add("class", "collapse-item active");
                    Session["WebForm_FP"] = null;
                    lbePage.Text = "Duplicate Form-1";
                }
                else if (Convert.ToString(Session["WebForm_FP"]) == "duplicate_form2")
                {
                    navError.Attributes.Add("class", "nav-item active");
                    collapse_Error.Attributes.Add("class", "collapse show");
                    duplicate_form2.Attributes.Add("class", "collapse-item active");
                    Session["WebForm_FP"] = null;
                    lbePage.Text = "Duplicate Form-2";
                }
                    // Method Removal (Entry)
                else if (Convert.ToString(Session["WebForm_FP"]) == "method_removal_entry")
                {
                    navEntryForm.Attributes.Add("class", "nav-item active");
                    Session["WebForm_FP"] = null;
                    lbePage.Text = "Method Removal (Entry)";
                }

            }
        }



    }
}