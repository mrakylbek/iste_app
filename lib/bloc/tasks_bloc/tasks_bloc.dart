import 'package:equatable/equatable.dart';
import '../../data/repository';
import '../../models/task.dart';

import '../bloc_exports.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  final TasksRepository tasksRepository;
  TasksBloc(this.tasksRepository)
      : super(TasksLoaded(
          completedTasks: tasksRepository.completedTasks,
          favoriteTasks: tasksRepository.favoriteTasks,
          pendingTasks: tasksRepository.pendingTasks,
          removedTasks: tasksRepository.removedTasks,
        )) {
    on<AddTask>(_onAddTask);
    on<DeleteTask>(_onDeleteTask);
    on<UpdateTask>(_onUpdateTask);
    on<RemoveTask>(_onRemoveTask);
    on<MarkFavoriteOrUnfavorite>(_onMarkFavoriteOrUnfavoriteTask);
    on<EditTask>(_onEditTask);
    on<RestoreTask>(_onRestoreTask);
    on<DeleteAllTask>(_onDeleteAllTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    tasksRepository.addTask(event.task);
    emit(
      TasksLoaded(
        pendingTasks: tasksRepository.getPendingTasks(),
        completedTasks: tasksRepository.getCompletedTasks(),
        favoriteTasks: tasksRepository.getFavoriteTasks(),
        removedTasks: tasksRepository.getRemovedTasks(),
      ),
    );
    // emit(TasksState(
    //   // pendingTasks: List<Task>.from(state.pendingTasks)
    //   pendingTasks: List.from(state.pendingTasks)
    //     ..add(event.task
    //         .copyWith(isDeleted: false, isFavorite: false, isDone: false)),
    //   removedTasks: state.removedTasks,
    //   favoriteTasks: state.favoriteTasks,
    //   completedTasks: state.completedTasks,
    // ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    // final state = this.state;
    // final task = event.task;
    // List<Task> pendingTasks = state.pendingTasks;
    // List<Task> completedTasks = state.completedTasks;
    // List<Task> favoriteTasks = state.favoriteTasks;
    // // List pendingTasks = state.pendingTasks;
    // // List completedTasks = state.completedTasks;
    // // List favoriteTasks = state.favoriteTasks;
    // if (task.isDone == false) {
    //   if (task.isFavorite == false) {
    //     pendingTasks = List.from(pendingTasks)..remove(task);
    //     completedTasks = List.from(completedTasks)
    //       ..add(task.copyWith(isDone: true));
    //     // completedTasks.insert(0, task.copyWith(isDone: true));
    //   } else {
    //     var taskIndex = favoriteTasks.indexOf(task);
    //     pendingTasks = List.from(pendingTasks)..remove(task);
    //     completedTasks = List.from(completedTasks)
    //       ..add(task.copyWith(isDone: true, isFavorite: true));
    //     // completedTasks.insert(0, task.copyWith(isDone: true));
    //     favoriteTasks = List.from(favoriteTasks)
    //       ..remove(task)
    //       ..insert(taskIndex, task.copyWith(isDone: true, isFavorite: true));
    //   }
    // } else {
    //   if (task.isFavorite == false) {
    //     completedTasks = List.from(completedTasks)..remove(task);
    //     pendingTasks = List.from(pendingTasks)
    //       ..add(task.copyWith(isDone: false, isFavorite: false));
    //   } else {
    //     var taskIndex = favoriteTasks.indexOf(task);
    //     completedTasks = List.from(completedTasks)..remove(task);
    //     pendingTasks = List.from(pendingTasks)
    //       ..insert(0, task.copyWith(isDone: false, isFavorite: true));
    //     favoriteTasks = List.from(favoriteTasks)
    //       ..remove(task)
    //       ..insert(taskIndex, task.copyWith(isDone: false, isFavorite: true));
    //   }
    // }

    // emit(TasksState(
    //   pendingTasks: pendingTasks,
    //   completedTasks: completedTasks,
    //   favoriteTasks: favoriteTasks,
    //   removedTasks: state.removedTasks,
    // ));

    tasksRepository.updateTask(event.task);
    emit(
      TasksLoaded(
        pendingTasks: tasksRepository.pendingTasks,
        completedTasks: tasksRepository.completedTasks,
        favoriteTasks: tasksRepository.favoriteTasks,
        removedTasks: tasksRepository.removedTasks,
      ),
    );
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    // final task = event.task;
    // final int index = state.allTasks.indexOf(task);
    // List<Task> allTasks = List.from(state.pendingTasks)..remove(task);
    // task.isDeleted == false
    //     ? allTasks.insert(index, task.copyWith(isDone: true))
    //     : allTasks.insert(index, task.copyWith(isDone: false));

    emit(
      TasksState(
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: List.from(state.removedTasks)..remove(event.task),
      ),
    );
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        completedTasks: List.from(state.completedTasks)..remove(event.task),
        favoriteTasks: List.from(state.favoriteTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true))));
  }

  void _onMarkFavoriteOrUnfavoriteTask(
      MarkFavoriteOrUnfavorite event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    List<Task> favoriteTasks = state.favoriteTasks;
    if (event.task.isDone == false) {
      if (event.task.isFavorite == false) {
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks
          ..remove(event.task)
          ..insert(
              taskIndex, event.task.copyWith(isFavorite: true, isDone: false));
        // if (state.favoriteTasks.isEmpty) {
        //   favoriteTasks = List<Task>.from(state.pendingTasks)
        //     ..add(event.task.copyWith(isFavorite: true));
        // } else {
        //   favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
        // }
        // favoriteTasks = List<Task>.from(favoriteTasks)
        favoriteTasks = List.from(favoriteTasks)
          ..add(
            event.task.copyWith(
              isFavorite: true,
              isDeleted: false,
              isDone: false,
            ),
          );
        // favoriteTasks = List.from(favoriteTasks)
        //   ..insert(
        //     favoriteTasks.length,
        //     event.task.copyWith(
        //       isFavorite: true,
        //       isDeleted: false,
        //       isDone: false,
        //     ),
        //   );
        // if (state.favoriteTasks.isNotEmpty) {
        //   favoriteTasks = List<Task>.from(state.favoriteTasks)
        //     ..add(event.task.copyWith(
        //       isFavorite: true,
        //       isDeleted: false,
        //       isDone: false,
        //     ));
        // } else {
        //   favoriteTasks.insert(
        //       0,
        //       event.task.copyWith(
        //         isFavorite: true,
        //         isDeleted: false,
        //         isDone: false,
        //       ));
        // }
      } else {
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: false));
        favoriteTasks = List.from(pendingTasks)..remove(event.task);
      }
    } else {
      if (event.task.isFavorite == false) {
        var taskIndex = completedTasks.indexOf(event.task);
        completedTasks = List.from(completedTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: true));
        // favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
        favoriteTasks = List<Task>.from(favoriteTasks)
          ..add(
            event.task.copyWith(
              isFavorite: true,
              isDeleted: false,
              isDone: true,
            ),
          );
      } else {
        var taskIndex = completedTasks.indexOf(event.task);
        completedTasks = List.from(completedTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: false));
        favoriteTasks.remove(event.task);
      }
    }

    emit(TasksState(
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
      favoriteTasks: favoriteTasks,
      removedTasks: state.removedTasks,
    ));
  }

  void _onEditTask(EditTask event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Task> favoriteTasks = state.favoriteTasks;
    List<Task> completedTasks = state.completedTasks;
    if (event.oldtask.isFavorite == true) {
      favoriteTasks
        ..remove(event.oldtask)
        ..insert(0, event.newtask);
    }
    if (event.oldtask.isDone == true) {
      completedTasks.remove(event.oldtask);
    }

    emit(
      TasksState(
        pendingTasks: List.from(state.pendingTasks)
          ..remove(event.oldtask)
          ..insert(0, event.newtask),
        completedTasks: completedTasks,
        // completedTasks: state.completedTasks..remove(event.oldtask),
        favoriteTasks: favoriteTasks,
        removedTasks: state.removedTasks,
      ),
    );
  }

  void _onRestoreTask(RestoreTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        removedTasks: List.from(state.removedTasks)..remove(event.task),
        pendingTasks: List.from(state.pendingTasks)
          ..insert(
              0,
              event.task.copyWith(
                isDeleted: false,
                isDone: false,
                isFavorite: false,
              )),
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
      ),
    );
  }

  void _onDeleteAllTask(DeleteAllTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        removedTasks: List.from(state.removedTasks)..clear(),
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        pendingTasks: state.pendingTasks,
      ),
    );
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
