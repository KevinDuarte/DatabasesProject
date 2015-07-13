<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Universities.aspx.cs" Inherits="Universities" %>

 <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

   <head runat="server"> <!-- Beginning of the head -->
    
      <meta charset="UTF-8" />
      <title>University Events: Universities</title>

      <link href="Universities.css" rel="stylesheet" type="text/css" />
      <link href="UniversitiesTable.css" rel="stylesheet" type="text/css" />
      <script src="jquery-1.11.3.min.js"></script>
   


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
            <h2>Universities</h2>
         </hgroup>

         <!-- State the purpose of the table -->
         <p>    <br />     </p>


<!------------------------------------------------------

    Beginning of table for Universitites

-------------------------------------------------------->



         <table class="universities"
                summary="Universities information page">
             
            <colgroup>
               <col class="hours" />
               <col class="weekday" span="3" />
               
            </colgroup>

            <thead> <!-- Heading of the table / Days of the week for Events -->
                <tr>
                  <th>Universities</th>
                  <th>Location</th>
                  <th>Number of Students</th>
                  <th>Information</th>
               </tr>
            </thead>

            <tbody> <!-- Beginning of the body of the table -->              
               <tr runat="server" id="row1">
                  <th>University of Central Florida</th>  
                  <td colspan="1">UCF Location</td>
                  <td colspan="1">UCF num of students</td>
                  <td colspan="1">Information</td>
                  
               </tr>
               
               <tr runat="server" id="row2">
                  <th>University of South Florida</th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  
               </tr>
              
               <tr runat="server" id="row3">
                  <th>University of Miami</th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                 
               </tr>
               
               <tr runat="server" id="row4">
                  <th>University of Florida</th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  
               </tr>
              
               <tr runat="server" id="row5">
                  <th>Florida State University</th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  
               </tr>
              
               <tr runat="server" id="row6">
                  <th>Florida International University</th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  
               </tr>

               <tr runat="server" id="row7">
                  <th>Florida Atlantic University</th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  
               </tr>

            </tbody> <!-- End of the body of the table -->
        
            <!-- <a href="CreateEvent.html"><button>Add Event</button> -->
            <caption align="bottom">   </caption>            
        
         </table> <!-- End of the table -->

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
