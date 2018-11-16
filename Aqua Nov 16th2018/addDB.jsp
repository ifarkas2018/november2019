<%-- 
    Document   : addDatabase
    Created on : 10-Nov-2018, 23:28:02
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
        
<%@page import="java.sql.PreparedStatement"%>

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
        <!-- <div>  
            <div style="float: left; margin-left: 100px; font-family:  serif; font-size: 13px;"> -->
        <%
        try{
            String formpubl = request.getParameter("publisher"); 
            String formauth = request.getParameter("author");
            String formtitle = request.getParameter("title");
            String formisbn = request.getParameter("isbn");
            String formcity = request.getParameter("publ_city");
        %>
         <h1 style="width: 800px">bla bla <%out.print(formpubl);%>
         
         %>
         <h1 style="margin-left: 40px;">Search Result</h1>
        
        <%
          Class.forName("com.mysql.jdbc.Driver");
          //Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "root");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3305/bookstore?useSSL=false", "root", "bird&2018");  
            
         
          Statement stmt = con.createStatement();
          
          // First I check out whether in the table PUBLISHER record with the entered PUBLISHER NAME and CITY exists
          // To do that I do the select in the publisher table to check whether the record with entered publisher name and city exists.
          // If the select returns no record then I do the insert
          // 1. the select statement
          //stmt = con.createStatement(); 
          String rs_query=""; 
          ResultSet rs; // object where the query's results are stored
          boolean empty_field = false;
          // if the publisher's name is entered
          // ResultSet rs = stmt.executeQuery("select title,isbn from book where title = '"+book_title+"'");  // ,book_location
          
          // if the user didn't enter anything for the publisher name and city then don't do anything, otherwise add the entered values into the 
          // database
          if (((formpubl.equalsIgnoreCase(""))) && (((formcity.equalsIgnoreCase("")))))
              empty_field = true;
          if (!(empty_field)){
            // if the publisher's name is entered
            if (!((formpubl.equalsIgnoreCase("")))) {
                out.print("Not empty");
                rs_query = "select publ_name from publisher where (publ_name = '" + formpubl + "')";
            } 
            if (!((formcity.equalsIgnoreCase("")))) {
                rs_query += "AND (city = '" + formcity + "')";
            }
          
            rs_query += ";";
            out.print("rs_query: " + rs_query);
            rs = stmt.executeQuery(rs_query);
            // if the record with the entered value for the publisher name and city doesn't exist then add that record
            if (!rs.next()) {
                // check out whether in the database there could be only the name of the publisher and not the city 
                rs_query = "select publ_id from publisher where (publ_name = '" + formpubl + "');";
                rs = stmt.executeQuery(rs_query);
                // the record with only publishers name exists in the database then update the record with the city name
                if (rs.next()){
                    // find the publ_id of the record with the publisher's name
                    String publid = rs.getString("publ_id");
                    out.print("publ id " + publid );
                    // update the name of the city for that publisher
                    String query = "update publisher set city='" + formcity + "' where publ_id='" + publid + "';";
                    out.print("query: " + query);
                    PreparedStatement preparedStmt = con.prepareStatement(query);
                    preparedStmt.execute();
                    // update publisher set city='SU' where publ_id='28';
                } else {
                  // 2. the insert statement
                  String query = "insert into publisher(publ_name, city) values('" + formpubl + "','" + formcity + "');";
                  out.print("query: " + query);
                  PreparedStatement preparedStmt = con.prepareStatement(query);
                  preparedStmt.execute();
                }
            }
          }
          
          // table author
          // First I check whether in the table AUTHOR record with the entered AUTHOR's NAME exists 
          // To do that I do the select in the author table to check whether the record with entered author's name exists.
          // If the select returns no record then I do the insert
          // 1. the select statement
          stmt = con.createStatement(); 
          rs_query="";
          empty_field = false; // the user entered a value in the author input field
          // if the user didn't enter anything for the author's name then nothing should be done, otherwise add the entered values into the 
          // database
          if (formauth.equalsIgnoreCase(""))
              empty_field = true; 
          if (!(empty_field)){
            rs_query = "select au_name from author where (au_name = '"+formauth+"');";
            // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1111 add here the empty part
            // rs_query = "select au_name from author where (au_name = '"+formauth+"');";
            out.print("rs_query: " + rs_query);
            rs = stmt.executeQuery(rs_query);

            // 2. the insert statement - in case the author with that name doesn't exist in the table author
            if (!rs.next()) {
                String query = "insert into author(au_name) values('" + formauth + "');";
                out.print("query: " + query);
                PreparedStatement preparedStmt = con.prepareStatement(query);
                preparedStmt.execute();
            }
          }
          
          // does the book with that title exist in the table BOOK
          // select title from book where title=formtitle
          boolean isbn_title_exist = false; // whether the book with that TITLE or ISBN already exists in the database
          rs_query = "select title from book where (title = '" + formtitle + "');";
          rs = stmt.executeQuery(rs_query);
          if (rs.next()) {
              isbn_title_exist = true;
              out.print("Error! The book with that title already exists in the database!"); // ERROR PAGE MISSING !!!!!!!!!!!!!!!!!!!!!!!
          }
          
          if (!isbn_title_exist){
              rs_query = "select isbn from book where (isbn = '" + formisbn + "');";
              rs = stmt.executeQuery(rs_query);
              if (rs.next()) {
                  isbn_title_exist = true;
                  out.print("Error! The book with that isbn already exists in the database!"); // ERROR PAGE MISSING !!!!!!!!!!!!!!!!!!!!!!!
              }
          }
          
          // if the user entered a publisher's AND author's name AND ( the book's title OR isbn )then insert the entered values into the database
          if ((!isbn_title_exist) && ((!(formpubl.equalsIgnoreCase(""))) && (!(formauth.equalsIgnoreCase("")))) && ((!(formtitle.equalsIgnoreCase(""))) || (!(formisbn.equalsIgnoreCase(""))))){
            String query = "insert into book(au_id, publ_id";
            if (!(formtitle.equalsIgnoreCase(""))) {
               query += ", title"; // add title to the list of the columns  
            }
            if (!(formisbn.equalsIgnoreCase(""))) {
               query += ", isbn"; // add isbn to the list of the columns
            }
            query += " ) values ((select au_id from author where au_name='" + formauth + "'),"; // determine the au_id for the author
            query += " (select publ_id from publisher where (publ_name='" + formpubl + "') "; // determine the publ_id for the publisher
            
            if (!(formcity.equalsIgnoreCase("")))
                query += "and (city='" + formcity + "')"; // add the city to the query
            query += " ),";
            if (!(formtitle.equalsIgnoreCase(""))){
                query += "'" + formtitle + "'"; // add the title to the query
            }
            if ((!(formtitle.equalsIgnoreCase(""))) && (!(formisbn.equalsIgnoreCase("")))){
                query +=  ",";
            }
            if (!(formisbn.equalsIgnoreCase(""))){
                query += "'" + formisbn + "'"; // add the isbn to the query
            }
            query += ");";
             out.print(query); 
             PreparedStatement preparedStmt = con.prepareStatement(query);
             preparedStmt.execute(); // run the query
          } else if ((formpubl.equalsIgnoreCase("")) && (formauth.equalsIgnoreCase(""))){
              out.print("Do the VALIDATION FOR publisher's name and author");
          }
            
            /*
            String query = "insert into book(au_id, publ_id, title, isbn ) values ((select au_id from author where au_name='" + formauth + "'),"
                    + " (select publ_id from publisher where publ_name='" + formpubl + "'),'" + formtitle + "','" + formisbn + "');";
            out.print(query); 
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.execute();
            DO NOT DELETE THIS */

            
            //while(rs.next())
            //{
             //String book = rs.getString("title");
             //String book_isbn = rs.getString("isbn"); 
             //String book_loc = rs.getString("book_location");  
             %>
             <h1 style="width: 800px"> <%//out.print(book);%><br><%
             //out.print( "About book :"+book_isbn);
             %>.<br><%
             out.print( " ");
             %>
             <br> <br><a href="http://localhost:8080/MyBookStore/Novi Sad">Download</a></h1>
             
            <%
         //}
        }catch(Exception e){
            
        }
     %>
     
     
     <!-- </div>
     <div style="float: righ;">
         
        <img src="image/Book_icon.png" width="250" height="500" id="image_spc" style="margin-left: 60px;">
     </div>
     
     </div> -->  
     <%@ include file="footer.jsp"%>
    </body>
</html>
