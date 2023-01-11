import 'package:flutter/material.dart';
import 'package:flutter_iste/services/getTasksList.dart';
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
        if (state is TasksLoaded) {
          List<Task> tasksList = getPendingTasks(state.allTasks);
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
                    '${tasksList.length} Аяқталмаған '
                    // '${tasksList.length} Pending Tasks'
                    '| ${getCompletedTasks(state.allTasks).length} Аяқталған',
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
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
