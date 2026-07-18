import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/driver.dart';


class DriverRepository extends ChangeNotifier {


  List<Driver> _drivers = [];



  List<Driver> get drivers =>
      List.unmodifiable(_drivers);





  Future<void> loadDrivers() async {


    final prefs =
        await SharedPreferences.getInstance();



    final data =
        prefs.getString("drivers");



    if (data != null) {


      final List decoded =
          jsonDecode(data);



      _drivers = decoded
          .map(
            (item) =>
                Driver.fromJson(item),
          )
          .toList();


    }



    notifyListeners();

  }







  Future<void> saveDrivers() async {


    final prefs =
        await SharedPreferences.getInstance();



    final data =
        jsonEncode(

          _drivers
              .map(
                (driver) =>
                    driver.toJson(),
              )
              .toList(),

        );



    await prefs.setString(
      "drivers",
      data,
    );


  }








  Future<void> addDriver(
    Driver driver,
  ) async {


    _drivers.add(driver);


    await saveDrivers();


    notifyListeners();


  }







  Future<void> updateDriver(
    Driver oldDriver,
    Driver newDriver,
  ) async {


    final index =
        _drivers.indexOf(oldDriver);



    if (index != -1) {


      _drivers[index] =
          newDriver;



      await saveDrivers();



      notifyListeners();


    }


  }







  Future<void> deleteDriver(
    Driver driver,
  ) async {


    _drivers.remove(driver);



    await saveDrivers();



    notifyListeners();


  }


}