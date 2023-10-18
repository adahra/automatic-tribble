import 'package:coba_learn/models/todo.dart';
import 'package:coba_learn/screens/first_screen.dart';
import 'package:coba_learn/screens/main_screen.dart';
import 'package:coba_learn/screens/sample_app.dart';
import 'package:coba_learn/screens/sample_app_page.dart';
import 'package:coba_learn/screens/todos_screen.dart';
import 'package:flutter/material.dart';

class MainPageApp extends StatefulWidget {
  const MainPageApp({super.key});

  @override
  State<MainPageApp> createState() => _MainPageAppState();
}

class _MainPageAppState extends State<MainPageApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hanya Coba"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SampleAppPage();
                      },
                    ),
                  );
                },
                child: const Text('Coba Http'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SampleApp();
                      },
                    ),
                  );
                },
                child: const Text('Coba Animation'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const MainScreen();
                      },
                    ),
                  );
                },
                child: const Text('Coba Animation Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const FirstRoute();
                      },
                    ),
                  );
                },
                child: const Text('Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TodosScreen(
                          todos: List.generate(
                            20,
                            (index) => Todo(
                              'Todo $index',
                              'A description of what needs to be done for Todo $index',
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                child: const Text('Todo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
