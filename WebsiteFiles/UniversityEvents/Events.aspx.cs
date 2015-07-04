﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Events : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if(Session["studentID"] != null)
            Response.Write(Session["studentID"]);
    }

    protected void btnComment_Click(object sender, EventArgs e)
    {
        Response.Redirect("Comments.aspx");
    }
}