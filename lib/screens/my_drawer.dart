import 'package:flutter/material.dart';
import '../screens/recycle_bin.dart';
import '../screens/tabs_screen.dart';
// import 'package:flutter_tasks_app/screens/pending_tasks_screen.dart';

import '../bloc/bloc_exports.dart';
import '../services/getTasksList.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        // backgroundColor: ,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 20,
              ),
              color: Theme.of(context).primaryColor,
              // color: Colors.grey,
              child: Text(
                'Тапсырмалар жәшігі',
                // 'Task Drawer',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                if (state is TasksLoaded) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).pushReplacementNamed(
                      TabsScreen.id,
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.folder_special),
                      title: const Text('Менің тапсырмаларым'),
                      trailing: Text(
                          '${getPendingTasks(state.allTasks).length} | ${getCompletedTasks(state.allTasks).length}'),
                    ),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                if (state is TasksLoaded) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushReplacementNamed(RecycleBin.id),
                    child: ListTile(
                      leading: const Icon(Icons.delete),
                      title: const Text('Қоқыстар'),
                      trailing:
                          Text('${getDeletedTasks(state.allTasks).length}'),
                    ),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Жарық'),
                    Switch(
                      activeColor: Colors.blue.shade400,
                      value: state.switchValue,
                      onChanged: (newValue) {
                        newValue
                            ? context.read<SwitchBloc>().add(SwitchOnEvent())
                            : context.read<SwitchBloc>().add(SwitchOffEvent());
                      },
                    ),
                    const Text('Қараңғы'),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
