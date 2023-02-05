import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_manager_app/languages/my_text.dart';
import 'package:my_manager_app/models/spent.dart';
import 'package:my_manager_app/widgets/add_spent_form.dart';
import 'package:my_manager_app/widgets/spent_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Spent> expenses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  builder: (_) {
                    return AddSpentForm(
                      onSave: (spent) {
                        setState(() {
                          expenses.add(spent);
                        });

                        Navigator.pop(context);
                      },
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
                    child: expenses.isEmpty
                        ? Lottie.asset(
                            'assets/animations/empty.json',
                            repeat: false,
                          )
                        : ListView(
                            children: expenses.reversed
                                .map((spent) => SpentItem(spent: spent))
                                .toList(),
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
