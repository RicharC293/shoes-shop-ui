import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/src/helpers/helpers.dart';
import 'package:shoes/src/models/zapato_model.dart';
import 'package:shoes/src/widgets/custom_widgets.dart';

class ShoeDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusLigth();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: 'zapato-1',
                child: ZapatoSizePreview(
                  fullScreen: true,
                ),
              ),
              Positioned(
                top: 40,
                child: FloatingActionButton(
                  onPressed: () {
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  child:
                      Icon(Icons.chevron_left, color: Colors.white, size: 60),
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _BuyNow(),
                  _CustomCircles(),
                  _ButtonsForShare(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ButtonsForShare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.grey[300],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                Icons.settings,
                color: Colors.grey[300],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomCircles extends StatelessWidget {
  const _CustomCircles({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 90,
                  child: _ColorsCustom(
                    color: Color(0xffC6D642),
                    index: 1,
                    nameColor: 'verde',
                  ),
                ),
                Positioned(
                  left: 60,
                  child: _ColorsCustom(
                      color: Color(0xffFFAD29),
                      index: 2,
                      nameColor: 'amarillo'),
                ),
                Positioned(
                  left: 30,
                  child: _ColorsCustom(
                      color: Color(0xff2099F1), index: 3, nameColor: 'azul'),
                ),
                _ColorsCustom(
                    color: Color(0xff364D56), index: 4, nameColor: 'negro'),
              ],
            ),
          ),
          CustomButtom(
            text: 'More related items',
            width: 170,
            height: 30,
            color: Colors.orange.withOpacity(0.4),
          ),
        ],
      ),
    );
  }
}

class _BuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        child: Row(
          children: <Widget>[
            Text(
              '\$180.0',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: CustomButtom(
                text: 'Buy Now',
                width: 110,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorsCustom extends StatelessWidget {
  final Color color;
  final int index;
  final String nameColor;

  const _ColorsCustom({
    Key key,
    @required this.color,
    this.index,
    this.nameColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = 'assets/images/${this.nameColor}.png';
        },
        child: Container(
          child: Row(
            children: <Widget>[
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: this.color,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
