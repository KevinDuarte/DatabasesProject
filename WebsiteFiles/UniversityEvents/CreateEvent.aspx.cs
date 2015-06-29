using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
        string date = String.Format("{0}", Request.Form["date"]);
        string time = String.Format("{0}", Request.Form["time"]);
        string phone = String.Format("{0}", Request.Form["PhoneNumber"]);
        string email = String.Format("{0}", Request.Form["email"]);

        //TODO connect to database and create the event
    }
}