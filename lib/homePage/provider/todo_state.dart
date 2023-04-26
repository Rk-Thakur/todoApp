import 'package:equatable/equatable.dart';

enum TodoStatus { intial, adding, added, editing, edited, deleted, failure }

class TodoState extends Equatable {
  final TodoStatus todostate;
  final String? errormessage;
  TodoState({
    required this.todostate,
    this.errormessage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [todostate, errormessage];

  TodoState copyWith({
    TodoStatus? todostate,
    String? errormessage,
  }) {
    return TodoState(
      todostate: todostate ?? this.todostate,
      errormessage: errormessage ?? this.errormessage,
    );
  }
}
