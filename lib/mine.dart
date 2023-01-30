import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Mine extends StatefulWidget {
  const Mine({super.key});

  @override
  State<Mine> createState() => _MineState();
}

class _MineState extends State<Mine> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text('Painting Test'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 100,
                  child: CustomPaint(
                    painter: FolderPainter(),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: CustomPaint(
                    painter: FolderPainter3(),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

void _tap(TapDownDetails tap, BuildContext context) {
  final x = tap.globalPosition.dx;
  final w = tap.globalPosition.dy;
  final sizeW = MediaQuery.of(context).size.width;
  final lg = MediaQuery.of(context).size.height;
  if (x > sizeW / 2) {
    if (kDebugMode) {
      print('X: $x');
    }
    return;
  } else if (w > lg * 2) {
    if (kDebugMode) {
      print('Y: $w');
    }
    return;
  }
}

class FolderPainter extends CustomPainter {
  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    Paint paint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.stroke
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Path path = Path()
      ..moveTo(20, 0)
      ..quadraticBezierTo(20, size.height, 20, size.height)
      ..lineTo(size.width, size.height)
      ..quadraticBezierTo(0, size.height, 100, size.height)
      ..lineTo(size.width, size.width);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class FolderPainter3 extends CustomPainter {
  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    Paint paint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.stroke
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final a = Offset(size.width * 1 / 6, size.height * 1 / 4);
    final b = Offset(size.width * 5 / 6, size.height * 3 / 4);
    const r = 50.0;
    final rect = Rect.fromPoints(a, b);
    final p1 = Offset(size.width * 1 / 6, size.height * 1 / 4);
    final p2 = Offset(size.width * 6 / 6, size.height * 3 / 4);

    canvas.drawCircle(a, r, paint);
    // canvas.drawLine(p1, p2, paint);
    // canvas.drawRRect(RRect.fromRectAndRadius(rect, r), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
