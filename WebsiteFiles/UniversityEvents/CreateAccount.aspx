﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateAccount.aspx.cs" Inherits="CreateAccount" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

   <head runat="server"> <!-- Beginning of the head -->
        <!--  
           -->

      <meta charset="UTF-8" />
      <title>University Events: New User</title>

      <link href="CreateAccount.css" rel="stylesheet" type="text/css" />
      <link href="AccountChart.css" rel="stylesheet" type="text/css" />

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
            <legend>Account Information</legend>

            <label for="firstName">First Name *</label>
            <input name="firstName" id="firstName" type="firstName" 
                   placeholder= "First Name"
                   required="required" />

             <label for="lastName">Last Name *</label>
            <input name="lastName" id="lastName" type="lastName" 
                   placeholder= "Last Name"
                   required="required" />
    

            <!-- Asks the user to enter their email address -->
            <label for="email">E-mail *</label>
            <input name="email" id="email" type="email" 
                   required="required" />

            <!-- Asks the user to enter their password -->
            <label for="password">Password *</label>
            <input name ="password" id="password" type="password"
                   required="required" />

            <label>Which University do you attend?</label>
            <select name="universityInfo" id="universityInfo" size="1" required="required">
               <option value="UCF">University of Central Florida</option>
               <option value="USF">University of South Florida</option>
               <option value="UM">University of Miami</option>
               <option value="UF">University of Florida</option>
               <option value="FSU">Florida State University</option>
               <option value="FIU">Florida International University</option>
               <option value="FAU">Florida Atlantic University</option>
            </select>

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