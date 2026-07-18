import 'package:flutter/material.dart';

import '../../models/truck.dart';


class TruckDetailScreen extends StatelessWidget {

  final Truck truck;


  const TruckDetailScreen({
    super.key,
    required this.truck,
  });



  Widget infoCard(
    String title,
    String value,
    IconData icon,
  ) {

    return Card(

      elevation: 2,

      margin:
          const EdgeInsets.only(
            bottom: 12,
          ),


      child: ListTile(

        leading: Icon(
          icon,
          color: Colors.blue,
        ),


        title: Text(
          title,
          style:
              const TextStyle(
                color: Colors.grey,
              ),
        ),


        subtitle: Text(

          value,

          style:
              const TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.bold,
              ),

        ),

      ),

    );

  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title:
            Text(truck.id),

      ),





      body:

          SingleChildScrollView(

        padding:
            const EdgeInsets.all(20),



        child:

            Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,



          children: [





            Center(

              child:
                  CircleAvatar(


                radius: 45,


                backgroundColor:

                    truck.isOnline

                        ? Colors.green

                        : Colors.red,



                child:
                    const Icon(

                  Icons.local_shipping,

                  size: 45,

                  color:
                      Colors.white,

                ),


              ),

            ),





            const SizedBox(
              height: 25,
            ),





            Center(

              child:

                  Text(

                truck.id,


                style:
                    const TextStyle(

                      fontSize: 28,

                      fontWeight:
                          FontWeight.bold,

                    ),


              ),

            ),





            const SizedBox(
              height: 25,
            ),





            infoCard(

              "Driver",

              truck.driver,

              Icons.person,

            ),




            infoCard(

              "Location",

              truck.location,

              Icons.location_on,

            ),




            infoCard(

              "Cargo",

              truck.cargo,

              Icons.inventory,

            ),




            infoCard(

              "Capacity",

              truck.capacity,

              Icons.scale,

            ),




            infoCard(

              "Fuel",

              "${truck.fuel}%",

              Icons.local_gas_station,

            ),




            infoCard(

              "Last Update",

              truck.lastUpdate,

              Icons.update,

            ),





            const SizedBox(
              height: 15,
            ),





            Container(

              width:
                  double.infinity,


              padding:
                  const EdgeInsets.all(18),



              decoration:

                  BoxDecoration(

                color:

                    truck.isOnline

                        ? Colors.green.shade100

                        : Colors.red.shade100,



                borderRadius:
                    BorderRadius.circular(15),


              ),




              child:

                  Text(


                truck.isOnline

                    ? "Truck is Online"

                    : "Truck is Offline",



                textAlign:
                    TextAlign.center,



                style:

                    const TextStyle(

                  fontWeight:
                      FontWeight.bold,


                  fontSize:
                      18,

                ),


              ),


            ),



          ],


        ),


      ),


    );

  }

}