using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Family_Planning
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["FP_username"] = null;
            Login1.Focus();
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            Boolean blnresult = false;

            blnresult = Authentication(Login1.UserName, Login1.Password);

            if (blnresult == true)
            {
                e.Authenticated = true;
                Session["FP_username"] = Login1.UserName;
                Response.Redirect("dashboard.aspx");
            }
            else
                e.Authenticated = false;
        }

        protected static Boolean Authentication(string username, string password)
        {
            string connstring = ConfigurationManager.ConnectionStrings["LocalMySql"].ConnectionString;
            string selectcmd = "SELECT * from team where password='" + password + "' and user_name='" + username + "'";

            MySqlConnection conn = new MySqlConnection(connstring);

            MySqlCommand cmd = new MySqlCommand(selectcmd, conn);
            MySqlDataReader reader;
            conn.Open();
            try
            {
                reader = cmd.ExecuteReader();

                if (reader.Read())
                    return true;
                else
                    return false;
            }
            finally { conn.Close(); }
        }
    }
}
