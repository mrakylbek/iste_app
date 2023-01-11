import 'package:flutter/material.dart';
import 'package:flutter_iste/services/getTasksList.dart';
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
        if (state is TasksLoaded) {
          List<Task> tasksList = getCompletedTasks(state.allTasks);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Chip(
                  label: Text(
                    '${getPendingTasks(state.allTasks).length} Аяқталмаған '
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
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
