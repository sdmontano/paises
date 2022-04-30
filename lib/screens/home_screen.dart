import 'package:flutter/material.dart';
import 'package:paises/models/country_model.dart';
import 'package:paises/search/search.dart';
import 'package:paises/services/country_service.dart';
import 'package:paises/widgets/cards.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Pantalla principal de la aplicacion

    PageController controller = PageController();

    CountryService service = CountryService();

    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    Future<List<CountryModel>> countries = service.getData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          alignment: Alignment.centerLeft,
          color: Colors.white,
          child: GestureDetector(
            onTap: () {
              showSearch(context: context, delegate: Search());
            },
            child: TextField(
              enableInteractiveSelection: false,
              enabled: false,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  enabledBorder: inputBorder,
                  border: inputBorder,
                  focusedBorder: inputBorder,
                  hintText: 'Search',
                  filled: true,
                  contentPadding: const EdgeInsets.all(8)),
            ),
          ),
        ),
      ),
      body: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: [
            FutureBuilder<List<CountryModel>>(
              future: countries,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final items = snapshot.data!;
                  List<CountryModel> temp = items
                      .where((element) => element.region == 'Europe')
                      .toList();
                  return ListView.builder(
                      itemCount: temp.length,
                      itemBuilder: (context, index) {
                        CountryModel country = temp[index];
                        return CardWidget(
                          tapflag: () {
                            Navigator.pushNamed(context, 'map',
                                arguments: country);
                          },
                          flag: country.flags.svg,
                          capital: country.capital,
                          country: country.name,
                          tap: () {
                            Navigator.pushNamed(context, 'detail',
                                arguments: country);
                          },
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
            FutureBuilder<List<CountryModel>>(
              future: countries,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final items = snapshot.data!;
                  List<CountryModel> temp1 = items
                      .where((element) => element.region == 'Americas')
                      .toList();
                  return ListView.builder(
                      itemCount: temp1.length,
                      itemBuilder: (context, index) {
                        CountryModel country = temp1[index];
                        return CardWidget(
                            tapflag: () {
                              Navigator.pushNamed(context, 'map',
                                  arguments: country);
                            },
                            flag: country.flags.svg,
                            capital: country.capital,
                            country: country.name,
                            tap: () {
                              Navigator.pushNamed(context, 'detail',
                                  arguments: country);
                            });
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
            FutureBuilder<List<CountryModel>>(
              future: countries,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final items = snapshot.data!;
                  List<CountryModel> temp1 = items
                      .where((element) => element.region == 'Africa')
                      .toList();
                  return ListView.builder(
                      itemCount: temp1.length,
                      itemBuilder: (context, index) {
                        CountryModel country = temp1[index];
                        return CardWidget(
                            tapflag: () {
                              Navigator.pushNamed(context, 'map',
                                  arguments: country);
                            },
                            flag: country.flags.svg,
                            capital: country.capital,
                            country: country.name,
                            tap: () {
                              Navigator.pushNamed(context, 'detail',
                                  arguments: country);
                            });
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
            FutureBuilder<List<CountryModel>>(
              future: countries,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final items = snapshot.data!;
                  List<CountryModel> temp1 = items
                      .where((element) => element.region == 'Asia')
                      .toList();
                  return ListView.builder(
                      itemCount: temp1.length,
                      itemBuilder: (context, index) {
                        CountryModel country = temp1[index];
                        return CardWidget(
                            tapflag: () {
                              Navigator.pushNamed(context, 'map',
                                  arguments: country);
                            },
                            flag: country.flags.svg,
                            capital: country.capital,
                            country: country.name,
                            tap: () {
                              Navigator.pushNamed(context, 'detail',
                                  arguments: country);
                            });
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ]),
    );
  }
}
