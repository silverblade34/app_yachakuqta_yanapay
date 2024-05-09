import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Container ExpansionCard() {
  final GlobalKey<ExpansionTileCardState> cardX = GlobalKey();
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
  );
  return Container(
    padding: const EdgeInsets.only(bottom: 10),
    child: ExpansionTileCard(
      key: cardX,
      leading: const CircleAvatar(
        backgroundColor: TERTIARY,
        child: Icon(
          Icons.category_outlined,
          color: WHITE,
        ),
      ),
      title: const Text(
        'Adición en números enteros',
        style: TextStyle(fontSize: 15),
      ),
      subtitle: const Text('4 bloques'),
      children: <Widget>[
        const Divider(
          thickness: 1.0,
          height: 1.0,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Tema 1"),
                    trailing:
                        const Icon(Icons.play_arrow), // Icono de reproducción
                    onTap: () {
                      print("-------------------------1");
                    },
                  ),
                  ListTile(
                    title: const Text("Tema 1"),
                    trailing:
                        const Icon(Icons.play_arrow), // Icono de reproducción
                    onTap: () {
                      print("-------------------------1");
                    },
                  )
                ],
              )),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          buttonHeight: 52.0,
          buttonMinWidth: 90.0,
          children: <Widget>[
            TextButton(
              style: flatButtonStyle,
              onPressed: () {
                cardX.currentState?.expand();
              },
              child: const Column(
                children: <Widget>[
                  Icon(Icons.flag_outlined),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Text('Iniciar'),
                ],
              ),
            ),
            TextButton(
              style: flatButtonStyle,
              onPressed: () {
                cardX.currentState?.collapse();
              },
              child: const Column(
                children: <Widget>[
                  Icon(Icons.video_library_outlined),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Text('Videos'),
                ],
              ),
            ),
            TextButton(
              style: flatButtonStyle,
              onPressed: () {
                cardX.currentState?.toggleExpansion();
              },
              child: const Column(
                children: <Widget>[
                  Icon(Icons.smart_toy_outlined),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Text('Reto'),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
