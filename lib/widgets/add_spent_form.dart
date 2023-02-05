import 'package:flutter/material.dart';
import 'package:my_manager_app/widgets/date_picker_text_form_field.dart';

class AddSpentForm extends StatelessWidget {
  final _datePickerTextFormFieldController = TextEditingController();
  AddSpentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          top: 16.0,
          right: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DatePickerTextFormField(
              controller: _datePickerTextFormFieldController,
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
              onPressed: () {
                print(_datePickerTextFormFieldController.text);
              },
              icon: Icon(Icons.add),
              label: Text('Agregar'),
            )
          ],
        ),
      ),
    );
  }
}
