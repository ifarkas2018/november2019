<%-- 
    Document   : add_form.jsp
    Created on : 08-Nov-2018, 13:02:11
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                                    <h3>Add a Book</h3><br/> 
                                    <form action="addDB.jsp" method="post">
                                        <div class="form-group">
                                            <label for="labtitle">Title:</label> <!-- title label -->
                                            <input type="text" class="form-control form-control-sm" name="title" id="title"> <!-- the input element for title -->
                                        </div>
                                        <div class="form-group">
                                            <label for="labauthor">Author's Name:</label> <!-- author's name label -->
                                            <input type="text" class="form-control form-control-sm" name="author" id="author"> <!-- the input element for author -->
                                        </div>
                
                                        <div class="form-group">
                                            <label for="labisbn">ISBN:</label> <!-- ISBN label -->
                                            <input type="text" class="form-control form-control-sm" name="isbn" id="isbn"> <!-- the input element for ISBN -->
                                        </div>
                
                                        <div class="form-group">
                                            <label for="labisbn">Price Range:</label> <!-- price range label -->
                                            <!-- creating a drop down list; form-control-sm is used for smaller control -->
                                            <select class="form-control form-control-sm"> 
                                                <option>All Prices</option>
                                                <option>Prices under £5</option> <!-- option shown in the drop down list -->
                                                <option>Prices £5 - £10</option>
                                                <option>Prices £10 - £20</option>
                                                <option>Prices £20 - £30</option>
                                                <option>Prices £30 - £50</option>
                                                <option>Prices Above £50</option>
                                            </select>
                                        </div>
                                    
                                        <div class="form-group">
                                            <label for="labsort">Sort by:</label>
                                            <!-- creating a drop down list; form-control-sm is used for smaller control -->
                                            <select class="form-control form-control-sm"> 
                                                <option>Price ( Low - High )</option> <!-- option shown in the drop down list -->
                                                <option>Price ( High - Low )</option>
                                            </select>
                                        </div>
                
                                        <div class="form-group">
                                            <label for="labpubl">Publisher</label> <!-- publisher label -->
                                            <input type="text" class="form-control form-control-sm" name="publisher" id="publisher"> <!-- the input element for the publisher -->
                                        </div>
                             
                                        <div class="form-group"> <!--  mb-2 mr-sm-2 -->
                                            <label for="labcategory">Category</label> <!-- category label -->
                                            <!-- creating a drop down list; form-control-sm is used for narrower control -->
                                            <select class="form-control form-control-sm">
                                                <option>All Categories</option> <!-- option shown in the drop down list -->
                                                <option>Fiction &amp; Poetry</option>
                                                <option>Business</option>
                                                <option>Education</option>
                                                <option>Computing &amp; IT</option>
                                                <option>Children's</option>
                                            </select>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="labpublcity">City ( Publisher )</label> <!-- label of the city of the publisher -->
                                            <input type="text" class="form-control form-control-sm" name="publ_city" id="publ_city"> <!-- the input element for the city of the publisher -->
                                        </div>
                                        
                                        <div class="container">
                                            <div class="row">
                                                <div class="col">
                                                    &nbsp; &nbsp; <!-- adding some empty space -->
                                                </div>
                                            </div>    
                                        </div>

                                        <!-- adding the Search button to the form; btn-sm is used for smaller ( narrower ) size of the control -->
                                        <button type="submit" class="btn btn-info btn-sm">Search</button>
                                        <!-- adding a new container -->
                                        <div class="container">
                                            <div class="row">
                                                <div class="col">
                                                    &nbsp; &nbsp; <!-- adding some empty space -->
                                                </div>
                                            </div>    
                                        </div>

                                        <!-- adding a new container -->
                                        <div class="container">
                                            <div class="row">
                                                <div class="col">
                                                    &nbsp; &nbsp; <!-- adding some empty space -->
                                                </div>
                                            </div>    
                                        </div> 
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
    </body>
</html>

