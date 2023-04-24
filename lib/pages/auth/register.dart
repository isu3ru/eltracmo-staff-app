import 'package:eltracmo_staff/pages/auth/login_page.dart';
import 'package:eltracmo_staff/pages/common/dialogs.dart';
import 'package:eltracmo_staff/pages/common/loading_screen.dart';
import 'package:eltracmo_staff/services/auth_service.dart';
import 'package:eltracmo_staff/widgets/form/form_label.dart';
import 'package:eltracmo_staff/widgets/form/rounded_corner_text_field.dart';
import 'package:eltracmo_staff/widgets/rounded_cornered_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool isLoading = false;

  Future<void> handleRegistration() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      debugPrint(_formKey.currentState!.value.toString());
      return;
    }

    setState(() {
      isLoading = true;
    });

    var formData = _formKey.currentState!.value;

    Map<String, dynamic> data = {
      'first_name': formData['firstname'],
      'last_name': formData['lastname'],
      'mobile_number': formData['phone_number'],
      'password': formData['password']
    };

    bool isRegistered = await AuthService.attemptRegistration(data);

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    if (isRegistered) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialogs.getAlertDialog(context, 'Success',
              'You have successfully registered. Please login to continue.',
              onConfirm: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                (route) => false);
          }, buttonText: 'Go to Login');
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return Dialogs.getAlertDialog(context, 'Registration Failed',
              'Failed to complete your registration. Please try again.');
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const LoadingScreen()
            : SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: MediaQuery.of(context).size.height * 0.05,
                ),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/eltracmo_logo.png',
                        width: 200.0,
                        height: 100.0,
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      const Text(
                        'Register Your Account',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      FormBuilder(
                        key: _formKey,
                        onChanged: () {},
                        autovalidateMode: AutovalidateMode.disabled,
                        initialValue: const {},
                        skipDisabled: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const FormLabel(text: 'First Name'),
                            const SizedBox(
                              height: 16.0,
                            ),
                            const RoundedCornerTextField(
                              name: 'firstname',
                              errorText: 'Your first name is required',
                              textInputType: TextInputType.name,
                              isObscure: false,
                              hintText: 'Enter your first name here..',
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            const FormLabel(text: 'Last Name'),
                            const SizedBox(
                              height: 16.0,
                            ),
                            const RoundedCornerTextField(
                              name: 'lastname',
                              errorText: 'Your last name is required',
                              textInputType: TextInputType.name,
                              isObscure: false,
                              hintText: 'Enter your last name here..',
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            const FormLabel(text: 'Mobile Number'),
                            const SizedBox(
                              height: 16.0,
                            ),
                            const RoundedCornerTextField(
                              name: 'phone_number',
                              errorText: 'Your mobile number is required',
                              textInputType: TextInputType.phone,
                              isObscure: false,
                              hintText: 'Enter your mobile number here..',
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            const FormLabel(text: 'Password'),
                            const SizedBox(
                              height: 16.0,
                            ),
                            const RoundedCornerTextField(
                              name: 'password',
                              errorText: 'Your password is required',
                              textInputType: TextInputType.visiblePassword,
                              isObscure: true,
                              hintText: 'Enter your password here..',
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            RoundedCorneredButton(
                              buttonText: 'Register',
                              onPressed: () {
                                handleRegistration();
                              },
                              isDisabled: false,
                            ),
                            const SizedBox(
                              height: 24.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                      builder: (context) {
                                        return const LoginPage();
                                      },
                                    ), (route) => false);
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
