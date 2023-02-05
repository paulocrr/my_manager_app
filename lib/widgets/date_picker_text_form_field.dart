import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerTextFormField extends StatelessWidget {
  final TextEditingController? controller;

  const DatePickerTextFormField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        label: Text('Fecha'),
      ),
      onTap: () async {
        final pickDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(
              const Duration(days: 365 * 10),
            ),
            lastDate: DateTime.now().add(
              const Duration(days: 365 * 10),
            ));

        if (pickDate != null) {
          final formattedDate = DateFormat('dd-MM-yyyy').format(pickDate);
          final dateTextFieldController = controller;
          if (dateTextFieldController != null) {
            dateTextFieldController.text = formattedDate;
          }
        }
      },
    );
  }
}
