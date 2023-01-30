import 'package:custom_paint_practice/mine.dart';
import 'package:custom_paint_practice/model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(useMaterial3: true),
      home: const Mine()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final data = GetModel.modelFnc();
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('DemoApp'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GridView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    childAspectRatio: 3 / 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 0),
                itemBuilder: (_, i) {
                  return SizedBox(
                    width: 120,
                    height: 100,
                    child: CustomPaint(
                      painter: FolderPainter(
                        color: data[i].color,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FocusableActionDetector(
                              onShowHoverHighlight: (v) {
                                setState(() {
                                  _hover = v;
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: _hover ? Colors.red : Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: data[i].icon,
                                  )),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              data[i].titl,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            Text(
                              data[i].desc,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class FolderPainter extends CustomPainter {
  Color color;
  FolderPainter({required this.color});
  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    double top = 20.0;
    double border1 = 20.0;
    double border2 = 6.0;
    double dst1 = size.width * .62;
    double dst2 = size.width * .62 - 19;

    Path path = Path()
      ..moveTo(border1, 0)
      ..quadraticBezierTo(0, 0, 0, border1)
      ..lineTo(0, size.height - border1)
      ..quadraticBezierTo(0, size.height, border1, size.height)
      ..lineTo(size.width - border1, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - border1)
      ..lineTo(size.width, top + border1)
      ..quadraticBezierTo(size.width, top, size.width - border1, top)
      ..lineTo(dst1 + border2, top)
      ..quadraticBezierTo(dst1, top, dst1 - border2, top - border2)
      ..lineTo(dst2 + border2, 0 + border2)
      ..quadraticBezierTo(dst2, 0, dst2 - border2, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
