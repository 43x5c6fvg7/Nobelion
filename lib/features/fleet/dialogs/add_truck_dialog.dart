import 'package:flutter/material.dart';

class AddTruckDialog extends StatefulWidget {
  const AddTruckDialog({super.key});

  @override
  State<AddTruckDialog> createState() => _AddTruckDialogState();
}

class _AddTruckDialogState extends State<AddTruckDialog> {
  final idController = TextEditingController();
  final driverController = TextEditingController();
  final statusController = TextEditingController();
  final locationController = TextEditingController();
  final cargoController = TextEditingController();

  @override
  void dispose() {
    idController.dispose();
    driverController.dispose();
    statusController.dispose();
    locationController.dispose();
    cargoController.dispose();
    super.dispose();
  }

  Widget buildField(
    String label,
    TextEditingController controller,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Truck"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildField(
              "Truck ID",
              idController,
              Icons.local_shipping,
            ),
            buildField(
              "Driver",
              driverController,
              Icons.person,
            ),
            buildField(
              "Status",
              statusController,
              Icons.info,
            ),
            buildField(
              "Location",
              locationController,
              Icons.location_on,
            ),
            buildField(
              "Cargo",
              cargoController,
              Icons.inventory,
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
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}