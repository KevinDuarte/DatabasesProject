using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class Details : System.Web.UI.Page
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

            if(eventReader.Read())
            {
                HtmlGenericControl eventName = (HtmlGenericControl)this.FindControl("EventNameHere");
                eventName.InnerHtml = Convert.ToString(eventReader["name"]);

                HtmlTableRow row = (HtmlTableRow)this.FindControl("categoryRow");
                row.Cells[1].InnerHtml = Convert.ToString(eventReader["type"]);

                row = (HtmlTableRow)this.FindControl("descriptionRow");
                row.Cells[1].InnerHtml = Convert.ToString(eventReader["description"]);

                row = (HtmlTableRow)this.FindControl("dateRow");
                row.Cells[1].InnerHtml = Convert.ToString(eventReader["date"]).Substring(0, Convert.ToString(eventReader["date"]).IndexOf(' '));

                row = (HtmlTableRow)this.FindControl("timeRow");
                row.Cells[1].InnerHtml = Convert.ToString(eventReader["time"]);

                row = (HtmlTableRow)this.FindControl("phoneRow");
                row.Cells[1].InnerHtml = Convert.ToString(eventReader["contact_phone"]);

                row = (HtmlTableRow)this.FindControl("emailRow");
                row.Cells[1].InnerHtml = Convert.ToString(eventReader["contact_email"]);

                strSQL = String.Format("SELECT * FROM heldAt H WHERE H.eventID={0}", eventReader["eventID"]);
                SqlCommand locationCommand = new SqlCommand(strSQL, objConnection);
                SqlDataReader locationReader = locationCommand.ExecuteReader();

                if(locationReader.Read())
                {
                    row = (HtmlTableRow)this.FindControl("locationRow");
                    row.Cells[1].InnerHtml = Convert.ToString(locationReader["address"]);
                }
                else
                {
                    Response.Write("An error has occurred");
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

    protected void btnComment_Click(object sender, EventArgs e)
    {
        Response.Redirect("Comments.aspx");
    }
}