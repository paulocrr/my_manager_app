import 'package:flutter/material.dart';
import 'package:my_manager_app/languages/my_text.dart';
import 'package:my_manager_app/widgets/spent_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  builder: (_) {
                    return Form(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                label: Text('Fecha'),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                label: Text('Description'),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                label: Text('Precio'),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.add),
                              label: Text('Agregar'),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            icon: const Icon(Icons.add),
          ),
        ],
        title: Text(MyText.homePageText.appBarTitle),
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
                        SpentItem(
                          amount: 26.50,
                          date: DateTime.now(),
                          description: 'Prueba',
                        ),
                        SpentItem(
                          amount: 26.50,
                          date: DateTime.now(),
                          description: 'Prueba',
                        ),
                        SpentItem(
                          amount: 26.50,
                          date: DateTime.now(),
                          description: 'Prueba',
                        ),
                        SpentItem(
                          amount: 26.50,
                          date: DateTime.now(),
                          description: 'Prueba',
                        ),
                        SpentItem(
                          amount: 26.50,
                          date: DateTime.now(),
                          description: 'Prueba',
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
