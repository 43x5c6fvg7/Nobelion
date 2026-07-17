import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/truck.dart';
import '../../repositories/truck_repository.dart';

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

    trucks = [];
    filteredTrucks = [];
  }



  void loadTrucks(TruckRepository repository) {

    if (trucks.isEmpty) {

      trucks = List.from(repository.trucks);

      filteredTrucks = List.from(trucks);

    }

  }



  void searchTruck(String query) {

    setState(() {

      if (query.isEmpty) {

        filteredTrucks = List.from(trucks);

      } else {

        filteredTrucks = trucks.where((truck) {

          return truck.id
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||

              truck.driver
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||

              truck.status
                  .toLowerCase()
                  .contains(query.toLowerCase());

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



  void addTruck(
    TruckRepository repository,
    Truck truck,
  ) {

    setState(() {

      repository.addTruck(truck);

      trucks = List.from(repository.trucks);

      filteredTrucks = List.from(trucks);

    });

  }



  void updateTruck(
    TruckRepository repository,
    Truck oldTruck,
    Truck newTruck,
  ) {

    setState(() {

      repository.updateTruck(
        oldTruck,
        newTruck,
      );

      trucks = List.from(repository.trucks);

      filteredTrucks = List.from(trucks);

    });

  }



  void deleteTruck(
    TruckRepository repository,
    Truck truck,
  ) {

    setState(() {

      repository.deleteTruck(truck);

      trucks = List.from(repository.trucks);

      filteredTrucks = List.from(trucks);

    });

  }




  @override
  Widget build(BuildContext context) {

    final repository = context.watch<TruckRepository>();

    loadTrucks(repository);


    return Scaffold(

      appBar: AppBar(
        title: const Text("Fleet"),
      ),



      floatingActionButton: FloatingActionButton(

        onPressed: () {

          showDialog(

            context: context,

            builder: (_) => AddTruckDialog(

              onSave: (truck) {

                addTruck(
                  repository,
                  truck,
                );

              },

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


                itemBuilder: (context,index) {


                  final truck = filteredTrucks[index];


                  return TruckCard(

                    truck: truck,


                    onDelete: () {

                      deleteTruck(
                        repository,
                        truck,
                      );

                    },



                    onEdit: () {

                      showDialog(

                        context: context,


                        builder: (_) => EditTruckDialog(

                          truck: truck,


                          onSave: (updatedTruck) {


                            updateTruck(
                              repository,
                              truck,
                              updatedTruck,
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