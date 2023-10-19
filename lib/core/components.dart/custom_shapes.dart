import 'package:flutter/material.dart';
import 'package:gymshark_clone/core/components.dart/icon_components.dart';

class CustomStar extends StatelessWidget {
  const CustomStar({
    super.key,
    required this.fillAmount,
    this.size = 45,
  });

  final double fillAmount;
  final double size;

  @override
  Widget build(BuildContext context) {
    assert(fillAmount >= 0 && fillAmount <= 1);

    return ShaderMask(
      child: CustomIcon(
        Icons.star,
        size: size,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            Theme.of(context).primaryColor,
            Theme.of(context).unselectedWidgetColor,
          ],
          stops: <double>[
            fillAmount,
            fillAmount,
          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
    );
  }
}
