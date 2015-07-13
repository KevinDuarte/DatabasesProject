using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class Events : System.Web.UI.Page
{
    int[] eventIDS;
    protected void Page_Load(object sender, EventArgs e)
    {
        //loads in the public events
        SqlConnection objConnection = new SqlConnection("Data Source=184.168.194.68;Initial Catalog=EventsDB;Integrated Security=False;User ID=kevin95duarte;password=sqlpassword1;Connect Timeout=15;Encrypt=False;Packet Size=4096;MultipleActiveResultSets=True");

        try
        {
            objConnection.Open();

            //public events

            //gets the university from the database
            String strSQL = String.Format("select * from attends A where A.studentID={0}", Session["studentID"]);
            SqlCommand uniCommand = new SqlCommand(strSQL, objConnection);
            SqlDataReader uniReader = uniCommand.ExecuteReader();

            int universityID = 0;
            if (uniReader.Read())
            {
                universityID = Convert.ToInt32(uniReader["universityID"]);
            }
            else
            {
                Response.Write("Error was encountered");
            }

            //this gets all public rso events
            strSQL = String.Format("SELECT * FROM event E WHERE E.pubprirso={0} ORDER BY eventID DESC", 0);
            SqlCommand eventCommand = new SqlCommand(strSQL, objConnection);
            SqlDataReader eventReader = eventCommand.ExecuteReader();

            eventIDS = new int[30];
            for(int i = 1; i <= 10; i++)
            {
                HtmlTableRow row = (HtmlTableRow)this.FindControl("publicRow" + i);

                if(eventReader.Read())
                {
                    eventIDS[i - 1] = Convert.ToInt32(eventReader["eventID"]);

                    row.Cells[0].InnerHtml = Convert.ToString(eventReader["name"]);
                    row.Cells[0].Align = "Center";

                    row.Cells[1].InnerHtml = Convert.ToString(eventReader["date"]).Substring(0, Convert.ToString(eventReader["date"]).IndexOf(' '));
                    row.Cells[1].Align = "Center";

                    row.Cells[2].InnerHtml = Convert.ToString(eventReader["time"]);
                    row.Cells[2].Align = "Center";

                    strSQL = String.Format("SELECT * FROM hostedBy H WHERE H.eventID={0}", eventIDS[i-1]);
                    SqlCommand locationCommand = new SqlCommand(strSQL, objConnection);
                    SqlDataReader locationReader = locationCommand.ExecuteReader();

                    int eventUni = 0;
                    if(locationReader.Read())
                    {
                        eventUni = Convert.ToInt32(locationReader["universityID"]);
                    }
                    else
                    {
                        Response.Write("An error was encountered");
                    }

                    strSQL = String.Format("SELECT * FROM university U WHERE U.universityID={0}", eventUni);
                    SqlCommand eventUniCommand = new SqlCommand(strSQL, objConnection);
                    SqlDataReader eventUniReader = eventUniCommand.ExecuteReader();

                    if (eventUniReader.Read())
                    {
                        row.Cells[3].InnerHtml = Convert.ToString(eventUniReader["name"]);
                        row.Cells[3].Align = "Center";
                    }
                    else
                    {
                        Response.Write("An error was encountered");
                    }
                }
                else
                {
                    eventIDS[i - 1] = -1;
                    row.Visible = false;

                    HtmlButton button = (HtmlButton)this.FindControl("det" + i);
                    button.Disabled = true;
                    HtmlButton button2 = (HtmlButton)this.FindControl("com" + i);
                    button.Disabled = true;
                }
            }

            //rso events

            //this gets all the rsos that the student is a part of
            strSQL = String.Format("SELECT * FROM memberOf M WHERE M.studentID={0}", Session["studentID"]);
            SqlCommand rsoCommand = new SqlCommand(strSQL, objConnection);
            SqlDataReader rsoReader = rsoCommand.ExecuteReader();

            //gets all events from all the rsos
            String strSql2 = "";

            bool inRSO = true;
            if(rsoReader.Read())
            {
                strSql2 += String.Format("SELECT * FROM organizedBy O WHERE O.rsoID={0} ", rsoReader["rsoID"]);
               
                while(rsoReader.Read())
                {
                    strSql2 += String.Format("OR O.rsoID={0} ", rsoReader["rsoID"]);
                }

                strSql2 += "ORDER BY eventID DESC";
            }
            else
            {
                inRSO = false;
            }
            SqlCommand rsoEventIDCommand;
            SqlDataReader rsoEventIDReader = rsoReader;
            if (inRSO)
            {
                rsoEventIDCommand = new SqlCommand(strSql2, objConnection);
                rsoEventIDReader = rsoEventIDCommand.ExecuteReader();
            }

            for(int i = 11; i <= 20; i++ )
            {
                HtmlTableRow row = (HtmlTableRow)this.FindControl("rsoRow" + (i-10));

                if (inRSO && rsoEventIDReader.Read())
                {
                    strSQL = String.Format("SELECT * FROM event E WHERE E.eventID={0}", rsoEventIDReader["eventID"]);
                    SqlCommand rsoEventCommand = new SqlCommand(strSQL, objConnection);
                    SqlDataReader rsoEventReader = rsoEventCommand.ExecuteReader();

                    if(rsoEventReader.Read())
                    {
                        eventIDS[i - 1] = Convert.ToInt32(rsoEventReader["eventID"]);

                        row.Cells[0].InnerHtml = Convert.ToString(rsoEventReader["name"]);
                        row.Cells[0].Align = "Center";

                        row.Cells[1].InnerHtml = Convert.ToString(rsoEventReader["date"]).Substring(0, Convert.ToString(rsoEventReader["date"]).IndexOf(' '));
                        row.Cells[1].Align = "Center";

                        row.Cells[2].InnerHtml = Convert.ToString(rsoEventReader["time"]);
                        row.Cells[2].Align = "Center";

                        strSQL = String.Format("SELECT * FROM rso R WHERE R.rsoID={0}", rsoEventIDReader["rsoID"]);
                        SqlCommand rsoCommand2 = new SqlCommand(strSQL, objConnection);
                        SqlDataReader rsoReader2 = rsoCommand2.ExecuteReader();

                        if(rsoReader2.Read())
                        {
                            row.Cells[3].InnerHtml = Convert.ToString(rsoReader2["name"]);
                            row.Cells[3].Align = "Center";
                        }
                        else
                        {
                            Response.Write("An error was encountered");
                        }
                    }

                }
                else
                {
                    eventIDS[i - 1] = -1;
                    row.Visible = false;
                    HtmlButton button = (HtmlButton)this.FindControl("det" + i);
                    button.Disabled = true;
                    HtmlButton button2 = (HtmlButton)this.FindControl("com" + i);
                    button.Disabled = true;
                }

            }

            //private events

            //this gets all private events
            strSQL = String.Format("SELECT * FROM event E WHERE E.pubprirso={0} ORDER BY eventID DESC", 1);
            SqlCommand eventPrivateCommand = new SqlCommand(strSQL, objConnection);
            SqlDataReader eventPrivateReader = eventPrivateCommand.ExecuteReader();

            for(int i = 21; i <= 30; i++)
            {
                HtmlTableRow row = (HtmlTableRow)this.FindControl("privateRow" + (i - 20));

                if(eventPrivateReader.Read())
                {
                    //gets what university that this event is held at
                    strSQL = String.Format("SELECT * FROM hostedBy H WHERE H.eventID={0}", eventPrivateReader["eventID"]);
                    SqlCommand locationCommand = new SqlCommand(strSQL, objConnection);
                    SqlDataReader locationReader = locationCommand.ExecuteReader();

                    int eventUni = 0;
                    if (locationReader.Read())
                    {
                        //if this university is the same as the student's university
                        eventUni = Convert.ToInt32(locationReader["universityID"]);
                        if(eventUni == universityID)
                        {
                            //insert into table
                            eventIDS[i - 1] = Convert.ToInt32(eventPrivateReader["eventID"]);

                            row.Cells[0].InnerHtml = Convert.ToString(eventPrivateReader["name"]);
                            row.Cells[0].Align = "Center";

                            row.Cells[1].InnerHtml = Convert.ToString(eventPrivateReader["date"]).Substring(0, Convert.ToString(eventPrivateReader["date"]).IndexOf(' '));
                            row.Cells[1].Align = "Center";

                            row.Cells[2].InnerHtml = Convert.ToString(eventPrivateReader["time"]);
                            row.Cells[2].Align = "Center";

                            strSQL = String.Format("SELECT * FROM university U WHERE U.universityID={0}", eventUni);
                            SqlCommand eventUniCommand = new SqlCommand(strSQL, objConnection);
                            SqlDataReader eventUniReader = eventUniCommand.ExecuteReader();

                            if (eventUniReader.Read())
                            {
                                row.Cells[3].InnerHtml = Convert.ToString(eventUniReader["name"]);
                                row.Cells[3].Align = "Center";
                            }
                            else
                            {
                                Response.Write("An error was encountered");
                            }

                        }
                        else
                        {
                            i--;
                        }

                    }
                    else
                    {
                        Response.Write("An error was encountered");
                    }
                }
                else
                {
                    eventIDS[i - 1] = -1;
                    row.Visible = false;
                    HtmlButton button = (HtmlButton)this.FindControl("det" + i);
                    button.Disabled = true;
                    HtmlButton button2 = (HtmlButton)this.FindControl("com" + i);
                    button.Disabled = true;
                }
            }

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

    

    protected void btnDetails_Click(object sender, EventArgs e)
    {
        for (int i = 1; i <= 30; i++)
        {
            if (sender.Equals((HtmlButton)this.FindControl("det" + i)))
            {
                if (eventIDS[i - 1] == -1)
                {
                    return;
                }
                else
                {
                    Session["eventID"] = eventIDS[i - 1];
                    Response.Redirect("Details.aspx");
                }
            }
        }
    }

    protected void btnComment_Click(object sender, EventArgs e)
    {
        for (int i = 1; i <= 30; i++)
        {
            if (sender.Equals((HtmlButton)this.FindControl("com" + i)))
            {
                if (eventIDS[i - 1] == -1)
                {
                    return;
                }
                else
                {
                    Session["eventID"] = eventIDS[i - 1];
                    Response.Redirect("Comments.aspx");
                }
            }
        }
    }
}