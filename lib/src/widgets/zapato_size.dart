import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/src/models/zapato_model.dart';
import 'package:shoes/src/pages/zapato_description_page.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ZapatoSizePreview({Key key, this.fullScreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!this.fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ShoeDescriptionPage()));
        }
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: (this.fullScreen) ? 5 : 30,
          vertical: (this.fullScreen) ? 5 : 5,
        ),
        height: 400,
        decoration: BoxDecoration(
          color: Color(0xffFFCF53),
          borderRadius: (this.fullScreen)
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )
              : BorderRadius.circular(50),
        ),
        child: Column(
          children: <Widget>[
            _ShoeWithShadow(),
            if (!this.fullScreen) _ShoeSizes(),
          ],
        ),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 20,
            right: 0,
            child: _ShoeShadow(),
          ),
          Image(
            image: AssetImage(zapatoModel.assetImage),
          ),
        ],
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  const _ShoeShadow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: <BoxShadow>[
              BoxShadow(color: Color(0xffEAA12F), blurRadius: 40),
            ]),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _SizesBox(
            numero: 7,
          ),
          _SizesBox(
            numero: 7.5,
          ),
          _SizesBox(
            numero: 8,
          ),
          _SizesBox(
            numero: 8.5,
          ),
          _SizesBox(
            numero: 9,
          ),
          _SizesBox(
            numero: 9.5,
          ),
        ],
      ),
    );
  }
}

class _SizesBox extends StatelessWidget {
  final double numero;
  final bool selected;
  const _SizesBox({
    Key key,
    this.numero,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return GestureDetector(
      onTap: () {
        zapatoModel.talla = this.numero;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: (this.numero == zapatoModel.talla)
                ? Color(0xffF99605)
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
              if ((this.numero == zapatoModel.talla))
                BoxShadow(
                    color: Color(0xffF99605),
                    blurRadius: 10,
                    offset: Offset(0, 8)),
            ]),
        child: Text(
          '${this.numero.toString().replaceAll('.0', '')}',
          style: TextStyle(
              color: (this.numero == zapatoModel.talla)
                  ? Colors.white
                  : Color(0xffF1A23A),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
