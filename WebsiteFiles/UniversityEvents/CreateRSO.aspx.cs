using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateRSO : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string rsoName = String.Format("{0}", Request.Form["RSOName"]);
        string email = String.Format("{0}", Request.Form["email"]);
        string email1 = String.Format("{0}", Request.Form["email1"]);
        string email2 = String.Format("{0}", Request.Form["email2"]);
        string email3 = String.Format("{0}", Request.Form["email3"]);
        string email4 = String.Format("{0}", Request.Form["email4"]);
        string email5 = String.Format("{0}", Request.Form["email5"]);

        //TODO connect to database and create the RSO
    }
}