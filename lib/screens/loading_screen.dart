import 'package:flutter/material.dart';
import 'package:clima3/services/location.dart';
import 'package:clima3/services/networking.dart';
import 'location_screen.dart';
import 'package:clima3/secrets/apikeys.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double lon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    lat = loc.latitude;
    lon = loc.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey");

    // var weatherData = await networkHelper.getData();
    await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
