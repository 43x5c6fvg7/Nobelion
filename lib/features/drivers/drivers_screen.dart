import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/driver.dart';
import '../../repositories/driver_repository.dart';

import 'dialogs/add_driver_dialog.dart';
import 'dialogs/edit_driver_dialog.dart';

import 'widgets/driver_card.dart';



class DriversScreen extends StatefulWidget {

  const DriversScreen({
    super.key,
  });


  @override
  State<DriversScreen> createState() =>
      _DriversScreenState();

}





class _DriversScreenState
    extends State<DriversScreen> {


  List<Driver> drivers = [];

  List<Driver> filteredDrivers = [];





  void loadDrivers(
      DriverRepository repository) {


    if (drivers.isEmpty) {


      drivers =
          List.from(
            repository.drivers,
          );


      filteredDrivers =
          List.from(
            drivers,
          );

    }

  }







  void searchDriver(
      String query) {


    setState(() {


      if (query.isEmpty) {


        filteredDrivers =
            List.from(
              drivers,
            );


      } else {


        filteredDrivers =
            drivers.where(
              (driver) {


            return driver.id
                    .toLowerCase()
                    .contains(
                      query.toLowerCase(),
                    ) ||

                driver.name
                    .toLowerCase()
                    .contains(
                      query.toLowerCase(),
                    ) ||

                driver.phone
                    .contains(query);


          }).toList();


      }


    });


  }








  void refresh(
      DriverRepository repository) {


    setState(() {


      drivers =
          List.from(
            repository.drivers,
          );


      filteredDrivers =
          List.from(
            drivers,
          );


    });


  }








  Future<void> addDriver(
    DriverRepository repository,
    Driver driver,
  ) async {


    await repository.addDriver(
      driver,
    );


    refresh(
      repository,
    );


  }








  Future<void> updateDriver(
    DriverRepository repository,
    Driver oldDriver,
    Driver newDriver,
  ) async {


    await repository.updateDriver(
      oldDriver,
      newDriver,
    );


    refresh(
      repository,
    );


  }








  Future<void> deleteDriver(
    DriverRepository repository,
    Driver driver,
  ) async {


    await repository.deleteDriver(
      driver,
    );


    refresh(
      repository,
    );


  }









  @override
  Widget build(BuildContext context) {


    final repository =
        context.watch<DriverRepository>();


    loadDrivers(
      repository,
    );





    final total =
        drivers.length;



    final available =
        drivers
            .where(
              (driver) =>
                  driver.isAvailable,
            )
            .length;



    final busy =
        total - available;







    return Scaffold(



      appBar:
          AppBar(

            title:
                const Text(
                  "Drivers",
                ),

          ),





      floatingActionButton:


          FloatingActionButton(


            onPressed: () {


              showDialog(


                context: context,


                builder: (_) {


                  return AddDriverDialog(

                    onSave:
                        (driver) async {


                      await addDriver(

                        repository,

                        driver,

                      );


                    },

                  );


                },


              );


            },



            child:
                const Icon(
                  Icons.add,
                ),


          ),







      body:

          Padding(

        padding:
            const EdgeInsets.all(16),



        child:

            Column(

          children: [



            Card(

              child:

                  Padding(

                padding:
                    const EdgeInsets.all(16),



                child:

                    Row(

                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround,


                  children: [



                    Text(
                      "Total\n$total",
                      textAlign:
                          TextAlign.center,
                    ),



                    Text(
                      "Available\n$available",
                      textAlign:
                          TextAlign.center,
                    ),



                    Text(
                      "Busy\n$busy",
                      textAlign:
                          TextAlign.center,
                    ),



                  ],


                ),


              ),


            ),





            const SizedBox(
              height: 15,
            ),





            TextField(

              onChanged:
                  searchDriver,


              decoration:
                  const InputDecoration(

                    prefixIcon:
                        Icon(
                          Icons.search,
                        ),

                    hintText:
                        "Search driver",

                    border:
                        OutlineInputBorder(),

                  ),


            ),





            const SizedBox(
              height: 15,
            ),





            Expanded(

              child:

                  ListView.builder(


                itemCount:
                    filteredDrivers.length,



                itemBuilder:
                    (context,index) {


                  final driver =
                      filteredDrivers[index];



                  return DriverCard(


                    driver:
                        driver,



                    onEdit:
                        () {


                      showDialog(


                        context:
                            context,


                        builder:
                            (_) {


                          return EditDriverDialog(

                            driver:
                                driver,


                            onSave:
                                (updated) async {


                              await updateDriver(

                                repository,

                                driver,

                                updated,

                              );


                            },


                          );


                        },


                      );


                    },





                    onDelete:
                        () async {


                      await deleteDriver(

                        repository,

                        driver,

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