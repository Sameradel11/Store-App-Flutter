import 'package:flutter/material.dart';


class RatingBarI extends StatelessWidget {
  RatingBarI({super.key, this.rate});
  double? rate;
  @override
  Widget build(BuildContext context) {
    List<Widget> starlist = [];
    int realnumber = rate!.floor();
    int fraction = ((rate! - realnumber) * 10).ceil();
    for (int i = 1; i <= 5; i++) {
      if (i <= realnumber) {
        starlist.add(Icon(
          Icons.star,
          color: Colors.amber[700],
          size: 30,
        ));
      } else if (realnumber + 1 == i) {
        starlist.add(Stack(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber[700],
              size: 30,
            ),
            ClipRect(
                clipper: Clipper(fraction: fraction),
                child: const Icon(
                  Icons.star,
                  color: Colors.grey,
                  size: 30,
                ))
          ],
        ));
      } else {
        starlist.add(const Icon(
          Icons.star,
          color: Colors.grey,
          size: 30,
        ));
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: starlist,
    );
  }
}

class Clipper extends CustomClipper<Rect> {
  Clipper({required this.fraction});
  int fraction;

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
        (size.width / 10) * fraction, 0, size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
