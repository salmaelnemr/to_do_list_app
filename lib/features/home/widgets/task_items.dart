import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final bool isDone;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TaskItem({
    super.key,
    required this.title,
    required this.isDone,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: ListTile(
        leading: GestureDetector(
          onTap: onToggle,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: isDone ? const Color(0xFF6C63FF) : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: const Color(0xFF6C63FF),
                width: 2,
              ),
            ),
            child: isDone
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : null,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            decoration:
            isDone ? TextDecoration.lineThrough : TextDecoration.none,
            color: isDone ? Colors.grey : Colors.black87,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
