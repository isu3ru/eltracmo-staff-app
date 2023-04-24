import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class RoundedCornerDatePicker extends StatelessWidget {
  final String name;
  final String errorText;
  final String? date;

  const RoundedCornerDatePicker(
      {Key? key, required this.name, required this.errorText, this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 16.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: FormBuilderDateTimePicker(
              name: name,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintText: 'Please Select',
              ),
              inputType: InputType.date,
              format: DateFormat("yyyy-MM-dd"),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: errorText),
              ]),
              initialDate: date == null
                  ? null
                  : (date! == 'null' || date!.isEmpty
                      ? null
                      : DateTime.parse(date!)),
              initialValue: date == null
                  ? null
                  : (date! == 'null' || date!.isEmpty
                      ? null
                      : DateTime.parse(date!)),
            ),
          ),
          const Icon(Icons.calendar_month_sharp),
        ],
      ),
    );
  }
}
