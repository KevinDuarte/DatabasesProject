using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Universities : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection objConnection = new SqlConnection("Data Source=184.168.194.68;Initial Catalog=EventsDB;Integrated Security=False;User ID=kevin95duarte;password=sqlpassword1;Connect Timeout=15;Encrypt=False;Packet Size=4096;MultipleActiveResultSets=True");

        try 
        {
            objConnection.Open();

            for (int i = 1; i <= 7; i++)
            {
                //gets the university from the database
                string strSQL = String.Format("select * from university where universityID={0}", i);
                SqlCommand uniCommand = new SqlCommand(strSQL, objConnection);
                SqlDataReader uniReader = uniCommand.ExecuteReader();

                HtmlTableRow row = (HtmlTableRow)this.FindControl("row" + i);

                //gets the university information
                if (uniReader.Read())
                {
                    row.Cells[3].InnerHtml = Convert.ToString(uniReader["description"]);
                }
                else
                {
                    Response.Write("Error");
                }
                
                //amount of students that attend the university
                strSQL = String.Format("select COUNT(*) from attends A where A.universityID={0}", i);
                SqlCommand attendsCommand = new SqlCommand(strSQL, objConnection);

                row.Cells[2].InnerHtml = Convert.ToString(Convert.ToInt32(attendsCommand.ExecuteScalar()));
                row.Cells[2].Align = "Center";

                //location
                strSQL = String.Format("select * from locatedAt L where L.universityID={0}", i);
                SqlCommand locatedAtCommand = new SqlCommand(strSQL, objConnection);
                SqlDataReader locatedAtReader = locatedAtCommand.ExecuteReader();

                //gets the address information
                if(locatedAtReader.Read())
                {
                    row.Cells[1].InnerHtml = Convert.ToString(locatedAtReader["address"]);
                }
                else 
                {
                    Response.Write("Error");
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

}