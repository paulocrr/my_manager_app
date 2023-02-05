import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_manager_app/languages/my_text.dart';

class DatePickerTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const DatePickerTextFormField({
    super.key,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        label: Text(MyText.addSpentFormText.dateLabelText),
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
