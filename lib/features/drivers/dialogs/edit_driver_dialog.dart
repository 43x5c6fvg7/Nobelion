import 'package:flutter/material.dart';

import '../../../models/driver.dart';


class EditDriverDialog extends StatefulWidget {

  final Driver driver;

  final Future<void> Function(Driver) onSave;


  const EditDriverDialog({

    super.key,

    required this.driver,

    required this.onSave,

  });



  @override
  State<EditDriverDialog> createState() =>
      _EditDriverDialogState();

}





class _EditDriverDialogState
    extends State<EditDriverDialog> {


  late TextEditingController idController;

  late TextEditingController nameController;

  late TextEditingController phoneController;


  late bool isAvailable;






  @override
  void initState() {

    super.initState();


    idController =
        TextEditingController(
          text: widget.driver.id,
        );


    nameController =
        TextEditingController(
          text: widget.driver.name,
        );


    phoneController =
        TextEditingController(
          text: widget.driver.phone,
        );


    isAvailable =
        widget.driver.isAvailable;

  }







  @override
  void dispose() {

    idController.dispose();

    nameController.dispose();

    phoneController.dispose();


    super.dispose();

  }








  Future<void> saveEdit() async {


    final updatedDriver =
        widget.driver.copyWith(


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
      updatedDriver,
    );




    if (mounted) {

      Navigator.pop(context);

    }


  }







  @override
  Widget build(BuildContext context) {


    return AlertDialog(


      title:
          Text(
            "Edit ${widget.driver.name}",
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
              saveEdit,


          child:
              const Text(
                "Save",
              ),


        ),



      ],



    );


  }



}