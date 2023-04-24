import 'package:eltracmo_staff/common/constants.dart';
import 'package:eltracmo_staff/models/vehicle.dart';
import 'package:eltracmo_staff/pages/common/dialogs.dart';
import 'package:eltracmo_staff/pages/common/loading_screen.dart';
import 'package:eltracmo_staff/pages/vehicles/vehicles_home_page.dart';
import 'package:eltracmo_staff/services/vehicle_service.dart';
import 'package:eltracmo_staff/widgets/form/form_label.dart';
import 'package:eltracmo_staff/widgets/form/rounded_corner_dropdown.dart';
import 'package:eltracmo_staff/widgets/form/rounded_corner_text_field.dart';
import 'package:eltracmo_staff/widgets/rounded_cornered_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class VehiclesAddPage extends StatefulWidget {
  const VehiclesAddPage({super.key});

  @override
  State<VehiclesAddPage> createState() => _VehiclesAddPageState();
}

class _VehiclesAddPageState extends State<VehiclesAddPage> {
  // form builder key
  final _formKey = GlobalKey<FormBuilderState>();
  bool isLoading = false;

  List<String> models = [];

  void saveVehicleDetails() async {
    if (_formKey.currentState!.saveAndValidate()) {
      setState(() {
        isLoading = true;
      });

      // collect form data
      Map<String, dynamic>? data = {};
      data.addAll(_formKey.currentState!.value);

      // set current_mileage as int
      data['current_mileage'] = int.parse(data['current_mileage']);

      // save vehicle details
      Vehicle? vehicle = await VehicleService.saveVehicle(data);

      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      if (vehicle == null || vehicle.id == null) {
        // show error message
        showDialog(
          context: context,
          builder: (context) => Dialogs.getAlertDialog(
            context,
            'Failed',
            'Failed to create the vehicle.',
          ),
        );
      } else {
        // show success message
        showDialog(
          context: context,
          builder: (context) {
            return Dialogs.getAlertDialog(
              context,
              'Success',
              'Vehicle created successfully.',
              onConfirm: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const VehiclesHomePage(),
                  ),
                );
              },
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => Dialogs.getAlertDialog(
          context,
          'Insufficient/Invalid Details',
          'You have some information missing or invalid. Please check and correct them, and try again.',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Vehicle'),
      ),
      body: isLoading
          ? const LoadingScreen()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormLabel(text: 'Title / Nickname'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const RoundedCornerTextField(
                        name: 'title',
                        errorText: 'A title / nickname is required',
                        textInputType: TextInputType.name,
                        isObscure: false,
                        hintText:
                            'Enter a title or nickname here. (Ex: My Car)',
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const FormLabel(text: 'Make'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      RoundedCornerDropdown(
                        name: 'make',
                        errorText: 'A make is required',
                        items:
                            Constants.getVehicleMakesList().map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          var data = Constants.getVehicleModels();
                          setState(() {
                            models =
                                data.containsKey(value) ? data[value]! : [];
                          });
                        },
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const FormLabel(text: 'Model'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const RoundedCornerTextField(
                        name: 'model',
                        errorText: 'Your vehicle model is required.',
                        textInputType: TextInputType.name,
                        hintText: 'Enter your vehicle model here...',
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const FormLabel(text: 'Edition'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const RoundedCornerTextField(
                        name: 'edition',
                        isNullable: true,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const FormLabel(text: 'Registered Year'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const RoundedCornerTextField(
                        name: 'registered_year',
                        isNullable: true,
                        textInputType: TextInputType.numberWithOptions(
                            signed: false, decimal: false),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const FormLabel(text: 'Registration Number'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const RoundedCornerTextField(
                        name: 'registration_number',
                        isNullable: true,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const FormLabel(text: 'Current Mileage'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const RoundedCornerTextField(
                        name: 'current_mileage',
                        isNullable: true,
                        textInputType: TextInputType.numberWithOptions(
                          signed: false,
                          decimal: false,
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const FormLabel(text: 'Color'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const RoundedCornerTextField(
                        name: 'color',
                        isNullable: true,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const FormLabel(text: 'Remarks'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const RoundedCornerTextField(
                        name: 'remarks',
                        isNullable: true,
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      RoundedCorneredButton(
                        buttonText: 'Save Changes',
                        onPressed: () {
                          saveVehicleDetails();
                        },
                        isDisabled: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
