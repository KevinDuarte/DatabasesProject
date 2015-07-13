using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Text;

public partial class Comments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection objConnection = new SqlConnection("Data Source=184.168.194.68;Initial Catalog=EventsDB;Integrated Security=False;User ID=kevin95duarte;password=sqlpassword1;Connect Timeout=15;Encrypt=False;Packet Size=4096;MultipleActiveResultSets=True");

        try
        {
            objConnection.Open();

            //gets the university from the database
            String strSQL = String.Format("select * from event E where E.eventID={0}", Session["eventID"]);
            SqlCommand eventCommand = new SqlCommand(strSQL, objConnection);
            SqlDataReader eventReader = eventCommand.ExecuteReader();

            if (eventReader.Read())
            {
                HtmlGenericControl eventName = (HtmlGenericControl)this.FindControl("EventNameHere");
                eventName.InnerHtml = Convert.ToString(eventReader["name"] + "'s Comments");

                //gets all the comments
                strSQL = String.Format("select * from comments C where C.eventID={0}", Session["eventID"]);
                SqlCommand commentCommand = new SqlCommand(strSQL, objConnection);
                SqlDataReader commentReader = commentCommand.ExecuteReader();

                if(commentReader.Read())
                {
                    TableRow tRow = new TableRow();
                    commentTable.Rows.Add(tRow);
                    TableCell tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    tCell.Height = 35;
                    String text = Convert.ToString(commentReader["comment"]) + "\n\n\t\t";

                    strSQL = String.Format("select * from student S where S.studentID={0}", commentReader["studentID"]);
                    SqlCommand nameCommand = new SqlCommand(strSQL, objConnection);
                    SqlDataReader nameReader = nameCommand.ExecuteReader();

                    if(nameReader.Read())
                    {
                        text += ("by " + nameReader["first_name"] + " " + nameReader["last_name"]);
                        tCell.Text = text;

                        if(Convert.ToInt32(nameReader["studentID"]) == Convert.ToInt32(Session["studentID"]))
                        {
                            tCell = new TableCell();
                            tRow.Cells.Add(tCell);
                            tCell.Height = 35;
                            tCell.Width = 50;

                            Button deleteButton = new Button();
                            deleteButton.Text = "Delete Comment";
                            deleteButton.Width = 50;
                            deleteButton.Height = 35;
                            deleteButton.Click += new EventHandler(this.OnDeleteBtn_Click);
                            tCell.Controls.Add(deleteButton);
                        }
                    }
                    else
                    {
                        Response.Write("An error has occurred");
                    }

                    while(commentReader.Read())
                    {
                        tRow = new TableRow();
                        commentTable.Rows.Add(tRow);
                        tCell = new TableCell();
                        tRow.Cells.Add(tCell);
                        tCell.Height = 35;
                        text = Convert.ToString(commentReader["comment"]) + " ";

                        strSQL = String.Format("select * from student S where S.studentID={0}", commentReader["studentID"]);
                        SqlCommand nameCommand2 = new SqlCommand(strSQL, objConnection);
                        SqlDataReader nameReader2 = nameCommand2.ExecuteReader();

                        if (nameReader2.Read())
                        {
                            text += ("by " + nameReader2["first_name"] + " " + nameReader2["last_name"]);
                            tCell.Text = text;

                            if (Convert.ToInt32(nameReader2["studentID"]) == Convert.ToInt32(Session["studentID"]))
                            {
                                tCell = new TableCell();
                                tRow.Cells.Add(tCell);
                                tCell.Height = 35;
                                tCell.Width = 50;

                                Button deleteButton = new Button();
                                deleteButton.Text = "Delete Comment";
                                deleteButton.Width = 50;
                                deleteButton.Height = 35;
                                deleteButton.Click += new EventHandler(this.OnDeleteBtn_Click);
                                tCell.Controls.Add(deleteButton);
                            }
                        }
                        else
                        {
                            Response.Write("An error has occurred");
                        }
                    }
                }
                else
                {
                    TableRow tRow = new TableRow();
                    commentTable.Rows.Add(tRow);
                    TableCell tCell = new TableCell();
                    tRow.Cells.Add(tCell);
                    tCell.Text = "There are no comments on this event.";
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

    protected void OnDeleteBtn_Click(object sender, EventArgs e)
    {
        SqlConnection objConnection = new SqlConnection("Data Source=184.168.194.68;Initial Catalog=EventsDB;Integrated Security=False;User ID=kevin95duarte;password=sqlpassword1;Connect Timeout=15;Encrypt=False;Packet Size=4096;MultipleActiveResultSets=True");

        try
        {
            objConnection.Open();

            String strSQL = String.Format("DELETE FROM comments WHERE studentID={0}", Session["studentID"]);
            SqlCommand deleteComment = new SqlCommand(strSQL, objConnection);
            deleteComment.ExecuteNonQuery();

            Response.Redirect("Comments.aspx");
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


    protected void btnSubmitCom_Click(object sender, EventArgs e)
    {
        string comment = String.Format("{0}", Request.Form["comment"]);

        if(comment.CompareTo("") == 0)
        {
            Response.Write("Complete all fields");
        }

        SqlConnection objConnection = new SqlConnection("Data Source=184.168.194.68;Initial Catalog=EventsDB;Integrated Security=False;User ID=kevin95duarte;password=sqlpassword1;Connect Timeout=15;Encrypt=False;Packet Size=4096;MultipleActiveResultSets=True");

        try
        {
            objConnection.Open();

            String strSQL = String.Format("SELECT * FROM comments WHERE studentID={0}", Session["studentID"]);
            SqlCommand checkEvent = new SqlCommand(strSQL, objConnection);
            SqlDataReader reader = checkEvent.ExecuteReader();

            if(reader.Read())
            {
                Response.Write("You already have a comment for this event, please delete your old one to make a comment");
            }
            else
            {
                strSQL = String.Format("INSERT INTO comments(studentID, eventID, comment) VALUES({0}, {1}, '{2}')", Session["studentID"], Session["eventID"], comment);
                SqlCommand insertHosted = new SqlCommand(strSQL, objConnection);
                insertHosted.ExecuteNonQuery();

                Response.Redirect("Comments.aspx");
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
}