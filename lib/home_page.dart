import 'package:flutter/material.dart';
import 'package:my_manager_app/languages/my_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
        title: Text(MyText.homePageText.appBarTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Placeholder(),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    MyText.homePageText.listSpentTitle,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        const Text(
                          'Texto 2',
                          style: TextStyle(fontSize: 50),
                        ),
                        const Text(
                          'Texto 2',
                          style: TextStyle(fontSize: 50),
                        ),
                        const Text(
                          'Texto 2',
                          style: TextStyle(fontSize: 50),
                        ),
                        const Text(
                          'Texto 2',
                          style: TextStyle(fontSize: 50),
                        ),
                        const Text(
                          'Texto 2',
                          style: TextStyle(fontSize: 50),
                        ),
                        const Text(
                          'Texto 2',
                          style: TextStyle(fontSize: 50),
                        ),
                        const Text(
                          'Texto 2',
                          style: TextStyle(fontSize: 50),
                        ),
                        const Text(
                          'Texto 2',
                          style: TextStyle(fontSize: 50),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
