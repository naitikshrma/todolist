//SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.0 <0.9.0;

contract ToDoList {
    struct todo
    {
        string task;
        bool completed;

    }
    todo[] public totodo;
    function entertask(string calldata _task) external 
    {
        totodo.push(todo({task: _task,
         completed: false}));
    }
    
    function Update(uint _index, string calldata _task) external {
        //totodo[_index].text = _task;

         todo storage ttodo = totodo[_index];
         ttodo.task = _task;
    }
    function get(uint _index) external view returns (string memory, bool) 
    {
        todo memory ttodo = totodo[_index];
        return (ttodo.task, ttodo.completed);

    }
    function togglecomplete(uint _index) external {
        totodo[_index].completed = !totodo[_index].completed;
    }
}