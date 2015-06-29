using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string email = String.Format("{0}", Request.Form["email"]);
        string password = String.Format("{0}", Request.Form["password"]);

        //all fields are not complete
        if (email.CompareTo("") == 0 || password.CompareTo("") == 0)
        {
            //do something to notify the user
            return;
        }
        else
        {
            /* Database Information
             
            Connection string: Data Source=184.168.194.68;Integrated Security=False;User ID=kevin95duarte;Connect Timeout=15;Encrypt=False;Packet Size=4096
            Connection timeout: 15
            Database: EventsDB
            Datasource: 184.168.194.68
            Network packet size: 4096
            Server version: 11.00.5582
            Work station id: P3NWVPWEB099

             */

            SqlConnection objConnection = new SqlConnection("server=CardHeroStats.db.11398366.hostedresource.com;uid=CardHeroStats;pwd=Paul4Change!;database=CardHeroStats");

            try
            {
                objConnection.Open();

                /*
                string strSQL = String.Format("select * from users where uname='{0}' and upwd='{1}'", strName, strPassword);
                SqlCommand objCommand = new SqlCommand(strSQL, objConnection);
                SqlDataReader objReader = objCommand.ExecuteReader();

                int nResult = 0;

                if (objReader.Read())
                {
                    Response.Write(String.Format("Succes, ID={0}", objReader["ID"]));
                    int nID = Convert.ToInt32(objReader["ID"]);

                    nResult = 1;
                }
                else
                {
                    Response.Write("login failed");
                }
                objReader.Close();

                strSQL = String.Format("insert into logins (uname,upwd,result) VALUES ('{0}','{1}',{2})", strName, strPassword, nResult);
                objCommand = new SqlCommand(strSQL, objConnection);
                objCommand.ExecuteNonQuery();
                 */

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }
            finally
            {
                if (objConnection.State == ConnectionState.Open)
                {
                    objConnection.Close();
                }
            }

            //check database

            //if account is in database -> Events.aspx
            //else notify user that the inputs are not correct
        }
    }

    protected void btnCreateAcc_Click(object sender, EventArgs e)
    {
        Response.Redirect("CreateAccount.aspx");
    }

    protected void btnForgotPass_Click(object sender, EventArgs e)
    {
        Response.Redirect("ForgotPassword.aspx");
    }
}