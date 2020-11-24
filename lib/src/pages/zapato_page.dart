import 'package:flutter/material.dart';
import 'package:shoes/src/widgets/custom_widgets.dart';
import 'package:shoes/src/helpers/helpers.dart';

class ZapatoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(
            texto: 'For you',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Hero(tag: 'zapato-1', child: ZapatoSizePreview()),
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                ],
              ),
            ),
          ),
          CartButtom(monto: 40.0),
        ],
      ),
    );
  }
}
