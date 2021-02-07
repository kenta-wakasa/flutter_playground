import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  Painter({@required this.offsetList});
  List<Offset> offsetList;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.25)
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset.zero, offsetList.first.dy.abs(), paint);

    paint.color = Colors.orange;

    final path = Path()..addPolygon(offsetList, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(Painter oldDelegate) {
    return true;
  }
}
