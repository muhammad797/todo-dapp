// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ToDo {
    struct Task {
        uint256 id;
        uint256 date;
        string content;
        string author;
        bool done;
    }

    uint256 length;
    uint256[] taskIds;
    mapping(uint256 => Task) tasks;

    event TaskCreated(uint256, uint256, string, string, bool);

    constructor() {
        length = 0;
    }

    function createTask(string memory _content, string memory _author) public {
        length++;
        tasks[length] = Task(length, block.timestamp, _content, _author, false);
        taskIds.push(length);
        emit TaskCreated(length, block.timestamp, _content, _author, false);
    }

    function getTask(uint256 _id)
        public
        view
        taskExists(_id)
        returns (
            uint256,
            uint256,
            string memory,
            string memory,
            bool
        )
    {
        Task memory _task = tasks[_id];
        return (_id, _task.date, _task.content, _task.author, _task.done);
    }

    function getTaskIds() public view returns (uint256[] memory) {
        return taskIds;
    }

    function toggleTask(uint256 _id, bool _done) public {
        tasks[_id].done = _done;
    }

    modifier taskExists(uint256 _id) {
        require(tasks[_id].id > 0, "Invalid task ID. Please try again");
        _;
    }
}
