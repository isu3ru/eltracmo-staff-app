import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class RoundedCornerTimePicker extends StatelessWidget {
  final String name;
  final String errorText;
  final String? time;

  const RoundedCornerTimePicker(
      {Key? key, required this.name, required this.errorText, this.time})
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
              inputType: InputType.time,
              format: DateFormat("hh:mm:ss a"),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: errorText),
              ]),
              initialDate: (time == null)
                  ? null
                  : (time! == 'null' || time!.isEmpty
                      ? null
                      : DateTime.parse(time!)),
              initialValue: (time == null)
                  ? null
                  : (time! == 'null' || time!.isEmpty
                      ? null
                      : DateTime.parse(time!)),
            ),
          ),
          const Icon(Icons.access_time),
        ],
      ),
    );
  }
}
