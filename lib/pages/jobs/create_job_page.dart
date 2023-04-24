import 'package:eltracmo_staff/models/appointment.dart';
import 'package:eltracmo_staff/models/job.dart';
import 'package:eltracmo_staff/services/appointment_service.dart';
import 'package:eltracmo_staff/services/job_service.dart';
import 'package:eltracmo_staff/widgets/info_banner.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateJobPage extends StatefulWidget {
  const CreateJobPage({super.key});

  @override
  State<CreateJobPage> createState() => _CreateJobPageState();
}

class _CreateJobPageState extends State<CreateJobPage> {
  late Future<List<Appointment?>> appointmentsFuture;

  @override
  void initState() {
    super.initState();
    // get current date as string yyyy-MM-dd
    refreshAppointmentsFuture();
  }

  Future<List<Appointment?>> refreshAppointmentsFuture() async {
    setState(() {
      appointmentsFuture = AppointmentService.getAppointments(DateTime.now());
    });

    return appointmentsFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Job'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InfoBanner(
              title: 'Create Job from Appointment',
              text:
                  'Tap on an appoinment and confirm to \nconvert it into a job.'),
          const SizedBox(height: 16.0),
          Expanded(
            child: FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Appointment?> appointments =
                      snapshot.data as List<Appointment?>;

                  return RefreshIndicator(
                    onRefresh: () => refreshAppointmentsFuture(),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      shrinkWrap: true,
                      itemCount: appointments.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Row(
                            children: [
                              Text(
                                  '${appointments[index]!.vehicle!.make!} ${appointments[index]!.vehicle!.model!}'),
                              const SizedBox(width: 8.0),
                              Text(appointments[index]!
                                  .vehicle!
                                  .registrationNumber!),
                            ],
                          ),
                          subtitle: Row(children: [
                            Text(
                              DateFormat('yyyy-MM-dd').format(
                                DateTime.parse(
                                    appointments[index]!.appointmentDate!),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              DateFormat('hh:mm a').format(
                                DateTime.parse(
                                    appointments[index]!.appointmentTime!),
                              ),
                            ),
                          ]),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Confirm'),
                                  content: const Text(
                                      'Are you sure you want to create a job from this appointment?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel')),
                                    TextButton(
                                        onPressed: () {
                                          JobService.saveJob(
                                                  appointments[index]!)
                                              .then((Job? job) {});
                                        },
                                        child: const Text('Confirm'))
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
              future: appointmentsFuture,
            ),
          )
        ],
      ),
    );
  }
}
