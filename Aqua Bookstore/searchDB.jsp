<%-- 
    Document   : search
    Created on : 18-Sep-2018, 00:54:05
    Author     : Ingrid Farkas
    I used mysql-connector-java-5.1.47-bin.jar
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.CharSequence"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/templatecss.css" type="text/css" rel="stylesheet"/>
        <title>JSP Page</title>
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
                                <h3>Search</h3><br/>
                                <%!
                                    // cont_wildcard returns true if the string contains one of wildcards % or _. Otherwise it returns false
                                    boolean cont_wildcard(String str)
                                    {
                                        CharSequence undersc = "_";
                                        CharSequence percentage = "%";
                                        // does the string contain _ or %
                                        if ((str.contains(undersc)) || (str.contains(percentage)))
                                            return true;
                                        else
                                            return false;
                                    }
                                %>
                                <%
                                try{ 
                                    String form_title = request.getParameter("title"); // the text entered as the title
                                    String form_auth = request.getParameter("author"); // the text entered as the author
                                    String form_isbn = request.getParameter("isbn"); // the text entered as the isbn
                                    String form_sortby = request.getParameter("sortby"); // the text entered as the sortby
                                    String form_categ = request.getParameter("categ"); // the option chosen in the drop-down list - category
                                    String form_price = request.getParameter("price_range"); // the option chosen in the drop-down list - price
                                %>  
                                <%
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3305/bookstore?useSSL=false", "root", "bird&2018");  
                                    Statement stmt = con.createStatement();
                                    
                                    String sQuery = "select b.title, b.price, a.au_name from book b, author a where (b.au_id = a.au_id)";
                                    //ResultSet rs = stmt.executeQuery("select title, au_name from book b, author a where (b.au_id = a.au_id) AND (title='" + 
                                    //form_title + "') AND (au_name='" + form_auth + "');");
                                  
                                    // if there is anything entered in input field with the label Title
                                    if (!(form_title.equalsIgnoreCase(""))) {
                                        // if the title contains ? or _ then add the Like 
                                        if (cont_wildcard(form_title)){
                                            sQuery += " AND (b.title LIKE '" + form_title+ "')";
                                        } else 
                                            sQuery += " AND (b.title='" + form_title + "')";
                                    }     
                                    
                                    // if there is anything entered in the input field with the label Author's Name
                                    if (!(form_auth.equalsIgnoreCase(""))) {
                                        // if the title contains ? or _ then add the Like 
                                        if (cont_wildcard(form_auth))
                                            sQuery += " AND (a.au_name LIKE '" + form_auth + "')";
                                        else
                                            sQuery += " AND (a.au_name='" + form_auth + "')";
                                    }
                                    
                                    // if there is anything entered in the input field with the label ISBN
                                    if (!(form_isbn.equalsIgnoreCase(""))) {
                                        // if the title contains ? or _ then add the Like 
                                        if (cont_wildcard(form_isbn))
                                            sQuery += " AND (b.isbn LIKE '" + form_isbn + "')";
                                        else
                                            sQuery += " AND (b.isbn='" + form_isbn + "')";
                                    }
                                    
                                    /*
                                    switch (form_categ){
                                        case "fict" : tempStr = "Fiction & Poetry";
                                                         break;
                                        case "bus" : tempStr = "Business";
                                                         break;
                                        case "edu" : tempStr = "Education";
                                                         break;
                                        case "comp" : tempStr = "Computing & IT";
                                                         break;
                                        case "child" : tempStr = "Children's";
                                                         break;
                                        default : tempStr = "";
                                                         break;                  
                                    }
                                    */
                                    
                                    String tempStr;
                                    if (form_categ.equalsIgnoreCase("fict"))
                                        tempStr = "Fiction & Poetry";
                                    else if (form_categ.equalsIgnoreCase("bus"))
                                        tempStr = "Business";
                                    else if (form_categ.equalsIgnoreCase("edu"))
                                        tempStr = "Education";
                                    else if (form_categ.equalsIgnoreCase("comp"))
                                        tempStr = "Computing & IT";
                                    else if (form_categ.equalsIgnoreCase("child"))
                                        tempStr = "Children's";
                                    else
                                        tempStr="";
                                    
                                    if (!(tempStr.equalsIgnoreCase(""))) 
                                        sQuery += " AND (b.category='" + tempStr + "')";
                                    
                                    tempStr="";
                                    if (form_price.equalsIgnoreCase("less5"))
                                        tempStr = "<5";
                                    else if (form_price.equalsIgnoreCase("betw5-10"))
                                        tempStr = "BETWEEN 5 AND 10";
                                    else if (form_price.equalsIgnoreCase("betw10-20"))
                                        tempStr = "BETWEEN 10 AND 20";
                                    else if (form_price.equalsIgnoreCase("betw20-30"))
                                        tempStr = "BETWEEN 20 AND 30";
                                    else if (form_price.equalsIgnoreCase("betw30-50"))
                                        tempStr = "BETWEEN 30 AND 50";
                                    if (form_price.equalsIgnoreCase("above50"))
                                        tempStr = ">50";
                                    
                                    if (!(tempStr.equalsIgnoreCase(""))) 
                                        sQuery += " AND (b.price '" + tempStr + "' )";
                                   
                                    sQuery += " ORDER BY b.price ";
                                    if (form_sortby.equalsIgnoreCase("low")) 
                                        sQuery += "ASC";
                                    else
                                        sQuery += "DESC";
                                    // out.print("sQuery: " + sQuery );
                                    
                                    sQuery += ";";
                                    out.print(sQuery);
                                    ResultSet rs = stmt.executeQuery(sQuery);
                                    out.print("<ul>");
                                    while(rs.next())
                                    {
                                        // out.print("*");
                                        String sTitle = rs.getString("title");
                                        // out.print(sTitle);
                                        String sAuthor = rs.getString("au_name");
                                        String sPrice = rs.getString("price");
                                        // out.print("<li>Title: " + sTitle);
                                        out.print("<li>Title: " + sTitle + " by" + sAuthor + "price: " + sPrice + "</li>" );
                                    }
                                    out.print("</ul>");
                                    // out.print("form_sortby" + form_sortby);
                                }catch(Exception e){
                                    out.print("Exception" + e);
                                }
                                %>
                                <%
                                    //out.print("<li>Title: " + sTitle + " by " + sAuthor + "price: " + sPrice + "</li>" );
                                %><!-- <br> --><%

                                %>
                                <!-- <br> <br><a href="http://localhost:8080/MyBookStore/Novi Sad">Download</a></span> -->

                                <%
                                 
                                %>
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
        <!-- </div>
        <div style="float: righ;">
         
        <img src="image/Book_icon.png" width="250" height="500" id="image_spc" style="margin-left: 60px;">
        </div>
     
        </div> -->  
        <%@ include file="footer.jsp"%>
    </body>
</html>
