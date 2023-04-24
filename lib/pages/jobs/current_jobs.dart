import 'package:eltracmo_staff/models/appointment.dart';
import 'package:eltracmo_staff/models/job.dart';
import 'package:eltracmo_staff/pages/jobs/create_job_page.dart';
import 'package:eltracmo_staff/services/appointment_service.dart';
import 'package:eltracmo_staff/services/job_service.dart';
import 'package:eltracmo_staff/widgets/rounded_cornered_button.dart';
import 'package:flutter/material.dart';

class CurrentJobs extends StatefulWidget {
  const CurrentJobs({super.key});

  @override
  State<CurrentJobs> createState() => _CurrentJobsState();
}

class _CurrentJobsState extends State<CurrentJobs> {
  late Future<List<Job?>> jobs;

  @override
  void initState() {
    super.initState();
    loadJobs();
  }

  void loadJobs() {
    setState(() {
      jobs = JobService.getAllJobs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Jobs'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Running Jobs',
            style: TextStyle(fontSize: 16.0),
          ),
          RoundedCorneredButton(
              buttonText: 'Create Job',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreateJobPage()));
              },
              isDisabled: false),
        ],
      ),
    );
  }
}
