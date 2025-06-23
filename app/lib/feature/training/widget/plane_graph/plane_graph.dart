// ignore_for_file: lines_longer_than_80_chars
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../app/extension/duration_to_hhmmss_string.dart';

class PlaneGraph extends StatefulWidget {
  PlaneGraph({
    required this.xValues,
    required this.yValues,
    required this.xLabel,
    required this.yLabel,
    required double width,
    required double height,
    this.xValueAsDuration = false,
    this.yValueAsDuration = false,
    this.backgroundColor = Colors.white,
    this.dotColor = Colors.white,
    this.dotBorderColor = Colors.black,
    this.gridColor = Colors.red,
    this.gridLineWidth = 1,
    this.lineColor = Colors.black,
    this.yScaleOffset = 150,
    this.yScaleValuesStyle,
    this.scaleLineColor = Colors.black,
    this.scaleLineWidth = 1,
    super.key,
  })  : assert(
          xValues.isNotEmpty && yValues.isNotEmpty,
          'xValues and yValues lists must be not empty.',
        ),
        assert(
          xValues.length == yValues.length,
          "Length of xValues (${xValues.length}) doesn't match length of yValues list (${yValues.length})",
        ),
        _canvasWidth = width,
        _canvasHeight = height;

  final List<String> xValues;
  final List<int> yValues;

  final bool xValueAsDuration;
  final bool yValueAsDuration;

  final String xLabel;
  final String yLabel;

  final double _canvasWidth;
  final double _canvasHeight;

  final Color dotColor;
  final Color dotBorderColor;

  final Color backgroundColor;

  final Color gridColor;
  final double gridLineWidth;

  final Color lineColor;

  final double yScaleOffset;

  final TextStyle? yScaleValuesStyle;

  final Color scaleLineColor;
  final double scaleLineWidth;

  @override
  State<PlaneGraph> createState() => _PlaneGraphState();
}

class _PlaneGraphState extends State<PlaneGraph>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: widget._canvasWidth,
        height: widget._canvasHeight,
        child: CustomPaint(
          painter: _PlaneGraphPainter(
            xValues: widget.xValues,
            yValues: widget.yValues,
            xValueAsDuration: widget.xValueAsDuration,
            yValueAsDuration: widget.yValueAsDuration,
            xLabel: widget.xLabel,
            yLabel: widget.yLabel,
            animationController: _animationController,
            backgroundColor: widget.backgroundColor,
            dotColor: widget.dotColor,
            dotBorderColor: widget.dotBorderColor,
            yScaleOffset: widget.yScaleOffset,
            yScaleValuesStyle: widget.yScaleValuesStyle,
            scaleLineColor: widget.scaleLineColor,
            scaleLineWidth: widget.scaleLineWidth,
            gridColor: widget.gridColor,
            gridLineWidth: widget.gridLineWidth,
            lineColor: widget.lineColor,
            width: widget._canvasWidth,
            height: widget._canvasHeight,
          ),
        ),
      );
}

class _PlaneGraphPainter extends CustomPainter {
  _PlaneGraphPainter({
    required this.xValues,
    required this.yValues,
    required this.xValueAsDuration,
    required this.yValueAsDuration,
    required this.xLabel,
    required this.yLabel,
    required this.animationController,
    required this.backgroundColor,
    required this.dotColor,
    required this.dotBorderColor,
    required this.gridColor,
    required this.gridLineWidth,
    required this.lineColor,
    required this.yScaleOffset,
    required this.yScaleValuesStyle,
    required this.scaleLineColor,
    required this.scaleLineWidth,
    required double width,
    required double height,
  }) : super(repaint: animationController) {
    _canvasWidth = width;
    _canvasHeight = height;

    _dotsCoordinates = _computeDotsCoordinates();
  }

  final List<String> xValues;
  final List<int> yValues;

  final bool xValueAsDuration;
  final bool yValueAsDuration;

  final String xLabel;
  final String yLabel;

  final AnimationController animationController;

  final Color backgroundColor;
  final Color gridColor;
  final double gridLineWidth;

  final Color dotColor;
  final Color dotBorderColor;

  final Color lineColor;

  final Color scaleLineColor;
  final double scaleLineWidth;

  final double yScaleOffset;

  final TextStyle? yScaleValuesStyle;

  late final double _canvasWidth;
  late final double _canvasHeight;

  late final List<Offset> _dotsCoordinates;

  List<Offset> _computeDotsCoordinates() {
    // This value must be not 0.
    final yMaxValue = yValues.reduce(max) == 0 ? 1 : yValues.reduce(max);

    return List.generate(
      xValues.length,
      (index) => Offset(
        _canvasWidth / xValues.length * index,
        (_canvasHeight - yValues[index] / yMaxValue * _canvasHeight * 0.8) -
            _canvasHeight * 0.1,
      ),
    )..replaceRange(0, 1, [
        Offset(
          yScaleOffset,
          (_canvasHeight - yValues[0] / yMaxValue * _canvasHeight * 0.8) -
              _canvasHeight * 0.1,
        ),
      ]);

    // return List.generate(
    //   xValues.length,
    //       (index) => Offset(
    //     _canvasWidth / xValues.length * 0.9 * index + _canvasWidth * 0.1,
    //     (_canvasHeight -
    //         yValues[index] / yMaxValue * _canvasHeight * 0.8) -
    //         _canvasHeight * 0.1,
    //   ),
    // )..replaceRange(0, 1, [
    //   Offset(
    //     yScaleOffset,
    //     (_canvasHeight -
    //         yValues[0] / yMaxValue * _canvasHeight * 0.8) -
    //         _canvasHeight * 0.1,
    //   ),
    // ]);
  }

  @override
  void paint(Canvas canvas, Size size) {
    _drawBackground(canvas);
    //_drawGrid(canvas, size);
    _drawScales(canvas);
    _drawXScaleValues(canvas);
    _drawYScaleValues(canvas);
    _drawLines(canvas);
    _drawDots(canvas);
    _drawDotsInfo(canvas);

    TextPainter(
      text: TextSpan(
        text: xLabel,
        style: const TextStyle(fontSize: 20),
      ),
      textDirection: TextDirection.rtl,
    )
      ..layout()
      ..paint(canvas, Offset(yScaleOffset - 100, _canvasHeight * 0.925));

    TextPainter(
      text: TextSpan(
        text: yLabel,
        style: const TextStyle(fontSize: 20),
      ),
      textDirection: TextDirection.rtl,
    )
      ..layout()
      ..paint(canvas, Offset(yScaleOffset - 100, _canvasHeight * 0.85));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void _drawXScaleValues(Canvas canvas) {
    for (var i = 0; i < _dotsCoordinates.length; i++) {
      final textColor = i.isEven ? Colors.black : Colors.white;

      TextPainter(
        maxLines: 3,
        text: TextSpan(
          text: xValues[i],
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        textDirection: TextDirection.rtl,
      )
        ..layout()
        ..paint(
          canvas,
          Offset(
            _dotsCoordinates[i].dx - 15,
            _canvasHeight * 0.9,
          ),
        );
    }
  }

  void _drawYScaleValues(Canvas canvas) {
    const fontSize = 20.0;
    final text = yValueAsDuration
        ? Duration(seconds: yValues.reduce(max)).toHHMMSS()
        : yValues.reduce(max).toString();

    TextPainter(
      maxLines: 3,
      text: TextSpan(
        text: text,
        style: yScaleValuesStyle,
      ),
      textDirection: TextDirection.rtl,
    )
      ..layout()
      ..paint(
        canvas,
        Offset(
          yScaleOffset - fontSize * text.length * 0.7,
          _canvasHeight * 0.1 - fontSize * 0.5,
        ),
      );
  }

  void _drawDotsInfo(Canvas canvas) {
    for (var i = 0; i < _dotsCoordinates.length; i++) {
      final text = yValueAsDuration
          ? Duration(seconds: yValues[i]).toHHMMSS()
          : yValues[i].toString();

      TextPainter(
        text: TextSpan(
          text: text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        textDirection: TextDirection.rtl,
      )
        ..layout()
        ..paint(
          canvas,
          Offset(
            _dotsCoordinates[i].dx,
            _dotsCoordinates[i].dy, //+ textYAxisOffset,
          ),
        );
    }
  }

  void _drawScales(Canvas canvas) {
    final scalePaint = Paint()
      ..color = scaleLineColor
      ..strokeWidth = scaleLineWidth
      ..style = PaintingStyle.stroke;

    // Draw vertical scale
    canvas
      ..drawLine(
        // Offset(_canvasWidth * 0.1, 0),
        // Offset(_canvasWidth * 0.1, _canvasHeight),
        Offset(yScaleOffset, 0),
        Offset(yScaleOffset, _canvasHeight),
        scalePaint,
      )

      // Draw horizontal scale
      ..drawLine(
        Offset(0, _canvasHeight * 0.9),
        Offset(_canvasWidth, _canvasHeight * 0.9),
        scalePaint,
      );

    // Draw marks on the vertical scale
    for (var i = 1; i < 10; i++) {
      canvas.drawLine(
        Offset(yScaleOffset - 5, _canvasHeight * 0.1 * i),
        Offset(yScaleOffset + 5, _canvasHeight * 0.1 * i),
        scalePaint,
      );
    }

    // Draw marks on the horizontal scale
    for (var i = 0; i < _dotsCoordinates.length; i++) {
      canvas.drawLine(
        Offset(_dotsCoordinates[i].dx, _canvasHeight * 0.9 + 5),
        Offset(_dotsCoordinates[i].dx, _canvasHeight * 0.9 - 5),
        scalePaint,
      );
    }
  }

  void _drawBackground(Canvas canvas) {
    final backgroundPaint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(_canvasWidth / 2, _canvasHeight / 2),
        Offset(_canvasWidth / 2, _canvasHeight),
        [
          backgroundColor.withValues(alpha: 0.5),
          backgroundColor.withValues(alpha: 0.2),
        ],
        [0, 1],
        TileMode.mirror,
      );

    canvas
      ..clipRect(Offset.zero & Size(_canvasWidth, _canvasHeight))
      ..drawPaint(backgroundPaint);
  }

  void _drawGrid(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCenter(
      center: center,
      width: _canvasWidth,
      height: _canvasHeight,
    );

    final chBorder = Paint()
      ..color = gridColor
      ..strokeWidth = gridLineWidth
      ..style = PaintingStyle.stroke;

    // draw vertical lines
    final colW = _canvasWidth * 0.1;
    for (var i = 0; i <= _canvasWidth; i++) {
      final p1 = Offset(rect.left + colW * i, rect.bottom);
      final p2 = Offset(rect.left + colW * i, rect.top);
      canvas.drawLine(p1, p2, chBorder);
    }

    // draw horizontal lines
    final yD = _canvasHeight * 0.1;

    for (var i = 0; i <= _canvasHeight * 0.1; i++) {
      final p1 = Offset(rect.left, rect.bottom - yD * i);
      final p2 = Offset(rect.right, rect.bottom - yD * i);
      canvas.drawLine(p1, p2, chBorder);
    }
  }

  void _drawDots(Canvas canvas) {
    for (final dotCoordinate in _dotsCoordinates) {
      canvas
        ..drawCircle(
          (Offset(dotCoordinate.dx, dotCoordinate.dy)),
          10,
          Paint()..color = dotBorderColor,
        )
        ..drawCircle(
          (Offset(dotCoordinate.dx, dotCoordinate.dy)),
          8,
          Paint()..color = dotColor,
        );
    }
  }

  void _drawLines(Canvas canvas) {
    if (_dotsCoordinates.length < 2) {
      return;
    }

    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final path = Path();

    for (var i = 0; i <= _dotsCoordinates.length - 1; i++) {
      if (i == 0) {
        path
          ..moveTo(_dotsCoordinates[0].dx, _dotsCoordinates[0].dy)
          ..lineTo(_dotsCoordinates[1].dx, _dotsCoordinates[1].dy);
      }

      path.lineTo(_dotsCoordinates[i].dx, _dotsCoordinates[i].dy);
    }

    canvas.drawPath(path, linePaint);
  }
}
