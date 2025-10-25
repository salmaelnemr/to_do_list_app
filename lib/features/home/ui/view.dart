import 'package:flutter/material.dart';
import 'package:to_do_list_app/features/home/widgets/task_items.dart';
import 'package:to_do_list_app/widgets/app_app_bar.dart';
import '../../../widgets/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _tasks = [];
  final TextEditingController _controller = TextEditingController();

  void _addTask() {
    final taskText = _controller.text.trim();
    if (taskText.isEmpty) return;
    setState(() {
      _tasks.add({'title': taskText, 'isDone': false});
      _controller.clear();
    });
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index]['isDone'] = !_tasks[index]['isDone'];
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF450693),
      appBar: AppAppBar(
        title: "My Tasks",
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Add a new task...',
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _addTask,
                    icon: const Icon(Icons.add_circle_rounded, size: 28),
                    color: Color(0xFF6C63FF),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: _tasks.isEmpty
                ? const Center(
              child: AppText(
                title:  '✨ No tasks yet — start adding!',
                color: Colors.white,
                fontSize: 16,
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return TaskItem(
                  title: task['title'],
                  isDone: task['isDone'],
                  onToggle: () => _toggleTask(index),
                  onDelete: () => _deleteTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
