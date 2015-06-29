﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateEvent.aspx.cs" Inherits="CreateEvent" %>



 <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

   <head runat="server"> <!-- Beginning of the head -->

      <meta charset="UTF-8" />
      <title>University Events: New Event</title>

      <link href="CreateRSO.css" rel="stylesheet" type="text/css" />
      <link href="CreateRSOChart.css" rel="stylesheet" type="text/css" />

   </head> <!-- End of head -->

   <body> <!-- Beginning of the body -->

      <form id="form1" runat="server">

      <div id="wrapper">
      <header> <!--Beginning of the header -->


       <h1>University Events</h1> <!-- University Events Website  -->

         <nav>
            <ul> <!-- Unordered list for webpage links -->
               <li><a href="Home.aspx">Home</a></li>
               <li><a href="Universities.aspx">Universities</a></li>
               <li><a href="About.html">About</a></li>
               <li><a href="#">RSO</a>
                    <ul>
                        <a href="CreateRSO.aspx">Create RSO</a>
                        <a href="ViewRSO.aspx">View/Join RSO</a>
                    </ul>
               </li>
               <li><a href="#">Events</a>
                    <ul>
                        <a href="CreateEvent.aspx">Create Events</a>  <!--- Can only be accessed by the admin  -->
                        <a href="Events.aspx">View Events</a>
                    </ul>
               </li>
                              
            </ul>
         </nav>

                <!-- Explains the purpose  
        <article>
            <h2>Heading</h2>
            <p>
            </p>
         </article>

            -->
      </header>  <!-- End of header -->

      <div id="content">
      <section>
              
            <!-- Beginning of Customer Information -->
         <fieldset id="User Information">
            <legend>Create New Event</legend>

            <label for="EventName">Event Name *</label>
            <input name="EventName" id="EventName" type="text" 
                   placeholder= "Event Name"
                   required="required" />
    
            <!-- Asks the user to enter their email address -->
            <label for="EventCategoy">Event Category *</label>
            <input name="EventCategory" id="EventCategory" type="text" 
                   required="required" />

            <!-- Asks the user to enter their email address -->
            <label for="description">Description *</label>
            <input name="description" id="description" type="text" 
                   required="required" />

            <!-- Asks the user to enter their email address -->
            <label for="date">Date *</label>
            <input name="date" id="date" type="date" 
                   required="required" />

            <!-- Asks the user to enter their email address -->
            <label for="time">Time *</label>
            <input name="time" id="time" type="time"
                   required="required" />

            <!-- Asks the user to enter their email address -->
            <label for="PhoneNumber">Contact Phone Number *</label>
            <input name="PhoneNumber" id="PhoneNumber" type="tel" 
                   required="required" />

            <!-- Asks the user to enter their email address -->
            <label for="email">Contact E-mail *</label>
            <input name="email" id="email" type="email" 
                   required="required" />
      
            

            <button type="submit" runat="server" OnServerClick="btnSubmit_Click">Submit</button> 

            <button type="reset">Clear</button> 

          </fieldset>
           
      </section> <!-- End of section -->
      </div> <!-- End of content -->
     
      <div id="footer"> <!-- Beginning of footer -->
      <footer> 
         <address>
           Copyright &copy 2015 Univerisity Events. All rights reserved.
         </address>
      </footer> 
      </div>  <!-- End of footer -->

    </div>  <!-- End of wrapper -->

   </form>

</body> <!-- End of body -->


</html>