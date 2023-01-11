import 'package:flutter/material.dart';

import '../models/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallBack;
  final VoidCallback likeOrDislikeCallback;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;
  const PopupMenu({
    Key? key,
    required this.cancelOrDeleteCallBack,
    required this.likeOrDislikeCallback,
    required this.editTaskCallback,
    required this.restoreTaskCallback,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted == false
          ? ((context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: editTaskCallback,
                    icon: const Icon(Icons.edit),
                    label: const Text('Өңдеу'),
                    // label: const Text('Edit'),
                    // label: TextButton(
                    //   onPressed: editTaskCallback,
                    //   child: const Text(
                    //     'Edit',
                    //     textAlign: TextAlign.right,
                    //   ),
                    // ),
                  ),
                  onTap: null,
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: likeOrDislikeCallback,
                    icon: task.isFavorite == false
                        ? const Icon(Icons.bookmark_add_outlined)
                        : const Icon(Icons.bookmark_remove),
                    label: task.isFavorite == false
                        ? const Text('Маңыздыларға қосу')
                        // ? const Text('Add to \nBookmark')
                        : const Text('Маңыздылардан алу'),
                    // : const Text('Remove from \nBookmarks'),
                  ),
                  onTap: likeOrDislikeCallback,
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.delete),
                    label: const Text('Өшіру'),
                    // label: const Text('Delete'),
                  ),
                  onTap: cancelOrDeleteCallBack,
                ),
              ])
          : (context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.restore_from_trash),
                    label: const Text('Қалпына келтіру'),
                    // label: const Text('Restore'),
                  ),
                  onTap: restoreTaskCallback,
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.delete_forever),
                    label: const Text('Мүлдем өшіру'),
                    // label: const Text('Delete Forever'),
                  ),
                  onTap: cancelOrDeleteCallBack,
                ),
              ],
    );
  }
}
