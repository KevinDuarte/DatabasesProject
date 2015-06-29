using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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


        //TODO connect to database and add the information
    }
}