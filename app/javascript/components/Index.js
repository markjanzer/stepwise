import React, { useState } from "react";
import axios from "axios";
import {
  Button,
  Checkbox,
  Heading,
  Link,
  Pane,
  Text,
  TextInput
} from "evergreen-ui";
import { debounce } from "lodash";

// import PropTypes from "prop-types"

function Index(props) {
  const [passions, setPassions] = useState(props.passions);
  const [tasks, setTasks] = useState(props.tasks);

  function updateTask(updatedTask) {
    setTasks(
      tasks.map(task => {
        if (task.id === updatedTask.id) {
          return updatedTask;
        } else {
          return task;
        }
      })
    );
  }

  function deleteTask(taskToDelete) {
    setTasks(tasks.filter(task => task.id !== taskToDelete.id));
  }

  function restoreTask(taskToRestore) {
    // Not restoring in the correct order
    if (tasks.some(task => task.id !== taskToRestore)) {
      setTasks(tasks.concat(taskToRestore));
    }
  }

  return (
    <Pane>
      <Heading>Two Weeks</Heading>
      {passions.map(passion => (
        <Passion
          {...{
            passion,
            passions,
            updateTask,
            deleteTask,
            restoreTask,
            key: passion.id,
            tasks: tasks.filter(task => task.passion_id === passion.id)
          }}
        />
      ))}
    </Pane>
  );
}

function Passion(props) {
  const { passion, tasks, updateTask, deleteTask, restoreTask } = props;

  return (
    <React.Fragment>
      <Link href={`/passions/${passion.id}`}>
        <Heading>{passion.name}</Heading>
      </Link>
      <Pane>
        {tasks.map(task => (
          <Task
            {...{ task, updateTask, deleteTask, restoreTask, key: task.id }}
          />
        ))}
      </Pane>
    </React.Fragment>
  );
}

function Task(props) {
  const { task } = props;
  const [editable, setEditable] = useState(false);

  // Update task state, then update db with optional debounce
  // If server returns error, reset the task state
  function updateTask(data, debounceMs = false) {
    const updatedTask = { ...task, ...data };

    props.updateTask(updatedTask);

    function updateDb() {
      axios.put(`/tasks/${task.id}`, data).catch(() => props.updateTask(task));
    }

    if (debounceMs) {
      debounce(updateDb, 400)();
    } else {
      updateDb();
    }
  }

  function deleteTask() {
    axios.delete(`/tasks/${task.id}`).catch(() => props.restoreTask(task));
    props.deleteTask(task);
  }

  if (editable) {
    return (
      <EditableTask
        {...{ task, updateTask, deleteTask, setEditable, key: task.id }}
      />
    );
  } else {
    return <NonEditableTask {...{ task, setEditable, key: task.id }} />;
  }
}

function EditableTask(props) {
  const { task, updateTask, deleteTask, setEditable } = props;

  return (
    <Pane>
      <TextInput
        value={task.description}
        onChange={e => updateTask({ description: e.target.value }, 600)}
      />
      <Text color="muted">Due {task.due_date}</Text>
      <Button onClick={() => console.log("edit due date")}>Edit</Button>
      <Button onClick={() => setEditable(false)}>Done</Button>
      <Button onClick={() => deleteTask(task)}>Delete</Button>
    </Pane>
  );
}

function NonEditableTask(props) {
  const { task, setEditable } = props;

  return (
    <Pane>
      <Checkbox checked={task.completed_at} label={task.description}></Checkbox>
      <Text color="muted">Due {task.due_date}</Text>
      <Button onClick={() => setEditable(true)}>Edit</Button>
    </Pane>
  );
}

// Index.propTypes = {
//   greeting: PropTypes.string
// };
export default Index;
