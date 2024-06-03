import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;
import 'cards_heading_more_widget.dart';

class GenderCard extends StatelessWidget {
  int male = 1500;
  int female = 1000;
  final maleColor = Colors.purple;
  final femaleColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.sp),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0.4.sp,
                blurRadius: 5.sp)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const HeadingAndMoreWidget(heading: "Gender"),
          SizedBox(height: 10.h),
          Center(
            child: FutureBuilder(
                future: load(),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return CustomPaint(
                      size: Size(200.sp, 200.sp),
                      painter: RingPieChartPainter(
                          maleColor: maleColor,
                          femaleColor: femaleColor,
                          male,
                          image: snapshot.data,
                          female),
                    );
                  }else{
                    return CustomPaint(
                      size: Size(200.sp, 200.sp),
                      painter: RingPieChartPainter(
                          maleColor: maleColor,
                          femaleColor: femaleColor,
                          male,
                          female),
                    );
                  }
                }),
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildGenderColumn('Male', "$male", maleColor),
              _buildGenderColumn('Female', '$female', femaleColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGenderColumn(String label, String count, Color color) {
    return Row(
      children: [
        Icon(
          Icons.circle_outlined,
          color: color,
          size: 20.sp,
        ),
        5.horizontalSpace,
        Text("$label: ",
            style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
                fontWeight: FontWeight.normal)),
        Text(count,
            style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600)),
      ],
    );
  }

  Future<ui.Image> load() async {
    final ByteData data = await rootBundle.load('assets/images/woman.png');
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    return frame.image;
  }
}

class RingPieChartPainter extends CustomPainter {
  final int male;
  final int female;
  final Color? maleColor;
  final Color? femaleColor;

  RingPieChartPainter(this.male, this.female,
      {this.maleColor, this.femaleColor, this.image});

  ui.Image? image;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10; // Width of the ring

    final radius = min(size.width / 2, size.height / 2) - paint.strokeWidth / 2;
    final center = Offset(size.width / 2, size.height / 2);
    var total = male + female;
    var malePercentage = (male / total) * 100;
    var femalePercentage = (female / total) * 100;



    // Draw the center circle with shadow
    final shadowPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.grey.withOpacity(0.5)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10); // Shadow blur
    canvas.drawCircle(
        center + Offset(5, 5), 40.sp, shadowPaint); // Offset for shadow

    final centerCirclePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;
    canvas.drawCircle(center, 40.sp, centerCirclePaint);

    // Draw the image inside the center circle
    if (image != null) {
      paintImage(
        canvas: canvas,
        image: image!,
        rect: Rect.fromCircle(center: center, radius: 20.sp),
        fit: BoxFit.cover,
      );
    }

    // Define the angles for the two segments, adjusting for the gap
    const totalAngle = 2 * pi;
    const gapAngle = 10 * pi / 180; // 10 degrees gap in radians

    // Calculate the angles for the two percentages
    final angle1 = (totalAngle - gapAngle) * (malePercentage / 100);
    final angle2 = (totalAngle - angle1 - gapAngle * 2);

    // Colors for the segments
    final colors = [maleColor ?? Colors.red, femaleColor ?? Colors.green];

    double startAngle = -pi / 2;

    for (int i = 0; i < 2; i++) {
      paint.color = colors[i];
      final segmentAngle = i == 0 ? angle1 : angle2;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        segmentAngle,
        false,
        paint,
      );

      // Calculate the midpoint angle for placing the label
      final labelAngle = startAngle + segmentAngle / 2;
      final labelRadius = radius; // Position at the center of the stroke
      final labelOffset = Offset(
        center.dx + labelRadius * cos(labelAngle),
        center.dy + labelRadius * sin(labelAngle),
      );

      final shadowPaint = Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.grey.withOpacity(0.5)
        ..maskFilter =
            const MaskFilter.blur(BlurStyle.normal, 4); // Shadow blur
      canvas.drawCircle(labelOffset + Offset(2, 2), 20, shadowPaint);

      // Draw the label circle with white background and grey shadow
      final labelPaint = Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.white; // Grey shadow
      canvas.drawCircle(labelOffset, 20, labelPaint);

      // Draw the text percentage
      final textPainter = TextPainter(
        text: TextSpan(
          text: '${i == 0 ? malePercentage : femalePercentage}%',
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.black,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        labelOffset - Offset(textPainter.width / 2, textPainter.height / 2),
      );

      startAngle += segmentAngle + gapAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
