import 'package:flutter/material.dart';
import 'package:clima3/services/location.dart';
import 'package:clima3/services/networking.dart';
import 'location_screen.dart';
import 'package:clima3/secrets/apikeys.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric");

    // var weatherData = await networkHelper.getData();
    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
