import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/country_model.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CountryModel country =
        ModalRoute.of(context)!.settings.arguments as CountryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          country.name,
          style: TextStyle(color: Colors.black87),
        ),
        iconTheme: IconThemeData(color: Colors.black87),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(country.latlng[0], country.latlng[1]), zoom: 11)),
    );
  }
}
