import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class BeforAfeterIteme extends StatelessWidget {
  Widget child;
  String label;
  Alignment alignment;
  BeforAfeterIteme(
      {super.key,
      required this.child,
      required this.label,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignment,
      children: [
        ClipRRect(borderRadius: BorderRadius.circular(15), child: child),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GradientText(
            label,
            style: Theme.of(context).textTheme.headline1,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.8),
              Theme.of(context).colorScheme.primary.withOpacity(0.8)
            ],
          ),
        ),
      ],
    );
  }
}
