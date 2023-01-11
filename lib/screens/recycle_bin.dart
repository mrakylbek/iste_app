import 'package:flutter/material.dart';

import '../bloc/bloc_exports.dart';
import '../services/getTasksList.dart';
import '../widgets/tasks_list.dart';
import 'my_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
  static const id = 'recycle_bin_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        if (state is TasksLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Қоқыстар'),
              actions: [
                PopupMenuButton(
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              child: TextButton.icon(
                                onPressed: null,
                                icon: const Icon(Icons.delete_forever),
                                label: const Text('Барлық тапсырмаларды өшіру'),
                                // label: const Text('Delete all tasks'),
                              ),
                              onTap: () => context
                                  .read<TasksBloc>()
                                  .add(DeleteAllTask())),
                        ])
              ],
            ),
            drawer: const MyDrawer(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Chip(
                    label: Text(
                      '${getDeletedTasks(state.allTasks).length} Тапсырмалар:',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TasksList(tasksList: getDeletedTasks(state.allTasks)),
              ],
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
