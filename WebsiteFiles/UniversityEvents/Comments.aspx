<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Comments.aspx.cs" Inherits="Comments" %>


 <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

   <head runat="server"> <!-- Beginning of the head -->
        <!--  
           -->
    
      <meta charset="UTF-8" />
      <title>University Events: Event Comments</title>

      <link href="Comments.css" rel="stylesheet" type="text/css" />
      <link href="CommentsTable.css" rel="stylesheet" type="text/css" />


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

 

      </header> <!-- End of header -->

      <div id="content"> <!-- Beginning of content -->
      <section>
       
          <hgroup>
            <h2>Event Comments</h2>
         </hgroup>

         <!-- State the purpose of the table -->
         <p>    <br />     </p>


<!------------------------------------------------------

    Beginning of table for Universitites

-------------------------------------------------------->
   <div id="respond">

  <h3 id="text">Leave a Comment</h3>

        <label for="comment_author" class="required" id="text">Name: </label>
        <input type="text" name="comment_author" id="comment_author" value="" tabindex="1" required="required">

        <label for="email" class="required" id="text">E-mail: </label>
        <input type="email" name="email" id="email" value="" tabindex="2" required="required">

        <label for="comment" class="required" id="text">Message</label>
        <textarea name="comment" id="comment" rows="10" tabindex="4"  required="required"></textarea>

        <!-- comment_post_ID value hard-coded as 1 -->
        <input type="hidden" name="comment_post_ID" value="1" id="comment_post_ID" />
        <input name="submit" type="submit" value="Submit comment" id="submit" runat="server" OnServerClick="btnSubmitCom_Click"/>

  

</div>


<!------------------------------------------------------

    End of table for Universitites

-------------------------------------------------------->



      </section> <!-- End of section -->
      </div>  <!-- End of content -->
     
      <div id="footer"> <!-- Beginning of footer -->
      <footer> 
         <address>
           Copyright &copy 2015 Univerisity Events. All rights reserved.
         </address>
      </footer> 
      </div>    <!-- End of footer -->

    </div> <!-- End of wrapper -->

   </form>

</body> <!-- End of body -->

</html>