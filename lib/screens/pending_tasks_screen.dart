import 'package:flutter/material.dart';
import '../models/task.dart';
import '../bloc/bloc_exports.dart';
import '../widgets/tasks_list.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({Key? key}) : super(key: key);
  static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Chip(
                // backgroundColor: Theme.of(context).primaryColor,
                label: Text(
                  '${tasksList.length} Аяқталмаған'
                  // '${tasksList.length} Pending Tasks'
                  '| ${state.completedTasks.length} Аяқталған',
                  // '| ${state.completedTasks.length} Completed',
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
