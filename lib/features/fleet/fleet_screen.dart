import 'package:flutter/material.dart';

import '../../data/mock/truck_data.dart';
import '../../models/truck.dart';

import 'dialogs/add_truck_dialog.dart';
import 'dialogs/edit_truck_dialog.dart';

import 'widgets/fleet_search.dart';
import 'widgets/fleet_stats.dart';
import 'widgets/truck_card.dart';

class FleetScreen extends StatefulWidget {
  const FleetScreen({super.key});

  @override
  State<FleetScreen> createState() => _FleetScreenState();
}

class _FleetScreenState extends State<FleetScreen> {
  late List<Truck> trucks;
  late List<Truck> filteredTrucks;

  @override
  void initState() {
    super.initState();

    trucks = List.from(truckData);
    filteredTrucks = List.from(trucks);
  }


  void searchTruck(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTrucks = List.from(trucks);
      } else {
        filteredTrucks = trucks.where((truck) {

          return truck.id.toLowerCase().contains(query.toLowerCase()) ||
              truck.driver.toLowerCase().contains(query.toLowerCase()) ||
              truck.status.toLowerCase().contains(query.toLowerCase());

        }).toList();
      }
    });
  }


  int get totalTrucks => trucks.length;


  int get onlineTrucks =>
      trucks.where((truck) => truck.isOnline).length;


  int get offlineTrucks =>
      trucks.where((truck) => !truck.isOnline).length;


  int get maintenanceTrucks =>
      trucks.where(
        (truck) =>
            truck.status.toLowerCase() == "maintenance",
      ).length;



  void addTruck(Truck truck) {

    setState(() {

      trucks.add(truck);

      filteredTrucks = List.from(trucks);

    });

  }



  void updateTruck(Truck updatedTruck, Truck oldTruck) {

    setState(() {

      final index = trucks.indexOf(oldTruck);

      trucks[index] = updatedTruck;

      filteredTrucks = List.from(trucks);

    });

  }



  void deleteTruck(Truck truck) {

    setState(() {

      trucks.remove(truck);

      filteredTrucks = List.from(trucks);

    });

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Fleet"),
      ),


      floatingActionButton: FloatingActionButton(

        onPressed: () {

          showDialog(

            context: context,

            builder: (_) => AddTruckDialog(

              onSave: addTruck,

            ),

          );

        },

        child: const Icon(Icons.add),

      ),



      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [


            FleetStats(

              total: totalTrucks,

              online: onlineTrucks,

              offline: offlineTrucks,

              maintenance: maintenanceTrucks,

            ),



            const SizedBox(height: 20),



            FleetSearch(

              onChanged: searchTruck,

            ),



            const SizedBox(height: 20),



            Expanded(

              child: ListView.builder(

                itemCount: filteredTrucks.length,


                itemBuilder: (context, index) {


                  final truck = filteredTrucks[index];


                  return TruckCard(

                    truck: truck,


                    onDelete: () {

                      deleteTruck(truck);

                    },


                    onEdit: () {


                      showDialog(

                        context: context,


                        builder: (_) => EditTruckDialog(

                          truck: truck,


                          onSave: (updatedTruck) {

                            updateTruck(
                              updatedTruck,
                              truck,
                            );

                          },

                        ),

                      );


                    },

                  );


                },

              ),

            ),

          ],

        ),

      ),

    );

  }
}