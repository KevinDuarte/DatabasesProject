<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewRSO.aspx.cs" Inherits="ViewRSO" %>


 <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

   <head runat="server"> <!-- Beginning of the head -->
    
      <meta charset="UTF-8" />
      <title>University Events: RSO</title>

      <link href="ViewRSO.css" rel="stylesheet" type="text/css" />
      <link href="ViewRSOTable.css" rel="stylesheet" type="text/css" />
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
            <h2>RSOs</h2>
         </hgroup>

         <!-- State the purpose of the table -->
         <p>    <br />     </p>


<!------------------------------------------------------

    Beginning of table for Universitites

-------------------------------------------------------->



         <table class="universities"
                summary="Universities information page">
             
            <colgroup>
               <col class="RSOName" />
               <col class="information" span="3" />
               
            </colgroup>


<!-------------------------------------------------------------

        Beginning of share buttons


----------------------------------------------------------------->

      <div id="share-buttons">

             
    <!-- Twitter -->
     <a href="https://twitter.com/share" target="_blank">
        <img src="https://simplesharebuttons.com/images/somacro/twitter.png" alt="Twitter" />
     </a>

    <!-- Enter website url after u in the linl -->
     <a href="http://www.facebook.com/sharer.php?u" target="_blank">
        <img src="https://simplesharebuttons.com/images/somacro/facebook.png" alt="Facebook" />
     </a>

     <a href="http://www.tumblr.com/share/link?url=https://simplesharebuttons.com&amp;title=Simple Share Buttons" target="_blank">
        <img src="https://simplesharebuttons.com/images/somacro/tumblr.png" alt="Tumblr" />
     </a>

     </div>

<!-------------------------------------------------------------

        End of share buttons


----------------------------------------------------------------->




            <thead> <!-- Heading of the table / Days of the week for Events -->
                <tr>
                  <th>RSO Name</th>
                  <th>Location</th>
                  <th>Number of Students</th>
                  <th>Request to join RSO</th>
               </tr>
            </thead>

            <tbody> <!-- Beginning of the body of the table -->              
               <tr>
                  <!-- x -->
                  <th>Insert RSO name here </th>  
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button>Join</button> </td>
                  
               </tr>
               
               <tr>
                  <!--  -->
                  <th>Insert RSO name here </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button>Join</button> </td>
                  
               </tr>
              
               <tr>
                  <!--  -->
                  <th>Insert RSO name here </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button>Join</button> </td>
                 
               </tr>
               
               <tr>
                  <!--  -->
                  <th>Insert RSO name here </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button>Join</button> </td>
                  
               </tr>
              
               <tr>
                  <!--  -->
                  <th>Insert RSO name here </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button>Join</button> </td>
                  
               </tr>
              
               <tr>
                  <!--  -->
                  <th>Insert RSO name here </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button>Join</button> </td>
                  
               </tr>

               <tr>
                  <!--  -->
                  <th>Insert RSO name here</th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button>Join</button> </td>
                  
               </tr>

            </tbody> <!-- End of the body of the table -->
        
            <!-- <a href="CreateEvent.html"><button>Add Event</button> -->
            <caption align ="bottom">   </caption>            
        
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