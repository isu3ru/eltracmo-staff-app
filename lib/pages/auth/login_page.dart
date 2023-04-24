import 'package:eltracmo_staff/pages/common/dialogs.dart';
import 'package:eltracmo_staff/pages/common/loading_screen.dart';
import 'package:eltracmo_staff/pages/staff/dashboard_page.dart';
import 'package:eltracmo_staff/services/auth_service.dart';
import 'package:eltracmo_staff/widgets/form/form_label.dart';
import 'package:eltracmo_staff/widgets/form/rounded_corner_text_field.dart';
import 'package:eltracmo_staff/widgets/rounded_cornered_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool isLoading = false;

  Future<void> handleLogin() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      debugPrint(_formKey.currentState!.value.toString());
      return;
    }

    isLoading = true;

    var formData = _formKey.currentState!.value;
    bool isLoggedIn = await AuthService.attemptLogin(
        formData['phone_number'], formData['password']);
    isLoading = false;
    if (isLoggedIn) {
      if (!mounted) return;

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const Dashboard(),
          ),
          (route) => false);
    } else {
      if (!mounted) return;

      // show login failed message
      showDialog(
        context: context,
        builder: (context) {
          return Dialogs.getAlertDialog(context, "Login Failed",
              "Failed to log in due to some reason.\nPlease check your mobile number and password and try again.");
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
                    vertical: MediaQuery.of(context).size.height * 0.15),
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
                        'Staff Login',
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
                        autovalidateMode: AutovalidateMode.disabled,
                        skipDisabled: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const FormLabel(text: 'Mobile Number'),
                            const SizedBox(
                              height: 8.0,
                            ),
                            const RoundedCornerTextField(
                              name: 'phone_number',
                              errorText: 'A valid phone number is required',
                              textInputType: TextInputType.phone,
                              isObscure: false,
                              hintText: 'Enter your mobile number',
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            const FormLabel(text: 'Password'),
                            const SizedBox(
                              height: 8.0,
                            ),
                            const RoundedCornerTextField(
                              name: 'password',
                              errorText: 'Password is required.',
                              textInputType: TextInputType.visiblePassword,
                              isObscure: true,
                              hintText: 'Enter your password',
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            RoundedCorneredButton(
                              buttonText: 'Log In',
                              onPressed: () {
                                handleLogin();
                              },
                              isDisabled: false,
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
