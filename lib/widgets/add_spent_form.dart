import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:my_manager_app/languages/my_text.dart';
import 'package:my_manager_app/models/spent.dart';
import 'package:my_manager_app/widgets/date_picker_text_form_field.dart';
import 'package:uuid/uuid.dart';

class AddSpentForm extends StatefulWidget {
  final void Function(Spent spent)? onSave;

  const AddSpentForm({super.key, this.onSave});

  @override
  State<AddSpentForm> createState() => _AddSpentFormState();
}

class _AddSpentFormState extends State<AddSpentForm> {
  final _datePickerEditingController = TextEditingController();
  final _descriptionEditingController = TextEditingController();
  final _priceTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
              validator: MultiValidator([
                RequiredValidator(
                    errorText: MyText.addSpentFormText.requiredErrorText),
                DateValidator('dd-MM-yyyy',
                    errorText: MyText.addSpentFormText.dateErrorText),
              ]),
              controller: _datePickerEditingController,
            ),
            TextFormField(
              controller: _descriptionEditingController,
              validator: RequiredValidator(
                  errorText: MyText.addSpentFormText.requiredErrorText),
              decoration: InputDecoration(
                label: Text(MyText.addSpentFormText.descriptionLabelText),
              ),
            ),
            TextFormField(
              controller: _priceTextEditingController,
              validator: MultiValidator([
                RequiredValidator(
                    errorText: MyText.addSpentFormText.requiredErrorText),
                PatternValidator(r'^\d{1,8}(?:\.\d{1,4})?$',
                    errorText: MyText.addSpentFormText.priceErrorText),
              ]),
              decoration: InputDecoration(
                label: Text(MyText.addSpentFormText.priceLabelText),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final id = const Uuid().v1();
                  final price = double.parse(_priceTextEditingController.text);
                  final date = DateFormat('dd-MM-yyyy')
                      .parse(_datePickerEditingController.text);
                  final description = _descriptionEditingController.text;

                  final spent = Spent(
                    id: id,
                    amount: price,
                    date: date,
                    description: description,
                  );

                  final callback = widget.onSave;
                  if (callback != null) {
                    callback(spent);
                  }
                }
              },
              icon: const Icon(Icons.add),
              label: Text(MyText.addSpentFormText.addButtonText),
            )
          ],
        ),
      ),
    );
  }
}
