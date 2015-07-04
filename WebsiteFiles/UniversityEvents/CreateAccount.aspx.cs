using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class CreateAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //receive the inputed information
        string firstName = String.Format("{0}", Request.Form["firstName"]);
        string lastName = String.Format("{0}", Request.Form["lastName"]);
        string email = String.Format("{0}", Request.Form["email"]);
        string password = String.Format("{0}", Request.Form["password"]);
        string university = String.Format("{0}", Request.Form["universityInfo"]);
        RegexUtilities util = new RegexUtilities();

        //TODO connect to database and add the information
        if (firstName.CompareTo("") == 0 || lastName.CompareTo("") == 0 ||
            email.CompareTo("") == 0 || password.CompareTo("") == 0 ||
            university.CompareTo("") == 0)
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
            SqlConnection objConnection = new SqlConnection("Data Source=184.168.194.68;Initial Catalog=EventsDB;Integrated Security=False;User ID=kevin95duarte;password=sqlpassword1;Connect Timeout=15;Encrypt=False;Packet Size=4096;MultipleActiveResultSets=True");

            try
            {
                objConnection.Open();

                //checks if the email is in the DB
                string strSQL = String.Format("select * from student where email='{0}'", email);
                SqlCommand objCommand = new SqlCommand(strSQL, objConnection);
                SqlDataReader objReader = objCommand.ExecuteReader();

                //the email is in the DB
                if (objReader.Read())
                {
                    //Email already has an account
                    Response.Write("this email already has an account.");
                }
                //email is not in the DB, create the account
                else
                {
                    //inserts the student in the DB
                    strSQL = String.Format("INSERT INTO student (first_name, last_name, password, email) VALUES ('{0}','{1}','{2}','{3}');", 
                        firstName, lastName, password, email);
                    SqlCommand objCommand2 = new SqlCommand(strSQL, objConnection);
                    objCommand2.ExecuteNonQuery();

                    //gets the universityID
                    strSQL = String.Format("SELECT * FROM university U WHERE U.initials='{0}'", university);
                    SqlCommand getUniversityID = new SqlCommand(strSQL, objConnection);
                    SqlDataReader universityReader = getUniversityID.ExecuteReader();
                    int universityID = -1;

                    if(universityReader.Read())
                    {
                        universityID = Convert.ToInt32(universityReader["universityID"]);
                    }
                    else
                    {
                        //getting the uniID failed, I dont know how such a thing happened
                        Response.Write("UniversityID failed");
                    }
                    universityReader.Close();

                    //gets the row of the recently created student account
                    strSQL = String.Format("select * from student where email='{0}'", email);
                    SqlCommand objCommand3 = new SqlCommand(strSQL, objConnection);
                    SqlDataReader objReader2 = objCommand3.ExecuteReader();

                    if (objReader2.Read())
                    {
                        //adds the student to the attends table
                        int studentID = Convert.ToInt32(objReader2["studentID"]);
                        strSQL = String.Format("INSERT INTO attends(studentID, universityID) VALUES('{0}', '{1}')", studentID, universityID);
                        SqlCommand insertAttends = new SqlCommand(strSQL, objConnection);
                        insertAttends.ExecuteNonQuery();

                        //saves the student id to the session
                        Session["studentID"] = studentID;
                        //redirects to the View Events page
                        Response.Redirect("Events.aspx");
                    }
                    else
                    {
                        //login failed, I dont know how such a thing happened
                        Response.Write("Creation failed");
                    }
                    objReader2.Close();
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
}