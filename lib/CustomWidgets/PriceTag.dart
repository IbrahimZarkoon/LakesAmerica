import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class PriceTagPainter extends CustomPainter {


  PriceTagPainter({key});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = black.withOpacity(0.45); // Set the paint color
    double cornerRadius = 4.0; // Radius for rounded corners
    double arrowWidth = 20.0; // Width of the arrow part
    double arrowHeight = size.height * 0.45; // Height of the arrow part

    Path path = Path();
    path.moveTo(0, cornerRadius); // Start from top left, adjusted for corner radius
    path.quadraticBezierTo(0, 0, cornerRadius, 0); // Top left rounded corner
    path.lineTo(size.width - arrowWidth - cornerRadius, 0); // Line to right before arrow starts, adjusted for corner radius
    path.quadraticBezierTo(size.width - arrowWidth, 0, size.width - arrowWidth, cornerRadius); // Top right corner rounding
    path.lineTo(size.width - arrowWidth, size.height / 2 - arrowHeight / 2); // Line up to arrow start vertically
    path.lineTo(size.width, size.height / 2); // Draw line to the tip of the arrow
    path.lineTo(size.width - arrowWidth, size.height / 2 + arrowHeight / 2); // Line down from arrow tip, creating the arrow
    path.lineTo(size.width - arrowWidth, size.height - cornerRadius); // Line to bottom right before rounding
    path.quadraticBezierTo(size.width - arrowWidth, size.height, size.width - arrowWidth - cornerRadius, size.height); // Bottom right corner rounding
    path.lineTo(cornerRadius, size.height); // Line to bottom left, adjusted for corner radius
    path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius); // Bottom left rounded corner
    path.close(); // Close the path to fill the shape

    canvas.drawPath(path, paint); // Draw the path
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class PriceTag extends StatelessWidget {
  final String price;

  const PriceTag({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PriceTagPainter(),
      child: Container(
        width: MediaQuery.sizeOf(context).width*0.25,
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        alignment: Alignment.centerLeft,
        child: Text(
          "\$$price",
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.sizeOf(context).height*0.017,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}