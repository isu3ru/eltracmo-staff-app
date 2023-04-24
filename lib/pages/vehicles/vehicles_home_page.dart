import 'package:eltracmo_staff/common/app_theme.dart';
import 'package:eltracmo_staff/models/vehicle.dart';
import 'package:eltracmo_staff/services/vehicle_service.dart';
import 'package:eltracmo_staff/widgets/info_banner.dart';
import 'package:eltracmo_staff/widgets/vehicle_summary_card_horizontal.dart';
import 'package:flutter/material.dart';

import 'vehicles_add_page.dart';

class VehiclesHomePage extends StatefulWidget {
  const VehiclesHomePage({super.key});

  @override
  State<VehiclesHomePage> createState() => _VehiclesHomePageState();
}

class _VehiclesHomePageState extends State<VehiclesHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Vehicles'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // light blue colored info card saying to click the plus icon to add a new vehicle
          const InfoBanner(
            title: 'Add a new vehicle',
            text: 'Click the plus icon below to add a new vehicle',
            icon: Icons.add,
          ),

          Expanded(
            child: FutureBuilder<List<Vehicle>>(
              builder: (context, snapshot) {
                // if data is stil loading
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  // if data is null
                  if (snapshot.data == null) {
                    return const Center(
                      child: Text('No vehicles found'),
                    );
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return VehicleSummaryCardHorizontal(
                        image: Image.asset('assets/images/vehicle.png'),
                        vehicle: snapshot.data![index],
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('No vehicles found'),
                  );
                }
              },
              future: VehicleService.getAllVehiclesList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.appBarColor,
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const VehiclesAddPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
