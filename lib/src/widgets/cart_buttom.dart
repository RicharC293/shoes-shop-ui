import 'package:flutter/material.dart';
import 'package:shoes/src/widgets/custom_widgets.dart';

class CartButtom extends StatelessWidget {
  final double monto;

  const CartButtom({Key key, this.monto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 30,
            ),
            Text(
              '\$${this.monto}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            CustomButtom(text: 'Add to cart'),
            SizedBox(
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}
