package sandoval.john.letsdoit.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sandoval.john.letsdoit.models.Comment;
import sandoval.john.letsdoit.repositories.CommentRepository;

@Service
public class CommentService {
    
    @Autowired
    private CommentRepository commentRepository;

    //*Get all comments
    public List<Comment> getAllComments() {
        return commentRepository.findAll();
    }

    // * Create a comment
    public Comment createComment(Comment comment) {
        return commentRepository.save(comment);
    }

    // * Get one comment
    public Comment getOneComment(Long id) {
        return commentRepository.findById(id).orElse(null);
    }

    // * Update a comment
    public Comment updateComment(Comment comment) {
        return commentRepository.save(comment);
    }

    // * Delete a comment
    public void deleteComment(Long id) {
        commentRepository.deleteById(id);
    }
}
