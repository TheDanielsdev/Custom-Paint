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
                  width: 120,
                  height: 100,
                  child: CustomPaint(
                    painter: FolderPainter2(),
                  ),
                ),
                SizedBox(
                  width: 120,
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

class FolderPainter2 extends CustomPainter {
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
      ..quadraticBezierTo(0, 0, 20, size.height)
      ..lineTo(size.width, size.height - 20)
      ..quadraticBezierTo(0, 0, 20, size.height)
      ..lineTo(size.width, 0);

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

    Path path = Path()
      ..moveTo(20, 0)
      ..quadraticBezierTo(20, 20, 20, 20)
      ..quadraticBezierTo(20, 20, 20, 20)
      ..lineTo(size.height, size.width)
      ..lineTo(0, size.width / 4);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
