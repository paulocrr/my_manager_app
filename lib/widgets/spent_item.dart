import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SpentItem extends StatelessWidget {
  final double amount;
  final String description;
  final DateTime date;

  const SpentItem({
    super.key,
    required this.amount,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Text(
            'S/ ${amount.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        title: Text(description),
        subtitle: Text(DateFormat('dd-MM-yyyy').format(date)),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
