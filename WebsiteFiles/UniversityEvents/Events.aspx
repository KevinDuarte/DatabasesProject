<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Events.aspx.cs" Inherits="Events" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

   <head runat="server"> <!-- Beginning of the head -->

      <meta charset="UTF-8" />
      <title>University Events: Events</title>

      <link href="events.css" rel="stylesheet" type="text/css" />
      <link href="eventTable.css" rel="stylesheet" type="text/css" />
      <script src="jquery-1.11.3.min.js"></script>
   


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

 

      </header>

      </header> <!-- End of header -->

      <div id="content"> <!-- Beginning of content -->
      <section>
       
          <hgroup>
            <h2>Events</h2>
         </hgroup>

         <!-- State the purpose of the table -->
         <p>    <br />     </p>

         <table class="events"
                summary="Lists Events for a specific University">
             
            <colgroup>
               <col class="EventName" />
               <col class="information" span="5" />
 
            </colgroup>

            <thead> <!-- Heading of the table / Days of the week for Events -->
                <tr>
                  <th>Event Name</th>
                  <th>Category</th>
                  <th>Description</th>
                  <th>Date</th>
                  <th>Time</th>
                  <th>Contact Phone Number</th>
                  <th>Contact E-mail</th>
               </tr>
            </thead>

            <tbody> <!-- Beginning of the body of the table -->              
               <tr>
                  <!-- x -->
                  <th> </th>  
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  
               </tr>
               
               <tr>
                  <!--  -->
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>                 
                  <td colspan="1"> </td> 
                 
               </tr>
              
               <tr>
                  <!--  -->
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>             
                  <td colspan="1"> </td>        
                  
               </tr>
               
               <tr>
                  <!--  -->
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>         
                  <td colspan="1"> </td>
                 
               </tr>
              
               <tr>
                  <!--  -->
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>            
                  <td colspan="1"> </td>
                 
               </tr>
              
               <tr>
                  <!--  -->
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>                
                  <td colspan="1"> </td>
                 
               </tr>

               <tr>
                  <!--  -->
                  <th> </th>
                  <td contenteditable='true' colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                 
               </tr>

                <tr>
                  <!--  -->
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                
               </tr>

               <tr>
                  <!--  -->
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                 
               </tr>

               <tr>
                  <!--  -->
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                 
               </tr>

                <tr>
                  <!--  -->
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                
               </tr>

                <tr>
                  <!--  -->
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                
               </tr>

                <tr>
                  <!--  -->
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
               
               </tr>

                <tr>
                  <!--  -->
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
            
               </tr>

               <tr>
                  <!--  -->
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
            
               </tr>

            </tbody> <!-- End of the body of the table -->
        
            <!-- <a href="CreateEvent.html"><button>Add Event</button> -->
            <caption align ="bottom">   </caption>            
        
         </table> <!-- End of the table -->

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