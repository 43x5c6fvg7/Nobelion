import 'package:flutter/material.dart';

import '../../../models/driver.dart';



class DriverCard extends StatelessWidget {


  final Driver driver;

  final VoidCallback? onEdit;

  final VoidCallback? onDelete;



  const DriverCard({

    super.key,

    required this.driver,

    this.onEdit,

    this.onDelete,

  });







  void showDeleteDialog(
      BuildContext context) {


    showDialog(

      context: context,

      builder: (_) {


        return AlertDialog(


          title:
              const Text(
                "Delete Driver?",
              ),



          content:
              Text(
                "Delete ${driver.name}?",
              ),



          actions: [



            TextButton(

              onPressed: () {

                Navigator.pop(context);

              },

              child:
                  const Text(
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



              child:
                  const Text(
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
            bottom: 12,
          ),



      elevation:
          3,



      shape:
          RoundedRectangleBorder(

            borderRadius:
                BorderRadius.circular(
                  16,
                ),

          ),





      child:
          ListTile(



        leading:
            CircleAvatar(


          backgroundColor:

              driver.isAvailable

                  ? Colors.green

                  : Colors.orange,



          child:
              const Icon(

                Icons.person,

                color:
                    Colors.white,

              ),


        ),





        title:
            Text(

              driver.name,

              style:
                  const TextStyle(

                    fontWeight:
                        FontWeight.bold,

                  ),

            ),






        subtitle:
            Text(

              "ID: ${driver.id}\n"
              "Phone: ${driver.phone}\n"
              "${driver.isAvailable ? "Available" : "Busy"}",

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