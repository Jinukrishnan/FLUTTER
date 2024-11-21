import 'package:appwriteproj/service/Appwrite_Service.dart';
import 'package:appwriteproj/todo.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controller = TextEditingController();
  late AppwriteService _appwriteService;
  late List<Task> _tasks;
  @override
  void initState() {
    super.initState();
    _appwriteService = AppwriteService();
    _tasks = [];
    _loadTasks();
  }

  // add task
  Future<void> _addTask() async {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    final task = _controller.text;
    if (task.isNotEmpty) {
      try {
        await _appwriteService.addTask(task);
        _controller.clear();
        _loadTasks();
      } catch (e) {
        print('Error adding task: $e');
      }
    }
  }

// get tasks
  Future<void> _loadTasks() async {
    try {
      final tasks = await _appwriteService.getTasks();
    
      setState(() {
        _tasks = tasks.map((e) => Task.fromDocument(e)).toList();
      });
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(_tasks);
    } catch (e) {
      print('Error loading tasks: $e');
    }
  }



// completed task
  Future<void> _updateTaskStatus(Task task) async {
    try {
      final updatedTask =
          await _appwriteService.updateTaskStatus(task.id, !task.isCompleted);
      setState(() {
        task.isCompleted != updatedTask.data['completed'];
         _loadTasks();
      });
    } catch (e) {
      print('Error updating task: $e');
    }
  }


  // delet task
   Future<void> _deleteTask(String taskId) async {
    try {
      await _appwriteService.deleteTask(taskId);
      _loadTasks();
    } catch (e) {
      print('Error deleting task: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("T O D O L I S T"),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        labelText: 'New Task',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(onPressed: _addTask, child: Text("Add"))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Divider(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  title: Text(
                    task.task,
                    style: TextStyle(
                      decoration:
                          task.isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.check),
                    onPressed:()=> _updateTaskStatus(task),
                  ),
                  onLongPress: ()=> _deleteTask(task.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
