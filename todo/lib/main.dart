import 'package:flutter/material.dart';
import 'package:todo/home.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
   HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp( const Todo());
}

class Todo extends StatelessWidget {
   const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home:  Home(),
    );
  }
}
