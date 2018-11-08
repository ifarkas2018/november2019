<!-- navigation bar -->
<!-- w3-theme-m1 is a CSS rule from the colors.css -->
<div class="w3-bar w3-theme-m1 w3-round-xxlarge"> <!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$w3-margin if it needs to be moved to right --> 
    <span class="w3-bar-item w3-text-theme-m1">H &amp; C Web Consulting</span>
    <!-- w3-text-theme-m1 is used to set the text of the link to blue -->
    <!-- w3-hover-theme-l4 when the user hovers the mouse, there is no change in the background color of the navigation bar, the text color is orange -->
    <!-- w3-mobile used to create a responsive navbar with responsive dropdown links -->
    <a href="/" class="w3-bar-item w3-button w3-text-theme-m1 w3-hover-theme-l4 w3-mobile">Home</a>
        
    <!-- w3-dropdown-hover is used to create hoverable drop down element -->
    <div class="w3-dropdown-hover w3-mobile">
        <!-- w3-theme-m1 is used to set the background color of the button, w3-text-theme-m1 is used to set the color of the text on the navigation bar entry -->
        <!-- w3-hover-theme-l4 is used to set on the hover the background color of the button and the color of the text -->
        <a href="#" class="w3-button w3-theme-m1 w3-text-theme-m1 w3-hover-theme-l4 w3-mobile">&#128197;&nbsp;Schedule</a> <!-- &#128197; HTML entity for a calendar icon -->
        <!-- w3-card-4 adds to the container a 4px bordered shadow -->
        <!-- w3-dropdown-content is used to create responsive dropdown links -->
        <!-- w3-theme-m1 is a CSS rule from the colors.css ( sets the color of the text and the background color ) -->
        <div class="w3-dropdown-content w3-bar-block w3-card-4 w3-theme-m1" style="width:8%;">
	        <!-- w3-text-theme-m1  is a CSS rule from the colors.css ( sets the color of the text to the blue ) -->
	        <!-- w3-hover-text-orange is used to set the orange color of the text when the user hovers the mouse over the link --> 
	        <a href="add_schedule" class="w3-bar-item w3-button w3-text-theme-m1 w3-hover-text-orange w3-hover-none w3-mobile">Add Schedule</a> 
	        <a href="show_schedule" class="w3-bar-item w3-button w3-text-theme-m1 w3-hover-text-orange w3-hover-none w3-mobile">Show Schedule</a>
	    </div>      
	</div>

	<!-- w3-dropdown-hover is used to create hoverable drop down element -->
	<div class="w3-dropdown-hover w3-mobile">
	<!-- w3-theme-m1 is used to set the background color of the button, w3-text-theme-m1 is used to set the color of the text on the navigation bar entry -->
	<!-- w3-hover-theme-l4 is used to set on the hover the background color of the button and the color of the text -->
	<a href="#" class="w3-button w3-theme-m1 w3-text-theme-m1 w3-hover-theme-l4 w3-mobile">Task</a> <!-- &#128197; HTML entity for a calendar icon -->
	<!-- w3-card-4 adds to the container a 4px bordered shadow -->
	<!-- w3-dropdown-content is used to create responsive dropdown links -->
	<!-- w3-theme-m1 is a CSS rule from the colors.css ( sets the color of the text and the background color ) -->
	<div class="w3-dropdown-content w3-bar-block w3-card-4 w3-theme-m1" style="width:8%;">
		<!-- w3-text-theme-m1  is a CSS rule from the colors.css ( sets the color of the text to the blue ) -->
		<!-- w3-hover-text-orange is used to set the orange color of the text when the user hovers the mouse over the link --> 
		<a href="task_list" class="w3-bar-item w3-button w3-text-theme-m1 w3-hover-text-orange w3-hover-none w3-mobile">Task List</a> 
		<a href="task_add" class="w3-bar-item w3-button w3-text-theme-m1 w3-hover-text-orange w3-hover-none w3-mobile">Add Task</a>
		<a href="task_update" class="w3-bar-item w3-button w3-text-theme-m1 w3-hover-text-orange w3-hover-none w3-mobile">Update Task</a>
		<a href="task_delete" class="w3-bar-item w3-button w3-text-theme-m1 w3-hover-text-orange w3-hover-none w3-mobile">Delete Task</a>
	</div>      
</div>

	    <!-- w3-text-theme-m1 is used to set the text of the link to blue -->
	    <!-- w3-hover-theme-l4 when the user hovers the mouse, there is no change in the background color of the navigation bar, the text color is orange -->
	    <!-- w3-mobile used to create a responsive navbar with responsive dropdown links -->
	    <a href="contact_us" class="w3-bar-item w3-button w3-text-theme-m1 w3-hover-theme-l4 w3-mobile">Contact Us</a>
	
	    <!-- w3-hover-theme-l4 is used to set on the hover the background color of the button and the color of the text -->
	    <!-- w3-mobile used to create a responsive navbar with responsive dropdown links -->
	    <!-- w3-right used to right-align a specific link -->
	    <a href="log_out" class="w3-bar-item w3-button w3-text-theme-m1 w3-hover-theme-l4 w3-mobile w3-right">Log Out</a>
	</div> <!-- end of class="w3-bar w3-theme-m1 w3-round-xxlarge" -->
