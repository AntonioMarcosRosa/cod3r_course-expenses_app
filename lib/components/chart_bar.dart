import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String? label;
  final double? value;
  final double? percentage;

  const ChartBar({this.label, this.value, this.percentage, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
          child: FittedBox(
            child: Text(
              value!.toStringAsFixed(2),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 60,
          width: 8,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    color: const Color.fromRGBO(220, 200, 220, 1),
                    borderRadius: BorderRadius.circular(4)),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(4)),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(label!),
      ],
    );
  }
}