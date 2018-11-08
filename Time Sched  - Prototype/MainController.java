package com.timemng.sbjsp.controller;

import java.util.ArrayList;
import java.util.List;
 
import com.timemng.sbjsp.model.Person;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
@Controller
public class MainController {
 
    private static List<Person> persons = new ArrayList<Person>();
 
    static {
        persons.add(new Person("Bill", "Gates"));
        persons.add(new Person("Steve", "Jobs"));
    }
 
    // if the requested URL is localhost:8080, method is GET do 
    @RequestMapping(value = { "/" }, method = RequestMethod.GET)
    public String index(Model model) {
 
        String message = "Hello Spring Boot + JSP";
 
        model.addAttribute("message", message);
 
        return "index"; // return the index.jsp
    }
    
    // if the requested URL is localhost:8080/add_schedule, method is GET do 
    @RequestMapping(value = { "add_schedule" }, method = RequestMethod.GET)
    public String add_schedule(Model model) {
 
        String message = "Add Schedule";
 
        model.addAttribute("message", message);
 
        return "add_schedule"; // return the add_schedule.jsp
    }
    
    // if the requested URL is localhost:8080/show_schedule, method is GET do 
    @RequestMapping(value = { "show_schedule" }, method = RequestMethod.GET)
    public String show_schedule(Model model) {
 
        String message = "Show Schedule";
 
        model.addAttribute("message", message);
 
        return "show_schedule"; // return the show_schedule.jsp
    }
    
    // if the requested URL is localhost:8080/task_list, method is GET do 
    @RequestMapping(value = { "task_list" }, method = RequestMethod.GET)
    public String task_list(Model model) {
 
        String message = "Task List";
 
        model.addAttribute("message", message);
 
        return "task_list"; // return the task_list.jsp
    }
    
    // if the requested URL is localhost:8080/task_add, method is GET do 
    @RequestMapping(value = { "task_add" }, method = RequestMethod.GET)
    public String task_add(Model model) {
 
        String message = "Task Add";
 
        model.addAttribute("message", message);
 
        return "task_add"; // return the task_add.jsp
    }
    
    // if the requested URL is localhost:8080/task_update, method is GET do 
    @RequestMapping(value = { "task_update" }, method = RequestMethod.GET)
    public String task_update(Model model) {
 
        String message = "Task Update";
 
        model.addAttribute("message", message);
 
        return "task_update"; // return the task_update.jsp
    }
    
    // if the requested URL is localhost:8080/task_delete, method is GET do 
    @RequestMapping(value = { "task_delete" }, method = RequestMethod.GET)
    public String task_delete(Model model) {
 
        String message = "Task Delete";
 
        model.addAttribute("message", message);
 
        return "task_delete"; // return the task_delete.jsp
    }
 
    // if the requested URL is localhost:8080/contact_us, method is GET do 
    @RequestMapping(value = { "contact_us" }, method = RequestMethod.GET)
    public String contact_us(Model model) {
 
        String message = "Contact Us";
 
        model.addAttribute("message", message);
 
        return "contact_us"; // return the contact_us.jsp
    }
    
    // if the requested URL is localhost:8080/log_in, method is GET do 
    @RequestMapping(value = { "log_in" }, method = RequestMethod.GET)
    public String log_in(Model model) {
 
        String message = "Log In";
 
        model.addAttribute("message", message);
 
        return "log_in"; // return the log_in.jsp
    }
    
 // if the requested URL is localhost:8080/log_out, method is GET do 
    @RequestMapping(value = { "log_out" }, method = RequestMethod.GET)
    public String log_out(Model model) {
 
        String message = "Log Out";
 
        model.addAttribute("message", message);
 
        return "log_out"; // return the log_out.jsp
    }
    
    
    /*
    @RequestMapping(value = { "/personList" }, method = RequestMethod.GET)
    public String viewPersonList(Model model) {
 
        model.addAttribute("persons", persons);
 
        return "personList";
    } */
 
}
