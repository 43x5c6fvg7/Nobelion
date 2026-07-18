import 'package:flutter/material.dart';

import '../../../models/driver.dart';


class AddDriverDialog extends StatefulWidget {

  final Future<void> Function(Driver) onSave;


  const AddDriverDialog({

    super.key,

    required this.onSave,

  });



  @override
  State<AddDriverDialog> createState() =>
      _AddDriverDialogState();

}





class _AddDriverDialogState
    extends State<AddDriverDialog> {


  final idController =
      TextEditingController();


  final nameController =
      TextEditingController();


  final phoneController =
      TextEditingController();



  bool isAvailable = true;





  @override
  void dispose() {

    idController.dispose();

    nameController.dispose();

    phoneController.dispose();


    super.dispose();

  }





  Future<void> saveDriver() async {


    final driver = Driver(

      id:
          idController.text.trim(),


      name:
          nameController.text.trim(),


      phone:
          phoneController.text.trim(),


      isAvailable:
          isAvailable,


    );



    await widget.onSave(
      driver,
    );



    if (mounted) {

      Navigator.pop(context);

    }

  }








  @override
  Widget build(BuildContext context) {


    return AlertDialog(


      title:
          const Text(
            "Add Driver",
          ),




      content:

          SingleChildScrollView(

        child:

            Column(

          children: [



            TextField(

              controller:
                  idController,


              decoration:
                  const InputDecoration(

                    labelText:
                        "Driver ID",

                  ),


            ),





            TextField(

              controller:
                  nameController,


              decoration:
                  const InputDecoration(

                    labelText:
                        "Name",

                  ),


            ),





            TextField(

              controller:
                  phoneController,


              keyboardType:
                  TextInputType.phone,


              decoration:
                  const InputDecoration(

                    labelText:
                        "Phone",

                  ),


            ),





            const SizedBox(
              height: 15,
            ),





            SwitchListTile(

              title:
                  const Text(
                    "Available",
                  ),


              value:
                  isAvailable,


              onChanged:
                  (value) {


                setState(() {

                  isAvailable =
                      value;

                });


              },


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
              const Text(
                "Cancel",
              ),


        ),





        ElevatedButton(

          onPressed:
              saveDriver,


          child:
              const Text(
                "Save",
              ),


        ),



      ],



    );


  }



}