import 'package:flutter/material.dart';
import '../services/guid_gen.dart';
import 'package:uuid/uuid.dart';

import '../bloc/bloc_exports.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uuid = const Uuid();
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Тапсырманы қосу',
            // 'Add Task',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
                label: Text('Атауы'), border: OutlineInputBorder()),
            // label: Text('Title'), border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            autofocus: true,
            controller: descriptionController,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
                label: Text('Сипаттамасы'), border: OutlineInputBorder()),
            // label: Text('Description'), border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Болдырмау'),
                // child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  var task = Task(
                    title: titleController.text,
                    description: descriptionController.text,
                    // id: GUIDGen.generate(),
                    id: uuid.v4(),
                    date: DateTime.now().toString(),
                    isDeleted: false,
                    isDone: false,
                    isFavorite: false,
                  );
                  context.read<TasksBloc>().add(AddTask(task: task));
                  Navigator.pop(context);
                },
                child: const Text('Қосу'),
                // child: const Text('Add Task'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
