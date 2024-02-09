import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lakesamerica/Constants/colors.dart';

class PriceRangeFilter extends StatefulWidget {
  @override
  _PriceRangeFilterState createState() => _PriceRangeFilterState();
}

class _PriceRangeFilterState extends State<PriceRangeFilter> {
  RangeValues _selectedRange = RangeValues(0, 1000);
  double _minPrice = 0.0;
  double _maxPrice = 1000.0;

  double _top = 0;

  @override
  void initState() {
    _selectedRange = RangeValues(_minPrice, _maxPrice);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, -10),
                blurRadius: 15,
                spreadRadius: 1,
              )
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Text(
                "What's your price range?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '£${_selectedRange.start.toStringAsFixed(2)} - £${_selectedRange.end.toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              RangeSlider(
                activeColor: primaryColor,
                inactiveColor: Color(0xffada8a8),
                values: _selectedRange,
                min: _minPrice,
                max: _maxPrice,
                onChanged: (RangeValues values) {
                  setState(() {
                    _selectedRange = values;
                  });
                },
                labels: RangeLabels(
                  "£${_selectedRange.start.toStringAsFixed(2)}",
                  "£${_selectedRange.end.toStringAsFixed(2)}",
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pop([_selectedRange.start, _selectedRange.end]);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding:
                  EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primaryColor,
                  ),
                  child: Text(
                    'View results',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 5,
          left: 20,
          right: 20,
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              setState(() {
                _top += details.delta.dy;
              });
            },
            onVerticalDragCancel: () => Navigator.pop(context),
            child: Transform.translate(
              offset: Offset(0, _top),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
