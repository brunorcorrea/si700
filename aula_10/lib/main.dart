import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc.dart';

import 'bloc/manage_bloc.dart';

import 'view/add_note.dart';
import 'view/list_note.dart';
import 'view/wrapper.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC3Xgtle50BHxOnaaVVwvQJL2aTLGRYKjU",
          authDomain: "si700-b260759.firebaseapp.com",
          databaseURL: "https://si700-b260759-default-rtdb.firebaseio.com",
          projectId: "si700-b260759",
          storageBucket: "si700-b260759.appspot.com",
          messagingSenderId: "858159683935",
          appId: "1:858159683935:web:b2646ffcd4258e38037eea"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return ManageBloc(InsertState(noteList: []))
              ..add(
                GetNoteListEvent(),
              );
          },
        ),
        BlocProvider(
          create: (context) {
            return AuthBloc();
          },
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Wrapper(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(child: ListNoteScreen()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ManageBloc>(context).add(UpdateCancel());
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddNoteScreen()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
