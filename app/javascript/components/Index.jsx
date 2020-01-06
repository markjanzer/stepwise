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
import TaskList from "./blocks/TaskList";

// import PropTypes from "prop-types"

function Index(props) {
  const { passions, tasks } = props;
  // const [passions, setPassions] = useState(props.passions);
  // const [tasks, setTasks] = useState(props.tasks);

  // function updateTask(updatedTask) {
  //   setTasks(
  //     tasks.map(task => {
  //       if (task.id === updatedTask.id) {
  //         return updatedTask;
  //       } else {
  //         return task;
  //       }
  //     })
  //   );
  // }

  // function deleteTask(taskToDelete) {
  //   setTasks(tasks.filter(task => task.id !== taskToDelete.id));
  // }

  // function restoreTask(taskToRestore) {
  //   // Not restoring in the correct order
  //   if (tasks.some(task => task.id !== taskToRestore)) {
  //     setTasks(tasks.concat(taskToRestore));
  //   }
  // }

  return (
    <Pane>
      <Heading>Two Weeks</Heading>
      {passions.map(passion => (
        <Passion
          key={passion.id}
          passion={passion}
          tasks={tasks.filter(task => task.passion_id === passion.id)}
        />
      ))}
    </Pane>
  );
}

function Passion(props) {
  const { passion, tasks } = props;

  return (
    <React.Fragment>
      <Link href={`/passions/${passion.id}`}>
        <Heading>{passion.name}</Heading>
      </Link>
      <TaskList tasks={tasks} />
    </React.Fragment>
  );
}

// Index.propTypes = {
//   greeting: PropTypes.string
// };
export default Index;
