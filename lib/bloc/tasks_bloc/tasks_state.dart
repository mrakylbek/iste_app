part of 'tasks_bloc.dart';

abstract class TasksState extends Equatable {
  const TasksState();
  @override
  List<Object> get props => [];

  Map<String, dynamic>? toJson() {}
}

class TasksLoading extends TasksState {}

class TasksLoaded extends TasksState {
  // final List<Task> listOfTodo;
  // const TasksLoaded(this.listOfTodo);

  final List<Task> allTasks;

  const TasksLoaded(this.allTasks);

  @override
  List<Object> get props => [allTasks];

  Map<String, dynamic> toMap() {
    log('seia: $allTasks');
    return {'allTasks': allTasks.map((e) => e.toMap()).toList()};
  }

  // final List<Task> pendingTasks;
  // final List<Task> completedTasks;
  // final List<Task> favoriteTasks;
  // final List<Task> removedTasks;
  // const TasksLoaded({
  //   // this.pendingTasks = const <Task>[],
  //   // this.completedTasks = const <Task>[],
  //   // this.favoriteTasks = const <Task>[],
  //   // this.removedTasks = const <Task>[],
  //   required this.pendingTasks,
  //   required this.completedTasks,
  //   required this.favoriteTasks,
  //   required this.removedTasks,
  // });

  // @override
  // List<Object> get props => [
  //       pendingTasks,
  //       completedTasks,
  //       favoriteTasks,
  //       removedTasks,
  //     ];

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
  //     'completedTasks': completedTasks.map((x) => x.toMap()).toList(),
  //     'favoriteTasks': favoriteTasks.map((x) => x.toMap()).toList(),
  //     'removedTasks': removedTasks.map((x) => x.toMap()).toList(),
  //   };
  // }

  // factory TasksLoaded.fromMap(Map<String, dynamic> map) {
  //   return TasksLoaded(
  //     pendingTasks: List<Task>.from(
  //       (map['pendingTasks'] as List<int>).map<Task>(
  //         (x) => Task.fromMap(x as Map<String, dynamic>),
  //       ),
  //     ),
  //     completedTasks: List<Task>.from(
  //       (map['completedTasks'] as List<int>).map<Task>(
  //         (x) => Task.fromMap(x as Map<String, dynamic>),
  //       ),
  //     ),
  //     favoriteTasks: List<Task>.from(
  //       (map['favoriteTasks'] as List<int>).map<Task>(
  //         (x) => Task.fromMap(x as Map<String, dynamic>),
  //       ),
  //     ),
  //     removedTasks: List<Task>.from(
  //       (map['removedTasks'] as List<int>).map<Task>(
  //         (x) => Task.fromMap(x as Map<String, dynamic>),
  //       ),
  //     ),
  //   );
  // }
}
