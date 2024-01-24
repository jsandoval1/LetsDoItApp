package sandoval.john.letsdoit.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import sandoval.john.letsdoit.models.Comment;

public interface CommentRepository extends CrudRepository<Comment, Long>{
    List<Comment> findAll();
}
