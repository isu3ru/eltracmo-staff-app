import 'package:eltracmo_staff/models/vehicle.dart';
import 'package:flutter/material.dart';

class VehiclesSingleDetailsPage extends StatefulWidget {
  final Vehicle vehicle;

  const VehiclesSingleDetailsPage({super.key, required this.vehicle});

  @override
  State<VehiclesSingleDetailsPage> createState() =>
      _VehiclesSingleDetailsPageState();
}

class _VehiclesSingleDetailsPageState extends State<VehiclesSingleDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.vehicle.title!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              widget.vehicle.title ?? '-',
              style: const TextStyle(
                fontSize: 32.0,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            getDataRow('Registration Number:',
                widget.vehicle.registrationNumber ?? '-'),
            const SizedBox(
              height: 16.0,
            ),
            getDataRow('Make:', widget.vehicle.make ?? '-'),
            const SizedBox(
              height: 16.0,
            ),
            getDataRow('Model:', widget.vehicle.model ?? '-'),
            const SizedBox(
              height: 16.0,
            ),
            getDataRow('Edition:', widget.vehicle.edition ?? '-'),
            const SizedBox(
              height: 16.0,
            ),
            getDataRow(
                'Registered Year:', widget.vehicle.registeredYear ?? '-'),
            const SizedBox(
              height: 16.0,
            ),
            getDataRow('Color:', widget.vehicle.color ?? '-'),
            const SizedBox(
              height: 16.0,
            ),
            getDataRow('Current Mileage:', '${widget.vehicle.currentMileage}'),
            const SizedBox(
              height: 16.0,
            ),
            Text(widget.vehicle.registeredYear ?? '-'),
            Text(widget.vehicle.registrationNumber ?? '-'),
          ],
        ),
      ),
    );
  }

  Row getDataRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
