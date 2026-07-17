import 'package:flutter/material.dart';

import '../../../models/truck.dart';

class EditTruckDialog extends StatefulWidget {
  final Truck truck;
  final Function(Truck) onSave;

  const EditTruckDialog({
    super.key,
    required this.truck,
    required this.onSave,
  });

  @override
  State<EditTruckDialog> createState() => _EditTruckDialogState();
}

class _EditTruckDialogState extends State<EditTruckDialog> {
  late TextEditingController driverController;
  late TextEditingController locationController;
  late TextEditingController cargoController;

  late String status;

  @override
  void initState() {
    super.initState();

    driverController =
        TextEditingController(text: widget.truck.driver);

    locationController =
        TextEditingController(text: widget.truck.location);

    cargoController =
        TextEditingController(text: widget.truck.cargo);

    status = widget.truck.status;
  }

  @override
  void dispose() {
    driverController.dispose();
    locationController.dispose();
    cargoController.dispose();
    super.dispose();
  }

  void saveEdit() {
    final updatedTruck = widget.truck.copyWith(
      driver: driverController.text,
      location: locationController.text,
      cargo: cargoController.text,
      status: status,
      isOnline: status == "Online",
      lastUpdate: "Updated now",
    );

    widget.onSave(updatedTruck);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Edit ${widget.truck.id}",
      ),

      content: SingleChildScrollView(
        child: Column(
          children: [

            TextField(
              controller: driverController,
              decoration: const InputDecoration(
                labelText: "Driver",
              ),
            ),

            TextField(
              controller: locationController,
              decoration: const InputDecoration(
                labelText: "Location",
              ),
            ),

            TextField(
              controller: cargoController,
              decoration: const InputDecoration(
                labelText: "Cargo",
              ),
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField<String>(
              initialValue: status,

              items: const [
                DropdownMenuItem(
                  value: "Online",
                  child: Text("Online"),
                ),

                DropdownMenuItem(
                  value: "Offline",
                  child: Text("Offline"),
                ),

                DropdownMenuItem(
                  value: "Maintenance",
                  child: Text("Maintenance"),
                ),
              ],

              onChanged: (value) {
                setState(() {
                  status = value!;
                });
              },

              decoration: const InputDecoration(
                labelText: "Status",
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
          child: const Text("Cancel"),
        ),

        ElevatedButton(
          onPressed: saveEdit,
          child: const Text("Save"),
        ),

      ],
    );
  }
}