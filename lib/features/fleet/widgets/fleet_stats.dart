import 'package:flutter/material.dart';

class FleetStats extends StatelessWidget {
  final int total;
  final int online;
  final int offline;
  final int maintenance;

  const FleetStats({
    super.key,
    required this.total,
    required this.online,
    required this.offline,
    required this.maintenance,
  });

  Widget buildItem(
    IconData icon,
    Color color,
    String title,
    int value,
  ) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 18,
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: color,
                size: 32,
              ),
              const SizedBox(height: 10),
              Text(
                "$value",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildItem(
          Icons.local_shipping,
          Colors.blue,
          "Total",
          total,
        ),
        const SizedBox(width: 10),
        buildItem(
          Icons.check_circle,
          Colors.green,
          "Online",
          online,
        ),
        const SizedBox(width: 10),
        buildItem(
          Icons.cancel,
          Colors.red,
          "Offline",
          offline,
        ),
        const SizedBox(width: 10),
        buildItem(
          Icons.build,
          Colors.orange,
          "Service",
          maintenance,
        ),
      ],
    );
  }
}