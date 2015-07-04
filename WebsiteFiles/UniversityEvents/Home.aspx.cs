using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Globalization;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string email = String.Format("{0}", Request.Form["email"]);
        string password = String.Format("{0}", Request.Form["password"]);
        RegexUtilities util = new RegexUtilities();
        
        if (email.CompareTo("") == 0 || password.CompareTo("") == 0)
        {
            //all fields are not completed
            Response.Write("Complete all fields");
        }
        else if(!util.IsValidEmail(email))
        {
            //email is not valid
            Response.Write("Not a valid email");
        }
        else
        {
            SqlConnection objConnection = new SqlConnection("Data Source=184.168.194.68;Initial Catalog=EventsDB;Integrated Security=False;User ID=kevin95duarte;password=sqlpassword1;Connect Timeout=15;Encrypt=False;Packet Size=4096");

            try
            {
                objConnection.Open();
           
                //checks if the email and password are in the DB
                string strSQL = String.Format("select * from student where UPPER(email)=UPPER('{0}') and password='{1}'", email, password);
                SqlCommand objCommand = new SqlCommand(strSQL, objConnection);
                SqlDataReader objReader = objCommand.ExecuteReader();

                //if the email/password combo are in the DB, then login is successful
                if (objReader.Read())
                {
                    //saves the student id to the session
                    int nID = Convert.ToInt32(objReader["studentID"]);
                    Session["studentID"] = nID;
                    Response.Redirect("Events.aspx");
                }
                else
                {
                    //login failed
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