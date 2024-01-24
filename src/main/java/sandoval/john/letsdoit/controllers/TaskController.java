package sandoval.john.letsdoit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import jakarta.servlet.http.HttpSession;
import sandoval.john.letsdoit.models.Comment;
import sandoval.john.letsdoit.models.Task;
import sandoval.john.letsdoit.models.User;
import sandoval.john.letsdoit.services.TaskService;
import java.util.List;
import org.springframework.ui.Model;
import jakarta.validation.Valid;
import org.springframework.validation.BindingResult;

@Controller
public class TaskController {

    // * Inject Task Service
    @Autowired
    private TaskService taskService;

    // * Route for home page
    // localhost:8080/home
    // Check if user is logged in
    // Displays all tasks in table
    @GetMapping("/home")
    public String home(HttpSession session, Model model) {
        if (session.getAttribute("user") == null) {
            return "redirect:/";
        }
        List<Task> tasks = taskService.getAllTasks();
        model.addAttribute("tasks", tasks);
        model.addAttribute("page", "home"); // Needed for the navbar css
        return "Home";
    }

    // * Route for viewing one task
    // localhost:8080/tasks/{id}
    // Check if user is logged in
    // Displays one task
    // @GetMapping("/tasks/{id}")
    @GetMapping("/tasks/{id}")
    public String viewTask(@PathVariable Long id, HttpSession session, Model model) {
        if (session.getAttribute("user") == null) {
            return "redirect:/";
        }
        Task taskToView = taskService.getOneTask(id);
        model.addAttribute("task", taskToView);
        model.addAttribute("comment", new Comment()); // ? This empty comment model is needed for the comment form
        return "ViewTask";
    }

    // * Get route for creating a new task page
    // localhost:8080/tasks/new // * GET
    // Check if user is logged in
    // Displays form for creating a new task
    @GetMapping("/tasks/new")
    public String newTask(@ModelAttribute Task task, HttpSession session, Model model) {
        if (session.getAttribute("user") == null) {
            return "redirect:/";
        }
        model.addAttribute("page", "createTask"); // Needed for the navbar css
        return "NewTask";
    }

    // * Post route for creating a new task
    // localhost:8080/tasks/new // * POST
    // Check if user is logged in
    // Check if there are any errors in the form
    // Creates a new task
    @PostMapping("/tasks/new")
    public String createTask(@Valid Task task, BindingResult result, HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/";
        }
        if (result.hasErrors()) {
            return "NewTask";
        }
        taskService.createTask(task);
        return "redirect:/home";
    }

    // * Get route for editing a task
    // localhost:8080/tasks/edit/{id} // * GET
    // Check if user is logged in
    // Get the task
    // Check if the session user is the creator of the task
    // Displays form for editing a task
    @GetMapping("/tasks/edit/{id}")
    public String editTask(@PathVariable Long id, HttpSession session, Model model) {
        User sessionUser = (User) session.getAttribute("user");
        if (sessionUser == null) {
            return "redirect:/";
        }
        Task task = taskService.getOneTask(id);
        if (task == null) {
            return "redirect:/home";
        }
        if (!task.getUser().getId().equals(sessionUser.getId())) {
            return "redirect:/home";
        }
        model.addAttribute("task", task);
        return "EditTask";
    }

    // * Put route for editing a task
    // localhost:8080/tasks/edit/{id} // * PUT
    // Check if user is logged in
    // Check if there are any errors in the form
    // Updates a task
    @PutMapping("/tasks/edit/{id}")
    public String updateTask(@Valid Task task, BindingResult result, HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/";
        }
        if (result.hasErrors()) {
            return "EditTask";
        }
        taskService.updateTask(task);
        return "redirect:/home";
    }

    // * Delete route for deleting a task
    // localhost:8080/tasks/delete/{id}
    // Check if user is logged in
    // Get the task
    // Check if the session user is the creator of the task
    // Deletes a task
    @DeleteMapping("/tasks/delete/{id}")
    public String deleteTask(@PathVariable Long id, HttpSession session) {
        User sessionUser = (User) session.getAttribute("user");
        if (sessionUser == null) {
            return "redirect:/";
        }
        Task task = taskService.getOneTask(id);
        if (task == null) {
            return "redirect:/home";
        }
        if (!task.getUser().getId().equals(sessionUser.getId())) {
            return "redirect:/home";
        }
        taskService.deleteTask(id);
        return "redirect:/home";
    }
}
