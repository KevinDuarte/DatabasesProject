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

     


      <!------------------------------------------------------------------------

    Table for Public Events

------------------------------------------------------------------------->

      <div id="content"> <!-- Beginning of content -->
      <section id = "publicEvents">
       
          <hgroup>
            <h2>Public Events</h2>
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
               <col class="information" span="5" />
 
            </colgroup>

            <thead> <!-- Heading of the table / Days of the week for Events -->
                <tr>
                  <th>Event Name</th>
                  <th>Date</th>
                  <th>Time</th>
                  <th>Location</th>
                  <th>Details</th>
                  <th>Comments</th>
               </tr>
            </thead>

            <tbody> <!-- Beginning of the body of the table -->              
               <tr runat="server" id="publicRow1">
                  <th> </th>  
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>   
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det1">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com1">Add/View/Edit</button> </td>
               </tr>
               
               <tr runat="server" id="publicRow2">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det2">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com2">Add/View/Edit</button> </td>
               </tr>
              
               <tr runat="server" id="publicRow3">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det3">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com3">Add/View/Edit</button> </td>
               </tr>
               
               <tr runat="server" id="publicRow4">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det4">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com4">Add/View/Edit</button> </td>
               </tr>
              
               <tr runat="server" id="publicRow5">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det5">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com5">Add/View/Edit</button> </td>
               </tr>
              
               <tr runat="server" id="publicRow6">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det6">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com6">Add/View/Edit</button> </td>
               </tr>

               <tr runat="server" id="publicRow7">
                  <th> </th>
                  <td contenteditable='true' colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det7">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com7">Add/View/Edit</button> </td>
               </tr>

                <tr runat="server" id="publicRow8">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det8">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com8">Add/View/Edit</button> </td>
               </tr>

               <tr runat="server" id="publicRow9">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det9">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com9">Add/View/Edit</button> </td>
               </tr>

               <tr runat="server" id="publicRow10">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det10">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com10">Add/View/Edit</button> </td>
               </tr>

            </tbody> <!-- End of the body of the table -->
        
            <!-- <a href="CreateEvent.html"><button>Add Event</button> -->
            <caption align ="bottom">   </caption>            
        
         </table> <!-- End of the table -->

      </section> <!-- End of section -->


 <!------------------------------------------------------------------------

    End of table for Public Events

------------------------------------------------------------------------->   


<!------------------------------------------------------------------------

    Table for RSO Events

------------------------------------------------------------------------->

      <div id="content"> <!-- Beginning of content -->
      <section id = "RSOEvents">
       
          <hgroup>
            <h2>RSO Events</h2>
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
                  <th>Date</th>
                  <th>Time</th>
                  <th>RSO</th>
                  <th>Details</th>
                  <th>Comments</th>
               </tr>
            </thead>

            <tbody> <!-- Beginning of the body of the table -->              
               <tr runat="server" id="rsoRow1">
                  <th> </th>  
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det11">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com11">Add/View/Edit</button> </td>
               </tr>
               
               <tr runat="server" id="rsoRow2">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det12">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com12">Add/View/Edit</button> </td>
               </tr>
              
               <tr runat="server" id="rsoRow3">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det13">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com13">Add/View/Edit</button> </td>
               </tr>
               
               <tr runat="server" id="rsoRow4">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det14">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com14">Add/View/Edit</button> </td>
               </tr>
              
               <tr runat="server" id="rsoRow5">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det15">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com15">Add/View/Edit</button> </td>
               </tr>
              
               <tr runat="server" id="rsoRow6">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det16">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com16">Add/View/Edit</button> </td>
               </tr>

               <tr runat="server" id="rsoRow7">
                  <th> </th>
                  <td contenteditable='true' colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det17">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com17">Add/View/Edit</button> </td>
               </tr>

                <tr runat="server" id="rsoRow8">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det18">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com18">Add/View/Edit</button> </td>
               </tr>

               <tr runat="server" id="rsoRow9">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det19">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com19">Add/View/Edit</button> </td>
               </tr>

               <tr runat="server" id="rsoRow10">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det20">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com20">Add/View/Edit</button> </td>
               </tr>


            </tbody> <!-- End of the body of the table -->
        
            <!-- <a href="CreateEvent.html"><button>Add Event</button> -->
            <caption align ="bottom">   </caption>            
        
         </table> <!-- End of the table -->

      </section> <!-- End of section -->

<!------------------------------------------------------------------------

    End of table for RSO Events

------------------------------------------------------------------------->


<!------------------------------------------------------------------------

    Table for Private Events

------------------------------------------------------------------------->

      <div id="content"> <!-- Beginning of content -->
        <section id = "PrivateEvents">
       
          <hgroup>
            <h2>Private Events</h2>
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
                  <th>Date</th>
                  <th>Time</th>
                  <th>Location</th>
                  <th>Details</th>
                  <th>Comments</th>
               </tr>
            </thead>

            <tbody> <!-- Beginning of the body of the table -->              
               <tr runat="server" id="privateRow1">
                  <th> </th>  
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det21">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com21">Add/View/Edit</button> </td>
               </tr>
               
               <tr runat="server" id="privateRow2">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det22">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com22">Add/View/Edit</button> </td>
               </tr>
              
               <tr runat="server" id="privateRow3">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det23">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com23">Add/View/Edit</button> </td>
               </tr>
               
               <tr runat="server" id="privateRow4">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det24">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com24">Add/View/Edit</button> </td>
               </tr>
              
               <tr runat="server" id="privateRow5">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det25">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com25">Add/View/Edit</button> </td>
               </tr>
              
               <tr runat="server" id="privateRow6">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det26">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com26">Add/View/Edit</button> </td>
               </tr>

               <tr runat="server" id="privateRow7">
                  <th> </th>
                  <td contenteditable='true' colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det27">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com27">Add/View/Edit</button> </td>
               </tr>

                <tr runat="server" id="privateRow8">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det28">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com28">Add/View/Edit</button> </td>
               </tr>

               <tr runat="server" id="privateRow9">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det29">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com29">Add/View/Edit</button> </td>
               </tr>

               <tr runat="server" id="privateRow10">
                  <th> </th>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnDetails_Click" id="det30">View</button> </td>
                  <td colspan="1"> <button runat="server" OnServerClick="btnComment_Click" id="com30">Add/View/Edit</button> </td>
               </tr>

            </tbody> <!-- End of the body of the table -->
        
            <!-- <a href="CreateEvent.html"><button>Add Event</button> -->
            <caption align ="bottom">   </caption>            
        
         </table> <!-- End of the table -->

      </section> <!-- End of section -->



<!------------------------------------------------------------------------

    End of table for Private Events

------------------------------------------------------------------------->
     
      </div>

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