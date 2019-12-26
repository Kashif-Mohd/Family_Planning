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
    public partial class method_removal_entry : System.Web.UI.Page
    {
        static string Complete_DSSID;
        string currentdate;
        static string Availabe_Form;

        string constr = ConfigurationManager.ConnectionStrings["LocalMySql"].ConnectionString;
        string constr_CoreDSS = ConfigurationManager.ConnectionStrings["LocalMySql_CoreDSS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                txtq5.Attributes.Add("readonly", "true");
                Session["WebForm_FP"] = "method_removal_entry";
                txtdssid.Focus();
            }

        }

        public void showalert(string message)
        {
            string script = @"alert('" + message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", script, true);
        }







        public bool Available_MethodRemoval()
        {
            bool exist = false;
            MySqlConnection con = new MySqlConnection(constr);
            try
            {
                MySqlCommand cmd = new MySqlCommand("select * from method_removal as a  where a.q1 like '%" + Complete_DSSID + "%'", con);
                con.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read() == true)
                {
                    Availabe_Form = "Method Removal";
                    exist = true;
                }
            }
            finally
            {
                con.Close();
            }
            return exist;
        }




        public bool Available_Form1()
        {
            bool exist = false;
            MySqlConnection con = new MySqlConnection(constr);
            try
            {

                MySqlCommand cmd = new MySqlCommand("select * from view_crf1 as a  where a.dssid like '%" + Complete_DSSID + "%'", con);
                con.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read() == true)
                {
                    Availabe_Form = "Form-1";
                    exist = true;
                }
            }
            finally
            {
                con.Close();
            }
            return exist;
        }









        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowData_CoreDSS();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }




        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtdssid.Text == "" || txtdssid.Text.Length < 5)
            {
                showalert("Enter DSSID, minimun length should be 5");
                txtdssid.Focus();
            }
            else
            {
                Panel1.Visible = false;
                Panel2.Visible = true;
                ShowData_CoreDSS();
                txtdssid.Focus();
            }
        }


        private void ShowData_CoreDSS()
        {
            MySqlConnection con = new MySqlConnection(constr_CoreDSS);
            try
            {
                con.Open();
                MySqlCommand cmd;
                cmd = new MySqlCommand("select * from view_married_woman as a where a.dssid like '%" + txtdssid.Text + "%'", con);
                MySqlDataAdapter sda = new MySqlDataAdapter();
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script type=\"text/javascript\">alert('" + ex.Message + "')</script>");
            }
            finally
            {
                con.Close();
            }
        }





        protected void next_Click(object sender, EventArgs e)
        {
            currentdate = DateTime.Now.ToString("dd-MM-yyyy");

            MySqlConnection cn = new MySqlConnection(constr);
            cn.Open();
            try
            {
                // Q2:
                if (DateTime.ParseExact(txtq5.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture) > (DateTime.ParseExact(currentdate, "dd-MM-yyyy", CultureInfo.InvariantCulture)))
                {
                    showalert("Incorrect Date, Should be Less or Equal than Current Date!");
                    txtq5.Focus();
                }
                else if (Available_MethodRemoval() == true)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Already Exist in " + Availabe_Form + "!')", true);
                    txtdssid.Focus();
                }
                else
                {

                    MySqlCommand cmd = new MySqlCommand("insert into method_removal (q1,	q2,	q3,	q4,	q5,	q6,	q6_01,	q7,	q8,	q9,	q10,	q11,	q12,	q13_m,	q13_f,	q14_d,	q14_m,	q14_y,	q15_d,	q15_m,	q15_y,	q16_d,	q16_m,	q16_y,	q17,	q17_01,	q18,	q19,	q19_a,	q20,	q21,	q21_01,	entry_dt,	entry_nm) values ('" + txtq1_dssid.Text + "','" + txtq2WomanNm.Text + "','" + txtq3HusbandNm.Text + "','" + txtq4.Text + "','" + txtq5.Text + "','" + txtq6.Text + "','" + txtq6_other.Text + "','" + txtq7.Text + "','" + txtq8.Text + "','" + txtq9.Text + "','" + txtq10.Text + "','" + txtq11.Text + "','" + txtq12.Text + "','" + txtq13_m.Text + "','" + txtq13_f.Text + "','" + txtq14_d.Text + "','" + txtq14_m.Text + "','" + txtq14_y.Text + "','" + txtq15_d.Text + "','" + txtq15_m.Text + "','" + txtq15_y.Text + "','" + txtq16_d.Text + "','" + txtq16_m.Text + "','" + txtq16_y.Text + "','" + txtq17.Text + "','" + txtq17_other.Text + "','" + txtq18.Text + "','" + txtq19.Text + "','" + txtq19_other.Text + "','" + txtq20.Text + "','" + txtq21.Text + "','" + txtq21_other.Text + "','" + DateTime.Now.ToString("dd-MM-yyyy") + "','" + Convert.ToString(Session["FP_username"]) + "')", cn);
                    cmd.ExecuteNonQuery();
                    cn.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alerts", "javascript:alert('Form Saved Successfully!');window.location.href='method_removal_entry.aspx';", true);
                }
            }
            catch (Exception ex)
            {
                if (ex.Message == "The DateTime represented by the string is not supported in calendar System.Globalization.GregorianCalendar.")
                {
                    showalert("Incorrect Date Format!");
                    txtq5.Focus();
                }
                else
                {
                    showalert(ex.Message);
                }
            }
            finally
            {
                cn.Close();
            }
        }













        protected void Link_OpenForm(object sender, EventArgs e)
        {
            Availabe_Form = null;
            Complete_DSSID = null;
            string[] commandArgs = ((LinkButton)sender).CommandArgument.ToString().Split(new char[] { ',' });
            Complete_DSSID = commandArgs[0];

            if (Available_Form1() == false && Available_MethodRemoval() == false)
            {
                txtq1_dssid.Text = commandArgs[0];
                txtq2WomanNm.Text = commandArgs[1];
                txtq3HusbandNm.Text = commandArgs[2];
                txtq4.Text = Convert.ToString(Session["FP_userid"]);

                Panel1.Visible = true;
                Panel2.Visible = false;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Already Exist in " + Availabe_Form + "!')", true);
                txtdssid.Focus();
            }
        }


    }
}