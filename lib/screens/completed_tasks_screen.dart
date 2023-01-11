import 'package:flutter/material.dart';
import '../models/task.dart';
import '../bloc/bloc_exports.dart';
import '../widgets/tasks_list.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({Key? key}) : super(key: key);
  static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.completedTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Chip(
                label: Text(
                  '${state.pendingTasks.length} Аяқталмаған'
                  // '${state.pendingTasks.length} Pending Tasks'
                  '| ${tasksList.length} Аяқталған',
                  // '| ${tasksList.length} Completed',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TasksList(tasksList: tasksList)
          ],
        );
      },
    );
  }
}
