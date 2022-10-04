import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptative_date_picker.dart';
import 'package:flutter/material.dart';

import 'adaptative_text_field.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
  }

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  _setSelectedDate(pickedDate) {
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10,
          bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
      child: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            AdaptativeTextField(
              label: 'Titulo',
              submitFunction: _submitForm,
              inputType: TextInputType.text,
              textfieldController: _titleController,
            ),
            AdaptativeTextField(
              label: 'Valor (R\$)',
              submitFunction: _submitForm,
              inputType: TextInputType.number,
              textfieldController: _valueController,
            ),
            AdaptativeDatePicker(
              selectedDate: _selectedDate,
              onDateChange: _setSelectedDate,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AdaptativeButton(
                  label: 'Nova Transação',
                  onPressed: _submitForm,
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
