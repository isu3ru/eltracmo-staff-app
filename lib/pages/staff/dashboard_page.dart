import 'package:eltracmo_staff/common/app_theme.dart';
import 'package:eltracmo_staff/pages/auth/login_page.dart';
import 'package:eltracmo_staff/pages/common/dialogs.dart';
import 'package:eltracmo_staff/pages/common/loading_screen.dart';
import 'package:eltracmo_staff/pages/jobs/current_jobs.dart';
import 'package:eltracmo_staff/widgets/grid_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isLoading = false;

  void handleLogout() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialogs.getConfirmDialog(
          context,
          'Confirm Logout',
          'Are you sure you want to log out of the app? You\'ll need to log in again.',
          'Log Out',
          () {
            SharedPreferences.getInstance().then((prefs) {
              prefs.remove('token');

              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                (route) => false,
              );
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget getTopBar() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Welcome!',
            style: TextStyle(
                fontSize: 21.0,
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            color: AppTheme.primaryColor,
            onPressed: () {
              handleLogout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      );
    }

    return isLoading
        ? const LoadingScreen()
        : Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    getTopBar(),
                    const SizedBox(height: 32.0),
                    Image.asset(
                      'assets/images/eltracmo_logo.png',
                      height: 128.0,
                    ),
                    const Text(
                      'Staff Job Control',
                      style: TextStyle(fontSize: 32.0),
                    ),
                    const SizedBox(height: 32.0),
                    Expanded(
                      child: GridView.count(
                        crossAxisSpacing: 32.0,
                        mainAxisSpacing: 32.0,
                        crossAxisCount: 2,
                        children: [
                          GridButton(
                            image: 'assets/icons/appointment.png',
                            text: 'Create Jobs',
                            onTap: () {
                              // go to profile page
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const CurrentJobs();
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
