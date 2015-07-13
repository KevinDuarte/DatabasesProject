using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

public partial class ViewRSO : System.Web.UI.Page
{
    int[] rsoIDS;

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection objConnection = new SqlConnection("Data Source=184.168.194.68;Initial Catalog=EventsDB;Integrated Security=False;User ID=kevin95duarte;password=sqlpassword1;Connect Timeout=15;Encrypt=False;Packet Size=4096;MultipleActiveResultSets=True");

        try
        {
            objConnection.Open();

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

            strSQL = String.Format("SELECT * FROM partOf P WHERE P.universityID={0} ORDER BY rsoID DESC", universityID);
            SqlCommand rsoIDCommand = new SqlCommand(strSQL, objConnection);
            SqlDataReader rsoIDReader = rsoIDCommand.ExecuteReader();


            rsoIDS = new int[7];
            for (int i = 1; i <= 7; i++)
            {
                HtmlTableRow row = (HtmlTableRow)this.FindControl("row" + i);

                if(rsoIDReader.Read())
                {
                    rsoIDS[i - 1] = Convert.ToInt32(rsoIDReader["rsoID"]);

                    //counts the number of 
                    strSQL = String.Format("SELECT * FROM rso R WHERE R.rsoID={0}", rsoIDS[i-1]);
                    SqlCommand rsoCommand = new SqlCommand(strSQL, objConnection);
                    SqlDataReader rsoReader = rsoCommand.ExecuteReader();

                    if(rsoReader.Read())
                    {
                        row.Cells[0].InnerHtml = Convert.ToString(rsoReader["name"]);
                    }
                    else
                    {
                        Response.Write("Error Occurred");
                    }

                    //counts the number of events organized by the rso
                    strSQL = String.Format("SELECT COUNT(*) FROM organizedBy O WHERE O.rsoID={0}", rsoIDS[i - 1]);
                    SqlCommand eventsCommand = new SqlCommand(strSQL, objConnection);

                    row.Cells[1].InnerHtml = Convert.ToString(Convert.ToInt32(eventsCommand.ExecuteScalar()));
                    row.Cells[1].Align = "Center";

                    //counts the number of students in the rso
                    strSQL = String.Format("SELECT COUNT(*) FROM memberOf M WHERE M.rsoID={0}", rsoIDS[i - 1]);
                    SqlCommand studentsCommand = new SqlCommand(strSQL, objConnection);

                    row.Cells[2].InnerHtml = Convert.ToString(Convert.ToInt32(studentsCommand.ExecuteScalar()));
                    row.Cells[2].Align = "Center";

                    //if the student is a member of the RSO, disable the button
                    HtmlButton button = (HtmlButton)this.FindControl("button" + i);

                    strSQL = String.Format("SELECT COUNT(*) FROM memberOf M WHERE M.rsoID={0} AND M.studentID={1}", rsoIDS[i - 1], Session["studentID"]);
                    SqlCommand memberCommand = new SqlCommand(strSQL, objConnection);
                    int isAMember = Convert.ToInt32(memberCommand.ExecuteScalar());

                    if (isAMember != 0)
                    {
                        button.Disabled = true;
                    }

                }
                else
                {
                    rsoIDS[i-1] = -1;
                    row.Visible = false;
                    HtmlButton button = (HtmlButton)this.FindControl("button" + i);
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

    protected void joinRSO(int rsoIndex)
    {
        SqlConnection objConnection = new SqlConnection("Data Source=184.168.194.68;Initial Catalog=EventsDB;Integrated Security=False;User ID=kevin95duarte;password=sqlpassword1;Connect Timeout=15;Encrypt=False;Packet Size=4096;MultipleActiveResultSets=True");

        try
        {
            objConnection.Open();

            //inserts the student into the memberOf table with the rso they joined
            String strSQL = String.Format("INSERT INTO memberOf(studentID, rsoID) VALUES({0}, {1})", Session["studentID"], rsoIDS[rsoIndex]);
            SqlCommand uniCommand = new SqlCommand(strSQL, objConnection);
            uniCommand.ExecuteNonQuery();

            HtmlButton button = (HtmlButton)this.FindControl("button" + (rsoIndex + 1));
            button.Disabled = true;

            Response.Write("You have successfully joined the rso.");

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


    protected void btnRow1_Click(object sender, EventArgs e)
    {
        if (rsoIDS[0] == -1)
            return;

        joinRSO(0);
    }

    protected void btnRow2_Click(object sender, EventArgs e)
    {
        if (rsoIDS[1] == -1)
            return;

        joinRSO(1);
    }

    protected void btnRow3_Click(object sender, EventArgs e)
    {
        if (rsoIDS[2] == -1)
            return;

        joinRSO(2);
    }

    protected void btnRow4_Click(object sender, EventArgs e)
    {
        if (rsoIDS[3] == -1)
            return;

        joinRSO(3);
    }

    protected void btnRow5_Click(object sender, EventArgs e)
    {
        if (rsoIDS[4] == -1)
            return;

        joinRSO(4);
    }

    protected void btnRow6_Click(object sender, EventArgs e)
    {
        if (rsoIDS[5] == -1)
            return;

        joinRSO(5);
    }

    protected void btnRow7_Click(object sender, EventArgs e)
    {
        if (rsoIDS[6] == -1)
            return;

        joinRSO(6);
    }
   

}