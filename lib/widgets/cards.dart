import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWidget extends StatelessWidget {
  String flag;
  String country;
  String capital;
  VoidCallback tap;
  VoidCallback tapflag;

  CardWidget(
      {required this.flag,
      required this.capital,
      required this.country,
      required this.tap,
      required this.tapflag});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          ListTile(
              leading: GestureDetector(
                onTap: tapflag,
                child: SvgPicture.network(
                  flag,
                  width: 30.0,
                  height: 30.0,
                ),
              ),
              title: Center(child: Text(country)),
              subtitle: Center(child: Text(capital)),
              trailing: Icon(Icons.star_border),
              onTap: tap)
        ],
      ),
    );
  }
}
