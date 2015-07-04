using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Comments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmitCom_Click(object sender, EventArgs e)
    {
        string name = String.Format("{0}", Request.Form["comment_author"]);
        string email = String.Format("{0}", Request.Form["email"]);
        string comment = String.Format("{0}", Request.Form["comment"]);
    }
}