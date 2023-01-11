import 'package:flutter/material.dart';
import '../models/task.dart';
import '../bloc/bloc_exports.dart';
import '../widgets/tasks_list.dart';

class FavoriteTasksScreen extends StatelessWidget {
  const FavoriteTasksScreen({Key? key}) : super(key: key);
  static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.favoriteTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Chip(
                label: Text(
                  '${tasksList.length} Тапсырмалар:',
                  // '${tasksList.length} Tasks:',
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
