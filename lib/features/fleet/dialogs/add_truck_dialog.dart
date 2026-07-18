import 'package:flutter/material.dart';

import '../../../models/truck.dart';

class AddTruckDialog extends StatefulWidget {

  final Future<void> Function(Truck) onSave;


  const AddTruckDialog({
    super.key,
    required this.onSave,
  });


  @override
  State<AddTruckDialog> createState() =>
      _AddTruckDialogState();

}



class _AddTruckDialogState
    extends State<AddTruckDialog> {


  final idController =
      TextEditingController();


  final driverController =
      TextEditingController();


  final locationController =
      TextEditingController();


  final cargoController =
      TextEditingController();



  String status = "Online";



  @override
  void dispose() {

    idController.dispose();
    driverController.dispose();
    locationController.dispose();
    cargoController.dispose();

    super.dispose();

  }





  Future<void> saveTruck() async {


    final truck = Truck(

      id: idController.text.trim(),

      driver: driverController.text.trim(),

      status: status,

      isOnline:
          status == "Online",

      location:
          locationController.text.trim(),

      capacity:
          "16 Tons",

      cargo:
          cargoController.text.trim(),

      fuel:
          100,

      lastUpdate:
          "Just now",

    );



    await widget.onSave(truck);



    if (mounted) {

      Navigator.pop(context);

    }

  }






  @override
  Widget build(BuildContext context) {

    return AlertDialog(

      title:
          const Text("Add Truck"),



      content:
          SingleChildScrollView(

        child: Column(

          children: [


            TextField(

              controller: idController,

              decoration:
                  const InputDecoration(
                    labelText: "Truck ID",
                  ),

            ),



            TextField(

              controller: driverController,

              decoration:
                  const InputDecoration(
                    labelText: "Driver",
                  ),

            ),



            TextField(

              controller: locationController,

              decoration:
                  const InputDecoration(
                    labelText: "Location",
                  ),

            ),



            TextField(

              controller: cargoController,

              decoration:
                  const InputDecoration(
                    labelText: "Cargo",
                  ),

            ),



            const SizedBox(height: 15),




            DropdownButtonFormField<String>(

              initialValue: status,


              items: const [


                DropdownMenuItem(

                  value: "Online",

                  child:
                      Text("Online"),

                ),



                DropdownMenuItem(

                  value: "Offline",

                  child:
                      Text("Offline"),

                ),



                DropdownMenuItem(

                  value: "Maintenance",

                  child:
                      Text("Maintenance"),

                ),


              ],



              onChanged: (value) {

                setState(() {

                  status = value!;

                });

              },


              decoration:
                  const InputDecoration(

                    labelText:
                        "Status",

                  ),

            ),


          ],

        ),

      ),



      actions: [


        TextButton(

          onPressed: () {

            Navigator.pop(context);

          },

          child:
              const Text("Cancel"),

        ),




        ElevatedButton(

          onPressed: saveTruck,

          child:
              const Text("Save"),

        ),


      ],


    );

  }

}