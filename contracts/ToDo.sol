// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ToDo {
  struct Task {
    uint id;
    uint date;
    string content;
    string author;
    bool done;
  }

  Task[] tasks;

  function createTask(string memory _content, string memory _author) public {
    tasks.push(Task(tasks.length, block.timestamp, _content, _author, false));
  }

  function getTask(uint _id) public view returns (uint, uint, string memory, string memory, bool) {
    Task memory _task = tasks[_id];
    return (_id, _task.date, _task.content, _task.author, _task.done);
  }

  function getTasks() public view returns (Task[] memory) {
    return tasks;
  }

  function toggleTask(uint _id, bool _done) public {
    tasks[_id].done = _done;
  }
}
