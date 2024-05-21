import 'package:app_yachakuqta_yanapay/app/controllers/syllabus_student_controller.dart';
import 'package:app_yachakuqta_yanapay/app/data/dtos/syllabus_student/syllabus_blocks_dto.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Container ExpansionCard(
    {required DatumSyllabusBlock item,
    required SyllabusStudentController controller}) {
  final GlobalKey<ExpansionTileCardState> cardX = GlobalKey();
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
  );
  List<BlockPageResume> blockPages = item.blockPages;
  double heightDynamic = blockPages.length * 80;
  return Container(
    padding: const EdgeInsets.only(bottom: 10),
    child: ExpansionTileCard(
      key: cardX,
      leading: const CircleAvatar(
        backgroundColor: TERTIARY,
        child: Icon(
          Icons.lan_outlined,
          color: WHITE,
        ),
      ),
      title: Text(
        item.title,
        style: const TextStyle(
          fontSize: 15.5,
        ),
      ),
      subtitle: Text(
        "${blockPages.length.toString()} Bloque",
        style: const TextStyle(color: GREY_LIGHT),
      ),
      children: <Widget>[
        const Divider(
          thickness: 1.0,
          height: 1.0,
        ),
        SizedBox(
          height: heightDynamic,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: ListView.builder(
                itemCount: blockPages.length,
                itemBuilder: (context, index) {
                  final itemBlockPage = blockPages[index];
                  return ListTile(
                    title: Text(
                      itemBlockPage.title,
                      style: const TextStyle(fontSize: 15, color: GREY_LIGHT),
                    ),
                    trailing: const Icon(Icons.play_arrow),
                    onTap: () {
                      controller.goToBlockPage(itemBlockPage.id,item );
                    },
                  );
                },
              ),
            ),
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          buttonHeight: 52.0,
          buttonMinWidth: 90.0,
          children: <Widget>[
            TextButton(
              style: flatButtonStyle,
              onPressed: () {
                controller.goToBlockPage( item.blockPages[0].id,item);
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
                print("FORO");
              },
              child: const Column(
                children: <Widget>[
                  Icon(Icons.live_help_outlined),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Text('Foro'),
                ],
              ),
            ),
            TextButton(
              style: flatButtonStyle,
              onPressed: () {
               controller.showDialogStartExam(item);
              },
              child: const Column(
                children: <Widget>[
                  Icon(Icons.smart_toy_outlined),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Text('Desafio'),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
