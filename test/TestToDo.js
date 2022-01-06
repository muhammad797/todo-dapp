const ToDo = artifacts.require('./ToDo.sol');

contract('ToDo', async (accounts) => {
  it('should create a Task', async () => {
    const instance = await ToDo.deployed();
    await instance.createTask('Task 1', 'Me');
    const task = await instance.getTask(1);
    assert.equal(task[2], 'Task 1');
  });
});
