import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final int spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.spendingAmount, this.spendingPctOfTotal);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * 0.1,
            ),
            Container(
              height: constraints.maxHeight * 0.2,
              width: constraints.maxWidth * 0.8,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.1,
            ),
          ],
        );
      },
    );
  }
}
