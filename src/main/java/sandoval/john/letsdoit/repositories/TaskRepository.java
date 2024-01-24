package sandoval.john.letsdoit.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import sandoval.john.letsdoit.models.Task;

public interface TaskRepository extends CrudRepository<Task, Long> {
    List<Task> findAll();
}
