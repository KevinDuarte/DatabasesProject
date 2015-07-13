using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class CreateEvent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string eventName = String.Format("{0}", Request.Form["EventName"]);
        string eventCategory = String.Format("{0}", Request.Form["EventCategory"]);
        string description = String.Format("{0}", Request.Form["description"]);
        string address = String.Format("{0}", Request.Form["address"]);
        string date = String.Format("{0}", Request.Form["date"]);
        string time = String.Format("{0}", Request.Form["time"]);
        string phone = String.Format("{0}", Request.Form["PhoneNumber"]);
        string email = String.Format("{0}", Request.Form["email"]);
        
        RegexUtilities util = new RegexUtilities();

        //TODO connect to database and create the event
        if(eventName.CompareTo("") == 0 || eventCategory.CompareTo("") == 0 ||
           description.CompareTo("") == 0 || date.CompareTo("") == 0 || 
           time.CompareTo("") == 0 || phone.CompareTo("") == 0 || email.CompareTo("") == 0)
        {
            Response.Write("Complete all fields");
            return;
        }
        else if(!util.IsValidEmail(email))
        {
            Response.Write("That is not a valid email.");
            return;
        }

        //opens the object connection
        SqlConnection objConnection = new SqlConnection("Data Source=184.168.194.68;Initial Catalog=EventsDB;Integrated Security=False;User ID=kevin95duarte;password=sqlpassword1;Connect Timeout=60;Encrypt=False;Packet Size=4096;MultipleActiveResultSets=True");

        try 
        {
            objConnection.Open();
            /* 
                pubprirso values:

                0 public university event
                1 private university event
                2 RSO event
            */
            int pubprirso = 0;

            //Finds out if the user is a student, admin, or superadmin (denoted by pubprirso)
            String strSQL = String.Format("select * from director D where D.directorID={0}", Session["studentID"]);
            SqlCommand isDirector = new SqlCommand(strSQL, objConnection);
            SqlDataReader isDirectorReader = isDirector.ExecuteReader();

            if(isDirectorReader.Read())
            {
                pubprirso = 1;
            }

            strSQL = String.Format("select * from admin A where A.adminID={0}", Session["studentID"]);
            SqlCommand isAdmin = new SqlCommand(strSQL, objConnection);
            SqlDataReader isAdminReader = isAdmin.ExecuteReader();

            if (isAdminReader.Read())
            {
                pubprirso = 2;
            }


            //checks if there is an event with the same name
            strSQL = String.Format("select * from event E where E.name='{0}'", eventName);
            SqlCommand eventExists = new SqlCommand(strSQL, objConnection);
            SqlDataReader eventExistsReader = eventExists.ExecuteReader();

            if(eventExistsReader.Read())
            {
                Response.Write("An event of that name already exists");
                return;
            }



            //Create the event
            strSQL = String.Format("INSERT INTO event(type, name, description, contact_phone, contact_email, date, time, pubprirso) VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', {7})",
                                    eventCategory, eventName, description, phone, email, date, time, pubprirso);
            SqlCommand insertEvent = new SqlCommand(strSQL, objConnection);
            insertEvent.ExecuteNonQuery();

            //gets the eventID
            strSQL = String.Format("SELECT * FROM event E WHERE E.name='{0}'", eventName);
            SqlCommand getEventID = new SqlCommand(strSQL, objConnection);
            SqlDataReader eventReader = getEventID.ExecuteReader();

            int eventID = -1;
            if (eventReader.Read())
            {
                eventID = Convert.ToInt32(eventReader["eventID"]);
            }

            //gets the universityID
            strSQL = String.Format("SELECT * FROM attends A WHERE A.studentID={0}", Session["studentID"]);
            SqlCommand getUniversityID = new SqlCommand(strSQL, objConnection);
            SqlDataReader universityReader = getUniversityID.ExecuteReader();

            int universityID = -1;
            if(universityReader.Read())
            {
                universityID = Convert.ToInt32(universityReader["universityID"]);
            }

            //creates the hostedBy relation between event and university
            strSQL = String.Format("INSERT INTO hostedBy(universityID, eventID) VALUES({0}, {1})", universityID, eventID);
            SqlCommand insertHosted = new SqlCommand(strSQL, objConnection);
            insertHosted.ExecuteNonQuery();

            //creates the organizedBy relation between rso and event
            if(pubprirso == 2)
            {
                //gets the rsoID
                strSQL = String.Format("SELECT * FROM manages M WHERE M.adminID={0}", Session["studentID"]);
                SqlCommand getRSOID = new SqlCommand(strSQL, objConnection);
                SqlDataReader rsoReader = getRSOID.ExecuteReader();

                int rsoID = -1;
                if (rsoReader.Read())
                {
                    rsoID = Convert.ToInt32(rsoReader["rsoID"]);
                }

                strSQL = String.Format("INSERT INTO organizedBy(rsoID, eventID) VALUES({0}, {1})", rsoID, eventID);
                SqlCommand insertOrganized = new SqlCommand(strSQL, objConnection);
                insertOrganized.ExecuteNonQuery();
            }

            //creates the heldAt relationship for the event
            strSQL = String.Format("INSERT INTO heldAt(eventID, address) VALUES({0},'{1}')", eventID, address);
            SqlCommand insertHeldAt = new SqlCommand(strSQL, objConnection);
            insertHeldAt.ExecuteNonQuery();

            Response.Redirect("Events.aspx");

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