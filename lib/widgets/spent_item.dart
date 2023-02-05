import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:my_manager_app/languages/my_text.dart';
import 'package:my_manager_app/models/spent.dart';

class SpentItem extends StatelessWidget {
  final Spent spent;

  const SpentItem({
    super.key,
    required this.spent,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Slidable(
        startActionPane: ActionPane(
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {},
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: MyText.homePageText.deleteSpentLabel,
            )
          ],
        ),
        child: ListTile(
          leading: Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Text(
              'S/ ${spent.amount.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          title: Text(spent.description),
          subtitle: Text(DateFormat.yMMMEd('es').format(spent.date)),
        ),
      ),
    );
  }
}
