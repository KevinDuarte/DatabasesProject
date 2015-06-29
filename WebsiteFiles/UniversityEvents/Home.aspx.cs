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

            SqlConnection objConnection = new SqlConnection("Data Source=184.168.194.68;Initial Catalog=EventsDB;Integrated Security=False;User ID=kevin95duarte;password=sqlpassword1;Connect Timeout=15;Encrypt=False;Packet Size=4096");


            try
            {
                objConnection.Open();

                Response.Write("successfully opened the connection");

                
                string strSQL = String.Format("select * from users where email='{0}' and password='{1}'", email, password);
                SqlCommand objCommand = new SqlCommand(strSQL, objConnection);
                SqlDataReader objReader = objCommand.ExecuteReader();

                if (objReader.Read())
                {
                    Response.Write(String.Format("Succes, ID={0}", objReader["ID"]));
                    int nID = Convert.ToInt32(objReader["studentID"]);
                    Session["studentID"] = nID;
                }
                else
                {
                    Response.Write("login failed");
                }
                objReader.Close();

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