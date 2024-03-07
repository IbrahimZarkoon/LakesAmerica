import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lakesamerica/Constants/colors.dart';

import 'FilterAccordian.dart';

class SortandFilter extends StatefulWidget {
  const SortandFilter({Key? key}) : super(key: key);

  @override
  State<SortandFilter> createState() => _SortandFilterState();
}

class _SortandFilterState extends State<SortandFilter>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> filters = [
    {
      "name": "Color",
      "options": [
        {"option": 'Black', "quantity": 44},
        {"option": 'Blue', "quantity": 40},
        {"option": 'Green', "quantity": 93},
        {"option": 'Brown', "quantity": 40},
        {"option": 'Grey', "quantity": 93},
        {"option": 'White', "quantity": 53},
      ],
    },
    {
      "name": "Size",
      "options": [
        {"option": '0', "quantity": 96},
        {"option": '2', "quantity": 72},
        {"option": '4', "quantity": 37},
        {"option": '6', "quantity": 67},
        {"option": '8', "quantity": 82},
        {"option": '10', "quantity": 33},
        {"option": '12', "quantity": 79},
        {"option": '14', "quantity": 66},
      ],
    },
    {
      "name": "Waist Rise",
      "options": [
        {"option": 'High Waist', "quantity": 68},
        {"option": 'Low Waist', "quantity": 6},
        {"option": 'Regular Waist', "quantity": 20},
        {"option": 'Ultra High Waist', "quantity": 43},
      ],
    },
    {
      "name": "Fit",
      "options": [
        {"option": 'Loose Fit', "quantity": 22},
        {"option": 'Regular Fit', "quantity": 69},
        {"option": 'Relaxed Fit', "quantity": 90},
        {"option": 'Skinny Fit', "quantity": 90},
      ],
    },
    {
      "name": "Length",
      "options": [
        {"option": 'Ankle Length', "quantity": 22},
        {"option": 'Long', "quantity": 35},
        {"option": 'Extra-Long Legs', "quantity": 73},
        {"option": 'Regular Length', "quantity": 23},
      ],
    },
    {
      "name": "Style",
      "options": [
        {"option": 'Cargo', "quantity": 99},
        {"option": 'Flared', "quantity": 12},
        {"option": 'Overall', "quantity": 97},
        {"option": 'Boot Cut', "quantity": 9},
        {"option": 'Straight Leg', "quantity": 5},
      ],
    },
  ];

  List<String> FilterByOptions = [];

  int _selectedFilterByIndex = -1;

  List<String> sortOptions = [
    'Recommended',
    'Newest',
    'Lowest Price',
    'Highest Price',
  ];

  int _selectedSortIndex = 0;

  void _handleSortTap(int index) {
    setState(() {
      _selectedSortIndex = index;
    });
  }

  String filterByTitle = '';

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(

        height: MediaQuery.of(context).size.height * 0.95,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(0, -10),
              blurRadius: 15,
              spreadRadius: 1,
            )
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            FilterandSort(),
            SortByTab(sortOptions),
            FilterByTab(filterByTitle, FilterByOptions)
          ],
        ),
      ),
      Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: black.withOpacity(0.075)))),
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).height * 0.02,
                    vertical: MediaQuery.sizeOf(context).height * 0.02),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).height * 0.02,
                    vertical: MediaQuery.sizeOf(context).height * 0.0125),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: black, borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "View results",
                  style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height * 0.02,
                      fontFamily: "OpenSans_SemiBold",
                      color: Colors.white),
                ),
              ),
            ),
          )),
    ]);
  }

  Widget FilterandSort() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).height * 0.02,
          vertical: MediaQuery.sizeOf(context).height * 0.0),
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
          //Close Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.09,
              ),
              Text(
                "Filter & Sort",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close_rounded,
                  size: 28,
                ),
              ),
            ],
          ),

          SizedBox(height: MediaQuery.sizeOf(context).height*0.015,),


          SortCon("Sort By", sortOptions[_selectedSortIndex]),

          Column(
            children: filters.map((filter) {
              // Ensure Dart knows the type of each item in the list and what the map function returns
              List<String> optionNames = (filter['options'] as List<Map<String, dynamic>>)
                  .map<String>((Map<String, dynamic> optionMap) => optionMap['option'] as String)
                  .toList();
              
              return FilterCon(filter['name'], optionNames);
            }).toList(),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          )
        ],
      ),
    );
  }

  Widget SortCon(String text, String selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _tabController.animateTo(1);
        });
        //launchURL("https://www.whatsapp.com/");
      },
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        contentPadding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height * 0.005),
        title: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                  fontFamily: "OpenSans_SemiBold",
                  color: black),
            ),
            Spacer(),
            Text(
              selected,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.016,
                  fontFamily: "OpenSans",
                  color: black.withOpacity(0.6)),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.01,
            ),
            Icon(
              Icons.arrow_forward_rounded,
              size: MediaQuery.of(context).size.height * 0.025,
            )
          ],
        ),
        style: ListTileStyle.drawer,
      ),
    );
  }

  Widget FilterCon(String text, List<String> options) {
    return InkWell(
      onTap: () {
        setState(() {
          filterByTitle = text;
          FilterByOptions = options;
        });

        Future.delayed(
          Duration(milliseconds: 50),
          () => setState(() {
            _tabController.animateTo(2);
          }),
        );
        //launchURL("https://www.whatsapp.com/");
      },
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        contentPadding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height * 0.005),
        title: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                  fontFamily: "OpenSans_SemiBold",
                  color: black),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_rounded,
              size: MediaQuery.of(context).size.height * 0.025,
            )
          ],
        ),
        style: ListTileStyle.drawer,
      ),
    );
  }

  Widget SortByTab(List<String> options) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(0, -10),
              blurRadius: 15,
              spreadRadius: 1,
            )
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: white,
              automaticallyImplyLeading: false,
              leadingWidth: 50,
              leading: InkWell(
                  onTap: () => _tabController.animateTo(0),
                  child: Icon(
                    Icons.arrow_back,
                    color: black,
                    size: MediaQuery.sizeOf(context).height * 0.025,
                  )),
              centerTitle: true,
              title: Text(
                "Sort By",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              actions: [SizedBox()],
            ),
            Column(
                children: List.generate(options.length, (index) {
              return GestureDetector(
                onTap: () => _handleSortTap(index),
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: _selectedSortIndex == index
                      ? primaryColor.withOpacity(0.15)
                      : Colors.white,
                  child: Row(
                    children: [
                      Radio(
                        value: index,
                        activeColor: primaryColor,
                        groupValue: _selectedSortIndex,
                        onChanged: (int? value) {
                          _handleSortTap(value!);
                        },
                      ),
                      Text(
                        options[index],
                        style: TextStyle(
                            fontSize: MediaQuery.sizeOf(context).height * 0.016,
                            fontFamily: "OpenSans"),
                      ),
                    ],
                  ),
                ),
              );
            }))
          ],
        ),
      ),
    );
  }

  Widget FilterByTab(String title, List<String> options) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(0, -10),
              blurRadius: 15,
              spreadRadius: 1,
            )
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: white,
              automaticallyImplyLeading: false,
              leadingWidth: 50,
              leading: InkWell(
                  onTap: () => _tabController.animateTo(0),
                  child: Icon(
                    Icons.arrow_back,
                    color: black,
                    size: MediaQuery.sizeOf(context).height * 0.025,
                  )),
              centerTitle: true,
              title: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              actions: [SizedBox()],
            ),
            Column(
                children: List.generate(options.length, (index) {
              return GestureDetector(
                onTap: () => _handleSortTap(index),
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: _selectedSortIndex == index
                      ? primaryColor.withOpacity(0.15)
                      : Colors.white,
                  child: Row(
                    children: [
                      Checkbox(
                        value: _selectedSortIndex == index,
                        activeColor: primaryColor,
                        onChanged: (bool? value) {
                          if (value != null && value) {
                            _handleSortTap(index);
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              0), // To make it look more square-like
                        ),
                      ),
                      Text(
                        options[index],
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.016,
                          fontFamily: "OpenSans",
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }))
          ],
        ),
      ),
    );
  }
}
