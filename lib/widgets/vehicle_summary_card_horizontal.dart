import 'package:eltracmo_staff/models/vehicle.dart';
import 'package:eltracmo_staff/pages/vehicles/vehicles_single_details_page.dart';
import 'package:flutter/material.dart';

class VehicleSummaryCardHorizontal extends StatelessWidget {
  final Image? image;
  final Vehicle? vehicle;

  const VehicleSummaryCardHorizontal({
    super.key,
    this.image,
    this.vehicle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VehiclesSingleDetailsPage(
              vehicle: vehicle!,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.23),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              margin: const EdgeInsets.only(right: 16.0),
              child: Image.asset(
                'assets/icons/car.png',
                width: 96.0,
                height: 96.0,
                cacheHeight: 96,
                cacheWidth: 96,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vehicle!.title ?? '-',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  vehicle!.registrationNumber ?? '-',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  '${vehicle!.make} ${vehicle!.model}',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  vehicle!.edition ?? '-',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
