import React, { useState } from "react";
import TaskList from "../blocks/TaskList";
import { Button, Card, Heading, Pane, TextInput } from "evergreen-ui";
import axios from "axios";
import dayjs from "dayjs";

function Show(props) {
  const { passion, timeFrames } = props;

  const [tasks, setTasks] = useState(props.tasks);

  function createTask(taskData) {
    const newTask = {
      ...taskData,
      passion_id: passion.id,
      completed_at: null
    };

    setTasks(tasks.concat({ ...newTask, id: null }));

    axios
      .post("/tasks", newTask)
      .then(response => {
        const createdTask = response.data;
        console.log("then", createdTask);
        console.log("then", tasks);
        setTasks(
          tasks.map(task => {
            if (task.id === null) {
              return createdTask;
            } else {
              return task;
            }
          })
        );
      })
      .catch(() => {
        console.log("catch");
        setTasks(tasks.filter(task => task.id !== 0));
      });
  }

  console.log("main", tasks);

  return (
    <Pane>
      {timeFrames.map(timeFrame => {
        console.log("return", tasks);
        return (
          <React.Fragment key={timeFrame.id}>
            <Heading>{timeFrame.name}</Heading>
            <NewTask timeFrame={timeFrame} createTask={createTask} />
            <TaskList
              tasks={tasks.filter(task => task.time_frame_id === timeFrame.id)}
            />
          </React.Fragment>
        );
      })}
    </Pane>
  );
}

function NewTask(props) {
  const { timeFrame } = props;
  const [editable, setEditability] = useState(false);
  const [description, setDescription] = useState("");

  if (editable) {
    return (
      <Card>
        <TextInput
          onChange={e => setDescription(e.target.value)}
          value={description}
        />
        <Button
          onClick={() => {
            props.createTask({
              description,
              time_frame_id: timeFrame.id,
              due_date: dayjs()
                .add(timeFrame.duration, "days")
                .format("YYYY-MM-DD")
            });
            setEditability(false);
          }}
        >
          Save
        </Button>
        <Button onClick={() => setEditability(false)}>Cancel</Button>
      </Card>
    );
  } else {
    return <Button onClick={() => setEditability(true)}>New Task</Button>;
  }
}

export default Show;
