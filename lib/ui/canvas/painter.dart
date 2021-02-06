import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  Painter({@required this.offsetList});
  List<Offset> offsetList;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    final path = Path()..addPolygon(offsetList, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(Painter oldDelegate) {
    return true;
  }
}
