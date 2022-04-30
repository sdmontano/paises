import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paises/models/country_model.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final CountryModel country =
        ModalRoute.of(context)!.settings.arguments as CountryModel;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Informacion Detallada',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  country.name,
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(width: 10),
                Icon(Icons.star_border)
              ],
            ),
            SizedBox(height: 30),
            Container(
              child: SvgPicture.network(
                country.flags.svg,
                height: 100.0,
                width: 100.0,
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  'Region:',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(width: 20),
                Text(
                  country.region,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Population:',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(width: 20),
                Text(
                  "${country.population}",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Capital:',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(width: 20),
                Text(
                  country.capital,
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
