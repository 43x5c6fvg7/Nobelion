import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/bottom_nav_bar.dart';
import '../../repositories/truck_repository.dart';

import '../fleet/fleet_screen.dart';
import '../drivers/drivers_screen.dart';
import '../orders/orders_screen.dart';
import '../map/map_screen.dart';



class HomeScreen extends StatefulWidget {

  const HomeScreen({
    super.key,
  });


  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();

}




class _HomeScreenState
    extends State<HomeScreen> {


  int currentIndex = 0;



  final List<Widget> pages = const [

    DashboardPage(),

    FleetScreen(),

    DriversScreen(),

    OrdersScreen(),

    MapScreen(),

  ];




  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title:
            const Text(
              "Nobelion",
            ),

      ),




      body:
          pages[currentIndex],




      bottomNavigationBar:
          NobelionBottomNavBar(


            currentIndex:
                currentIndex,



            onTap:
                (index) {


              setState(() {


                currentIndex =
                    index;


              });


            },


          ),


    );


  }


}







class DashboardPage extends StatelessWidget {

  const DashboardPage({
    super.key,
  });





  Widget statCard({

    required IconData icon,

    required String title,

    required String value,

    required Color color,

  }) {


    return Card(

      elevation: 3,


      shape:
          RoundedRectangleBorder(

            borderRadius:
                BorderRadius.circular(18),

          ),



      child:

          Padding(

        padding:
            const EdgeInsets.all(18),



        child:

            Row(

          children: [



            CircleAvatar(

              radius:
                  25,

              child:
                  Icon(

                    icon,

                    color:
                        color,

                  ),

            ),



            const SizedBox(
              width: 15,
            ),




            Expanded(

              child:

                  Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,



                children: [



                  Text(

                    title,

                    style:
                        const TextStyle(

                          color:
                              Colors.grey,

                        ),

                  ),




                  const SizedBox(
                    height: 6,
                  ),





                  Text(

                    value,

                    style:
                        const TextStyle(

                          fontWeight:
                              FontWeight.bold,

                          fontSize:
                              22,

                        ),

                  ),



                ],


              ),

            ),



          ],


        ),


      ),


    );


  }





  @override
  Widget build(BuildContext context) {



    final trucks =
        context.watch<TruckRepository>().trucks;



    final total =
        trucks.length;



    final online =
        trucks.where(
          (e) => e.isOnline,
        ).length;



    final offline =
        total - online;



    final maintenance =
        trucks.where(
          (e) =>
              e.status.toLowerCase()
              ==
              "maintenance",
        ).length;




    final averageFuel = trucks.isEmpty

        ? 0.0

        :

        trucks
            .map(
              (e) => e.fuel,
            )
            .reduce(
              (a,b) => a+b,
            ) / total;




    return ListView(

      padding:
          const EdgeInsets.all(16),


      children: [



        const Text(

          "Welcome Back 👋",

          style:
              TextStyle(

                fontSize:
                    30,

                fontWeight:
                    FontWeight.bold,

              ),

        ),




        const SizedBox(
          height: 25,
        ),




        statCard(

          icon:
              Icons.local_shipping,

          title:
              "Total Trucks",

          value:
              total.toString(),

          color:
              Colors.blue,

        ),




        statCard(

          icon:
              Icons.check_circle,

          title:
              "Online Trucks",

          value:
              online.toString(),

          color:
              Colors.green,

        ),




        statCard(

          icon:
              Icons.cancel,

          title:
              "Offline Trucks",

          value:
              offline.toString(),

          color:
              Colors.red,

        ),




        statCard(

          icon:
              Icons.build,

          title:
              "Maintenance",

          value:
              maintenance.toString(),

          color:
              Colors.orange,

        ),




        const SizedBox(
          height: 25,
        ),




        LinearProgressIndicator(

          value:
              averageFuel / 100,

          minHeight:
              12,

          borderRadius:
              BorderRadius.circular(20),

        ),




        const SizedBox(
          height: 30,
        ),




        const Card(

          child:
              Padding(

            padding:
                EdgeInsets.all(18),


            child:
                ListTile(

              leading:
                  Icon(
                    Icons.memory,
                    color: Colors.blue,
                  ),


              title:
                  Text(
                    "AI Engine",
                  ),


              subtitle:
                  Text(
                    "Ready",
                  ),


            ),


          ),

        ),



      ],


    );


  }


}