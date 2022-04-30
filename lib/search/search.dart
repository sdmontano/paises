import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paises/models/country_model.dart';
import 'package:paises/services/country_service.dart';

class Search extends SearchDelegate {
  final countryServices = new CountryService();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () => query = '', icon: Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
        future: countryServices.getByname(query),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<CountryModel> countries = snapshot.data;
            return ListView(
              children: countries.map((country) {
                return ListTile(
                  title: Text(country.name),
                  leading: SvgPicture.network(
                    country.flags.svg,
                    width: 15.0,
                    height: 15.0,
                  ),
                  onTap: () {
                    close(context, null);
                    Navigator.pushNamed(context, 'detail', arguments: country);
                  },
                );
              }).toList(),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  listCountries(List<CountryModel> countries) {
    return ListView.builder(itemBuilder: (context, i) {
      CountryModel country = countries[i];
      return ListTile(
        title: Text(country.name),
      );
    });
  }
}
