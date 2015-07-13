using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class CreateRSO : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string rsoName = String.Format("{0}", Request.Form["RSOName"]);
        String[] emails = new String[6];
        emails[0] = String.Format("{0}", Request.Form["email"]);
        emails[1] = String.Format("{0}", Request.Form["email1"]);
        emails[2] = String.Format("{0}", Request.Form["email2"]);
        emails[3] = String.Format("{0}", Request.Form["email3"]);
        emails[4] = String.Format("{0}", Request.Form["email4"]);
        emails[5] = String.Format("{0}", Request.Form["email5"]);
        RegexUtilities util = new RegexUtilities();


        //ensures all emails are not null, and are emails
        if (rsoName.CompareTo("") == 0 || emails[0].CompareTo("") == 0 ||
            emails[1].CompareTo("") == 0 || emails[2].CompareTo("") == 0 ||
            emails[3].CompareTo("") == 0 || emails[4].CompareTo("") == 0 ||
            emails[5].CompareTo("") == 0)
        {
            Response.Write("Fill in all fields");
            return;
        }
        else if (!(util.IsValidEmail(emails[0]) && util.IsValidEmail(emails[1]) &&
                    util.IsValidEmail(emails[2]) && util.IsValidEmail(emails[3]) &&
                    util.IsValidEmail(emails[4]) && util.IsValidEmail(emails[5])))
        {
            Response.Write("Not valid emails");
            return;
        }
        
        
        //opens the object connection
        SqlConnection objConnection = new SqlConnection("Data Source=184.168.194.68;Initial Catalog=EventsDB;Integrated Security=False;User ID=kevin95duarte;password=sqlpassword1;Connect Timeout=60;Encrypt=False;Packet Size=4096;MultipleActiveResultSets=True");

        try
        {
            objConnection.Open();

            //checks if RSO name exists
            String strSQL = String.Format("select * from rso R where name='{0}'", rsoName);
            SqlCommand objCommand = new SqlCommand(strSQL, objConnection);
            SqlDataReader objReader = objCommand.ExecuteReader();

            //the rso name is in the DB
            if (objReader.Read())
            {
                //Email already has an account
                Response.Write("This rso name is taken.");
                return;
            }
            objReader.Close();


            //check if all emails are in DB
            int[] ids = new int[6];
            for(int i = 0; i < 6; i++)
            {

                strSQL = String.Format("SELECT * FROM student S WHERE UPPER(S.email)=UPPER('{0}')", emails[i]);
                SqlCommand objCommand2 = new SqlCommand(strSQL, objConnection);
                SqlDataReader objReader2 = objCommand2.ExecuteReader();

                //the email is in the DB, save the id
                if(objReader2.Read())
                {
                    ids[i] = Convert.ToInt32(objReader2["studentID"]);
                }
                else
                {
                    //email is not in the DB
                    Response.Write(String.Format("{0} does not have an account", emails[i]));
                    return;
                }
                objReader2.Close();
            }


            //checks if all students attend the same university
            int[] universityIDs = new int[6];
            for (int i = 0; i < 6; i++)
            {
                strSQL = String.Format("select * from attends A where A.studentID='{0}'", ids[i]);
                SqlCommand objCommand2 = new SqlCommand(strSQL, objConnection);
                SqlDataReader objReader2 = objCommand2.ExecuteReader();

                if (objReader2.Read())
                {
                    universityIDs[i] = Convert.ToInt32(objReader2["universityID"]);
                }
                objReader2.Close();
            }
            for(int i = 1; i < 6; i++)
            {
                //all the universities are not the same
                if(universityIDs[0] != universityIDs[i])
                {
                    Response.Write("All students do not attend the same university");
                    return;
                }
            }

            String emailEnd = emails[0].Substring(emails[0].IndexOf('@'));
            for(int i = 1; i < 6; i++)
            {
                //all emails do not end the same
                if(emailEnd.CompareTo(emails[i].Substring(emails[i].IndexOf('@'))) != 0)
                {
                    Response.Write("All students do not have the same university email");
                    return;
                }
            }



            //Creates a new rso INSERTS it into the Database

            strSQL = String.Format("INSERT INTO rso(name) VALUES('{0}')", rsoName);
            SqlCommand insertRSO = new SqlCommand(strSQL, objConnection);
            insertRSO.ExecuteNonQuery();

            //gets the rsoID
            strSQL = String.Format("SELECT * FROM rso WHERE name='{0}'", rsoName);
            SqlCommand getRSOID = new SqlCommand(strSQL, objConnection);
            SqlDataReader rsoReader = getRSOID.ExecuteReader();

            int rsoID = -1;
            if(rsoReader.Read())
            {
                rsoID = Convert.ToInt32(rsoReader["rsoID"]);
            }

            //creates a new partOf relationship
            strSQL = String.Format("INSERT INTO partOf(universityID, rsoID) VALUES({0}, {1})", universityIDs[0], rsoID);
            SqlCommand insertPartOf = new SqlCommand(strSQL, objConnection);
            insertPartOf.ExecuteNonQuery();

            //adds all the students into the rso
            for(int i = 0; i < 6; i++)
            {
                strSQL = String.Format("INSERT INTO memberOf(studentID, rsoID) VALUES({0}, {1})", ids[i], rsoID);
                SqlCommand insertMemberOf = new SqlCommand(strSQL, objConnection);
                insertMemberOf.ExecuteNonQuery();
            }

            //makes the admin, an admin
            strSQL = String.Format("INSERT INTO admin(adminID) VALUES({0})", ids[0]);
            SqlCommand insertAdmin = new SqlCommand(strSQL, objConnection);
            insertAdmin.ExecuteNonQuery();

            //makes admin manage the rso
            strSQL = String.Format("INSERT INTO manages(adminID, rsoID) VALUES({0}, {1})", ids[0], rsoID);
            SqlCommand insertManages = new SqlCommand(strSQL, objConnection);
            insertManages.ExecuteNonQuery();

            Response.Write("The RSO has been successfully created");

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