import 'package:flutter/material.dart';

import '../../../models/truck.dart';
import '../truck_detail_screen.dart';


class TruckCard extends StatelessWidget {

  final Truck truck;

  final VoidCallback? onEdit;

  final VoidCallback? onDelete;



  const TruckCard({
    super.key,
    required this.truck,
    this.onEdit,
    this.onDelete,
  });



  void showDeleteDialog(
    BuildContext context,
  ) {

    showDialog(

      context: context,

      builder: (_) {

        return AlertDialog(

          title: const Text(
            "Delete Truck?",
          ),


          content: Text(
            "Are you sure you want to delete ${truck.id}?",
          ),



          actions: [


            TextButton(

              onPressed: () {

                Navigator.pop(context);

              },

              child: const Text(
                "Cancel",
              ),

            ),



            ElevatedButton(

              style:
                  ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.red,
                  ),


              onPressed: () {

                Navigator.pop(context);

                onDelete?.call();

              },


              child: const Text(
                "Delete",
              ),

            ),


          ],

        );

      },

    );

  }





  @override
  Widget build(BuildContext context) {


    return Card(

      margin:
          const EdgeInsets.only(
            bottom: 15,
          ),


      elevation: 3,


      shape:
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(16),
          ),




      child: ListTile(



        onTap: () {


          Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) =>
                  TruckDetailScreen(
                    truck: truck,
                  ),

            ),

          );


        },





        leading: CircleAvatar(


          backgroundColor:

              truck.isOnline

                  ? Colors.green

                  : Colors.red,



          child: const Icon(

            Icons.local_shipping,

            color:
                Colors.white,

          ),


        ),





        title: Text(

          truck.id,

          style:
              const TextStyle(

                fontWeight:
                    FontWeight.bold,

              ),

        ),





        subtitle: Text(

          "Driver: ${truck.driver}\n"
          "Status: ${truck.status}\n"
          "Cargo: ${truck.cargo}",

        ),





        trailing:

            PopupMenuButton<String>(



          onSelected:
              (value) {


            if (value == "edit") {

              onEdit?.call();

            }



            if (value == "delete") {

              showDeleteDialog(
                context,
              );

            }


          },



          itemBuilder:
              (context) => [



            const PopupMenuItem(

              value:
                  "edit",


              child:
                  Row(

                    children: [

                      Icon(
                        Icons.edit,
                      ),


                      SizedBox(
                        width: 10,
                      ),


                      Text(
                        "Edit",
                      ),

                    ],

                  ),

            ),





            const PopupMenuItem(

              value:
                  "delete",


              child:
                  Row(

                    children: [


                      Icon(
                        Icons.delete,
                      ),



                      SizedBox(
                        width: 10,
                      ),



                      Text(
                        "Delete",
                      ),


                    ],

                  ),

            ),



          ],


        ),


      ),


    );

  }

}