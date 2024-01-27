import 'package:aiesec_core/controllers/custom_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends GetView<CustomCardController> {
  final String title;
  final int id;
  const CustomCard({super.key, required this.id, required this.title});

  @override
  Widget build(BuildContext context) {
    Get.put(CustomCardController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(90, 3, 127, 243),
                blurRadius: 2,
                spreadRadius: 1.8,
              )
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CustomPaint(
            foregroundPainter: PathPainter(),
            child: ColoredBox(
              color: const Color(0xFF037ef3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(title, style: controller.titleTextStyle),
                          Text(
                            'January',
                            style: controller.monthTextStyle,
                          ),
                        ]),
                  ),
                  Flexible(
                    child: SizedBox(
                      child: Text('${controller.random.nextInt(4) + 1}',
                          style: controller.progressTextStyle),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.8000000);
    path_0.lineTo(size.width * 0.02381944, size.height * 0.7834375);
    path_0.cubicTo(
        size.width * 0.04763889,
        size.height * 0.7656250,
        size.width * 0.09513889,
        size.height * 0.7343750,
        size.width * 0.1430556,
        size.height * 0.6665625);
    path_0.cubicTo(
        size.width * 0.1904861,
        size.height * 0.6000000,
        size.width * 0.2381944,
        size.height * 0.5000000,
        size.width * 0.2854167,
        size.height * 0.4165625);
    path_0.cubicTo(
        size.width * 0.3333333,
        size.height * 0.3343750,
        size.width * 0.3812500,
        size.height * 0.2656250,
        size.width * 0.4284722,
        size.height * 0.2834375);
    path_0.cubicTo(
        size.width * 0.4761806,
        size.height * 0.3000000,
        size.width * 0.5236111,
        size.height * 0.4000000,
        size.width * 0.5715278,
        size.height * 0.4834375);
    path_0.cubicTo(
        size.width * 0.6190278,
        size.height * 0.5656250,
        size.width * 0.6666667,
        size.height * 0.6343750,
        size.width * 0.7145833,
        size.height * 0.6334375);
    path_0.cubicTo(
        size.width * 0.7618750,
        size.height * 0.6343750,
        size.width * 0.8097222,
        size.height * 0.5656250,
        size.width * 0.8569444,
        size.height * 0.4500000);
    path_0.cubicTo(
        size.width * 0.9047917,
        size.height * 0.3343750,
        size.width * 0.9520833,
        size.height * 0.1656250,
        size.width * 0.9763889,
        size.height * 0.08343750);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * 0.9761806, size.height);
    path_0.cubicTo(size.width * 0.9523611, size.height, size.width * 0.9048611,
        size.height, size.width * 0.8569444, size.height);
    path_0.cubicTo(size.width * 0.8095139, size.height, size.width * 0.7618056,
        size.height, size.width * 0.7145833, size.height);
    path_0.cubicTo(size.width * 0.6666667, size.height, size.width * 0.6187500,
        size.height, size.width * 0.5715278, size.height);
    path_0.cubicTo(size.width * 0.5238194, size.height, size.width * 0.4763889,
        size.height, size.width * 0.4284722, size.height);
    path_0.cubicTo(size.width * 0.3809722, size.height, size.width * 0.3333333,
        size.height, size.width * 0.2854167, size.height);
    path_0.cubicTo(size.width * 0.2381250, size.height, size.width * 0.1902778,
        size.height, size.width * 0.1430556, size.height);
    path_0.cubicTo(
        size.width * 0.09520833,
        size.height,
        size.width * 0.04791667,
        size.height,
        size.width * 0.02361111,
        size.height);
    path_0.lineTo(0, size.height);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white12;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
