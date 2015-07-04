<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateRSO.aspx.cs" Inherits="CreateRSO" %>


 <!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">

   <head runat="server"> <!-- Beginning of the head -->

      <meta charset="UTF-8" />
      <title>University Events: New RSO</title>

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
               
               <li><a href="Universities.aspx">Universities</a></li>
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
               <li><a href="Home.aspx">Logout</a></li>
                      
            </ul>
         </nav>

                <!-- Explains the purpose  
        <article>
            <h2>Heading</h2>
            <p>
            </p>
         </article>

            -->
      </header> <!-- End of header -->

      <div id="content">
      <section>
           
            <!-- Beginning of Customer Information -->
         <fieldset id="User Information">
            <legend>Create New RSO</legend>

            <label for="RSOName">RSO Name *</label>
            <input name="RSOName" id="RSOName" type="text" 
                   placeholder= "RSO Name"
                   required="required" />
    
            <!-- Asks the user to enter their email address -->
            <label for="email">E-mail *</label>
            <input name="email" id="email" type="email" 
                   required="required" />

            <!-- Asks the user to enter their email address -->
            <label for="email">Student 1 E-mail *</label>
            <input name="email1" id="email1" type="email" 
                   required="required" />

            <!-- Asks the user to enter their email address -->
            <label for="email">Student 2 E-mail *</label>
            <input name="email2" id="email2" type="email" 
                   required="required" />

            <!-- Asks the user to enter their email address -->
            <label for="email">Student 3 E-mail *</label>
            <input name="email3" id="email3" type="email" 
                   required="required" />

            <!-- Asks the user to enter their email address -->
            <label for="email">Student 4 E-mail *</label>
            <input name="email4" id="email4" type="email" 
                   required="required" />

            <!-- Asks the user to enter their email address -->
            <label for="email">Student 5 E-mail *</label>
            <input name="email5" id="email5" type="email" 
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