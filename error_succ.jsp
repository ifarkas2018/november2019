<%-- 
    Document   : error.jsp
    Created on : 19-Nov-2018, 02:31:59
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Book</title>
        <link href="css/templatecss.css" rel="stylesheet" type="text/css">
        <style>
            .red_text {
                color:red; /* red text color */
            }
        </style>
        <%@ include file="header.jsp"%>
    </head>
    <body>
        <div class="whitebckgr">
            <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                <div class="col-lg-6 col-md-6"> 
                    <br /><br />
                    <div> <!-- horizontally centering the picture using center-image, img-fluid is for responsive image -->
                        <img src="images/books.png" class="img-fluid center-image" alt="picture of books" title="picture of books"> 
                    </div>
                </div>
                       
                <div class="col-lg-5 col-md-5"> 
                    <div class="container">
                        <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                            <div class="col">
                                &nbsp; &nbsp;
                                <br/>
                                <!-- <h3>Search</h3> --><br/><br/><br/>
                                <%
                                    HttpSession hSession = request.getSession();
                                    // the title passed from the other JSP ( addDB.jsp or searchDb.jsp )
                                    //String sJSPFile = (String)hSession.getAttribute("jsp_file");
                                    String sSource = (String)hSession.getAttribute("source_name");
                                    String sTitle = (String)hSession.getAttribute("title");
                                    // the message passed from the other JSP ( addDB.jsp or searchDb.jsp )
                                    String sMessage = (String)hSession.getAttribute("message");
                                    //out.print("My Message" + sMessage);
                                    out.print("<h1 class=\"red_text\">");
                                        out.print( sTitle ); 
                                        out.print("</h1>");
                                        out.print("<br/><br/>");
                                    if (sMessage.equalsIgnoreCase("ERR_ADD")){
                                        out.print("An error occurred while adding the book to the database and the book wasn't successfully added to the database!"); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_SEARCH")){
                                        out.print("An error occurred during the search!"); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_ADD_EXISTS")){
                                        out.print("Error! The book with that ISBN already exists in the database!"); 
                                    } else if (sMessage.equalsIgnoreCase("SUCC_ADD")){
                                        out.print("The book was successfully added to the database!");                                    }
                                    //else { 
                                            //out.print("Some other branch");
                                    //}
                                    
                                    if (sSource.equalsIgnoreCase("Add Book")){
                                %>
                                
                                <form action="add_page.jsp" method="post">
                                <%
                                    } else if (sSource.equalsIgnoreCase("Search")){
                                %>
                                <form action="search_page.jsp" method="post">  
                                <%
                                    }                               
                                %>
                                    <br/><br/>
                                    <!-- adding the Back button to the form; btn-sm is used for smaller ( narrower ) size of the control -->
                                    <button type="submit" class="btn btn-info btn-sm">To <%=sSource%> </button>
                                </form>
                                
                            </div> <!-- end of class="col" -->
                        </div> <!-- end of class="row" --> 
                    </div> <!-- end of class="container" -->
                </div> <!-- end of class="col-lg-5 col-md-5" -->
            </div> <!-- end of class="row" -->
        </div> <!-- end of class="whitebckgr" -->
            
        <!-- adding a new row; class whitebckgr is for setting the background to white -->
        <div class="whitebckgr">
            <div class="col">
                &nbsp; &nbsp;
            </div>
        </div> 
        
        <%@ include file="footer.jsp"%> 
    </body>
</html>
