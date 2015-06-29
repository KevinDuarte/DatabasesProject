<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>


 <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

   <head runat="server"> <!-- Beginning of the head -->
        <!--  
           -->

      <meta charset="UTF-8" />
      <title>University Events: Home</title>

      <link href="Home.css" rel="stylesheet" type="text/css" />
      <link href="HomeChart.css" rel="stylesheet" type="text/css" />

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
            <h2>Tell us about your experience!</h2>
            <p>
            </p>
         </article>

            -->
      </header>

      </header> <!-- End of header -->
    
        <div id="content">  <!-- Beginning of log in information  -->
        <section>
         
            <!-- Beginning of Customer Information -->
            <fieldset id="AccountInformation">
            <legend>Forgot Password</legend>


            <!-- Asks the user to enter their email address -->
            <label for="email">E-mail *</label>
            <input name="email" id="email" type="email" 
                   required="required" />


            <button type="submit" runat="server" OnServerClick="btnSubmit_Click">Submit</button>
            </fieldset>
  
      </section> <!-- End of section -->
      </div> <!-- End of log in information  -->

     <div id="footer"> <!-- Beginning of footer -->
      <footer> 
         <address>
           Copyright &copy 2015 Univerisity Events. All rights reserved.
         </address>
      </footer> 
     </div>  <!-- End of footer  -->

     </div>  <!-- End of wrapper -->

    </form>

    </body> <!-- End of body -->


</html>