<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Details" %>


 <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

   <head runat="server"> <!-- Beginning of the head -->
        <!--  
           -->
    
      <meta charset="UTF-8" />
      <title>University Events: Event Details</title>

      <link href="Details.css" rel="stylesheet" type="text/css" />
      <link href="DetailsTable.css" rel="stylesheet" type="text/css" />
  
   


   </head> <!-- End of head -->

   <body> <!-- Beginning of the body -->

       <form id="form1" runat="server">
      
      <div id="wrapper">      

      <header> <!--Beginning of the header -->


       <h1>University Events</h1> <!-- University Events Website  -->

         <nav>
            <ul> <!-- Unordered list for webpage links -->
               <li><a href="Universities.aspx">Universities</a></li>
               <li><a href="About.aspx">About</a></li>
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




<!------------------------------------------------------------------------

    Table for Public Events

------------------------------------------------------------------------->

      <div id="content"> <!-- Beginning of content -->
      <section id = "publicEvents">
       
          <hgroup>
            <h2 runat="server" id="EventNameHere">Insert event name here</h2>
         </hgroup>

         <!-- State the purpose of the table -->
         <p>    <br />     </p>

         <table class="events"
                summary="Lists Events for a specific University">

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


             
            <colgroup>
               <col class="EventName" />
               <col class="information" span="1" />
 
            </colgroup>


            <tbody> <!-- Beginning of the body of the table --> 
                <tr runat="server" id="categoryRow">
                  <th>Category </th>                                        
                  <td colspan="1"> Insert description here </td>
               </tr>
                             
               <tr runat="server" id="descriptionRow">
                  <th>Description </th>                                        
                  <td colspan="1"> Insert description here </td>
               </tr>
               
               <tr runat="server" id="dateRow">
                  <th>Date </th>          
                  <td colspan="1"> Insert date here   </td>
               </tr>
              
               <tr runat="server" id="timeRow">
                  <th>Time </th>                         
                  <td colspan="1"> Insert time here </td>
               </tr>

                <tr runat="server" id="locationRow">
                  <th>Location </th>                                        
                  <td colspan="1"> Insert description here </td>
               </tr>
               
               <tr runat="server" id="phoneRow">
                  <th>Contact Phone </th>
      
                  <td colspan="1"> Insert Contact phone here  </td>
               </tr>
              
               <tr runat="server" id="emailRow">
                  <th>Contact Email </th>              
                  <td colspan="1"> Insert Contact email here </td>
               </tr>
              
               <tr runat="server" id="commentRow">
                  <th>Comments </th>           
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click">View/Edit</button>  </td>
               </tr>
          

            </tbody> <!-- End of the body of the table -->
              
        
         </table> <!-- End of the table -->

      </section> <!-- End of section -->


 <!------------------------------------------------------------------------

    End of table for Public Events

------------------------------------------------------------------------->   


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