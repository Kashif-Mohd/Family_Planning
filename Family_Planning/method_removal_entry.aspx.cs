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

        string constr = ConfigurationManager.ConnectionStrings["LocalMySql"].ConnectionString;
        string constr_CoreDSS = ConfigurationManager.ConnectionStrings["LocalMySql_CoreDSS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["WebForm_FP"] = "method_removal_entry";
                txtdssid.Focus();
            }

        }

        public void showalert(string message)
        {
            string script = @"alert('" + message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", script, true);
        }







        public bool CompleteForm()
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
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Already Exist!')", true);
                    txtdssid.Focus();
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
                //if (DateTime.ParseExact(txtq2.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture) >= (DateTime.ParseExact(currentdate, "dd-MM-yyyy", CultureInfo.InvariantCulture)))
                //{
                //    showalert("Incorrect Date, Should be Less than Current Date!");
                //    txtq.Focus();
                //}
                //else
                //{

                //    MySqlCommand cmd = new MySqlCommand("insert into crf8(study_id,q2 ,q3 ,q4	,q5	,q6	,q7	,dssid	,q14	,q15	,q16	,q17	,q18	,q19	,q20	,q21	,q22	,q23	,q24	, q25, status, entry_dt, entry_nm) values ('" + txtStudyID.Text + "','" + txtq2.Text + "','" + txtq3.Text + "','" + txtq4.Text.ToUpper() + "','" + txtq5.Text.ToUpper() + "','" + txtq6WomanNm.Text.ToUpper() + "','" + txtq7HusbandNm.Text.ToUpper() + "','" + txtdssidQ8toQ13.Text.ToUpper() + "','" + txtq14.Text + "','" + Age + "','" + txtq16.Text + "','" + txtq17.Text + "','" + txtq18.Text + "' ,'" + txtq19.Text + "','" + txtq20.Text + "','" + txtq21.Text + "' ,'" + txtq22.Text + "','" + txtq23.Text + "','" + txtq22.Text + "' ,'" + TimeQ25 + "','" + "0" + "','" + DateTime.Now.ToString("dd-MM-yyyy") + "','" + Convert.ToString(Session["ComplianceMaamtaLW"]) + "')", cn);
                //    cmd.ExecuteNonQuery();
                //    cn.Close();
                //    Response.Redirect("crf8b.aspx?&FormID=" + FormID + "&Study_ID=" + txtStudyID.Text.ToUpper());
                //}
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
            Complete_DSSID = null;
            string[] commandArgs = ((LinkButton)sender).CommandArgument.ToString().Split(new char[] { ',' });
            Complete_DSSID = commandArgs[0];

            if (CompleteForm() == false)
            {
                txtq1_dssid.Text = commandArgs[0];
                txtq2WomanNm.Text = commandArgs[1];
                txtq3HusbandNm.Text = commandArgs[2];
                txtq4.Text = Convert.ToString(Session["FP_userid"]);

                Panel1.Visible = true;
                Panel2.Visible = false;
            }
        }




    }
}