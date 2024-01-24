package sandoval.john.letsdoit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;
// import jakarta.servlet.http.HttpSession;
import sandoval.john.letsdoit.models.Comment;
import sandoval.john.letsdoit.models.Task;
import sandoval.john.letsdoit.models.User;
import sandoval.john.letsdoit.services.CommentService;
import sandoval.john.letsdoit.services.TaskService;
import sandoval.john.letsdoit.services.UserService;

@Controller
public class CommentController {

    // * Inject Comment Service
    @Autowired
    private CommentService commentService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private UserService userService;

    // * Get route is not needed because comments are being rendered as an attribute
    // on the task detail page
    // See sandoval.john.letsdoit.controllers.TaskController.viewTask() for the
    // method that displays the task page

    // * Route for creating a new comment
    // localhost:8080/tasks/{id}/comments/new // * POST
    // Check if user is logged in
    // Creates a new comment
    // Redirects to task page
    @PostMapping("/comment/new")
    public String createComment(@Valid @ModelAttribute Comment comment, BindingResult result,
            @RequestParam Long taskId, @RequestParam Long userId, Model model) {
        if (result.hasErrors()) {
            Task task = taskService.getOneTask(taskId);
            User user = userService.findUser(userId);
            model.addAttribute("task", task);
            model.addAttribute("user", user);
            return "ViewTask";
        }
        Task task = taskService.getOneTask(taskId);
        User user = userService.findUser(userId);
        if (task == null || user == null) {
        }
        comment.setTask(task);
        comment.setUser(user);
        commentService.createComment(comment);
        return "redirect:/tasks/" + taskId;
    }

    // * Route for deleting a comment
    // localhost:8080/tasks/{id}/comments/{id}/delete // * Delete
    // Check if user is logged in
    // Deletes a comment
    // Redirects to view task details page
    @DeleteMapping("/comment/delete/{id}")
    public String deleteComment(@PathVariable Long id) {
        Comment comment = commentService.getOneComment(id);
        Long taskId = comment.getTask().getId();
        commentService.deleteComment(id);
        return "redirect:/tasks/" + taskId;
    }
}
