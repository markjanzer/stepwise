import React, { useState, Fragment } from "react"
import axios from "axios"
// import PropTypes from "prop-types"


function Index(props) {
  const [passions, setPassions] = useState(props.passions);
  const [tasks, setTasks] = useState(props.tasks);

  function updateTask(updatedTask) {
    setTasks(tasks.map(task => {
      if (task.id === updatedTask.id) {
        return updatedTask;
      } else {
        return task;
      }
    }));
  }

  return (
    <section>
      <h1>Two Weeks</h1>
      {passions.map(passion => Passion({ 
        passion,
        passions,
        updateTask,
        tasks: tasks.filter(task => task.passion_id === passion.id),
      }))}
    </section>
  );
}

function Passion(props) {
  const { passion, tasks, passions, updateTask } = props;

  return (
    <React.Fragment key={passion.id}>
      <h2><a href={`/passions/${passion.id}`}>{passion.name}</a></h2>
      <ul>
        {tasks.map(task => Task({ task, passion, passions, updateTask }))}
      </ul>
    </React.Fragment>
  );
}

function Task(props) {
  const { task, passion, passions } = props;

  function updateTask(data) {
    const updatedTask = { ...task, ...data };

    props.updateTask(updatedTask);

    axios.put(`/tasks/${task.id}`, data)
      .catch(() => props.updateTask(task));
  }

  return (
    <li key={task.id}>
      <div>{task.description}</div>
      <div>
        {/* <Combobox 
          openOnFocus
          initialSelectedItem={passion}
          items={passions}
          itemToString={passion => passion.name ? passion.name : ""}
          onChange={(passion) => updateTask({ passion_id: passion.id })}
        /> */}
      </div>
      <div></div>
      <div>{task.due_date}</div>
    </li>
  );
}

// Index.propTypes = {
//   greeting: PropTypes.string
// };
export default Index;
