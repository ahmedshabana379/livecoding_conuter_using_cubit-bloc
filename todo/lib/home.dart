import 'package:flutter/material.dart';
import 'package:todo/cubit/todo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TODO"),
        backgroundColor: Colors.amber,
      ),
      body: BlocProvider(
        create: (context) => TodoCubit(),
        child: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(height: 15),
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "ADD YOUR TASK !!!",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    if (controller.text.isEmpty) return;
                    context.read<TodoCubit>().addTask(controller.text);
                    controller.clear();
                  },
                  child: Text("Add Task"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) => TodoCard(
                      title: state.todos[index].text,
                      value: state.todos[index].isCompeletd,
                      onChanged: (v) {
                        context.read<TodoCubit>().toggleTask(
                          state.todos[index].id,
                        );
                      },
                      onPressed: () => context.read<TodoCubit>().deleteTask(
                        state.todos[index].id,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class TodoCard extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String title;
  final VoidCallback onPressed;

  const TodoCard({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(value: value, onChanged: onChanged),
      title: Text(title),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
