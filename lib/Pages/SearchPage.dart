import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key, required this.tag}) : super(key: key);

  final String tag;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController _searchCon = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      // Focus the text field and show the keyboard
      _focusNode.requestFocus();
      _searchCon.selection = TextSelection.fromPosition(
          TextPosition(offset: _searchCon.text.length));
      //TextInput.showKeyboard();
    });
  }

  @override
  void dispose()
  {
    _searchCon.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 10, bottom: 5, top: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: black.withOpacity(0.05),
                  ),
                  child: Row(
                    children: [
                      Hero(
                        tag: widget.tag,
                        child: Icon(Icons.search, color: black.withOpacity(0.5), size: 22),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _searchCon,
                          focusNode: _focusNode,
                          onChanged: (value)
                          {
                            setState(() {
                              _searchCon.text = value;
                            });
                          },
                          style: TextStyle(color: black, fontSize: 14),
                          cursorColor: primaryColor,
                          cursorHeight: 20, // Adjust cursor height
                          decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: TextStyle(color: black.withOpacity(0.5), fontSize: 14),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10), // Adjust TextField height
                            isDense: true, // Added for better control of the field's height
                          ),
                        ),
                      ),

                      SizedBox(width: _searchCon.text.isEmpty? 0 : 10),

                      _searchCon.text.isEmpty? SizedBox() : InkWell(
                          onTap: ()
                          {
                            setState(() {
                              _searchCon.text = '';
                            });
                          },
                          child: Icon(CupertinoIcons.xmark_circle_fill,color: primaryColor.withOpacity(0.75),))
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text("Cancel"),
                ),
              ),
            ],
          ),
        ),

        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [

              recentSearchCon("Nike grippers"),

              recentSearchCon("Furniture"),

              recentSearchCon("Airpods pro")

            ],
          ),
        ),
      ),
    );
  }

  Widget recentSearchCon(String title)
  {
    return Container(
      padding: EdgeInsets.only(top: 0,bottom: 10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.1),width: 0.5))
      ),
      margin: EdgeInsets.only(left: 20,right: 20,bottom: 0,top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Row(
            children: [
              Icon(Icons.youtube_searched_for_outlined,size: 20,color: Colors.black.withOpacity(0.8),),

              const SizedBox(width: 20,),

              Text(title,style: TextStyle(fontSize: 16),),
            ],
          ),

          InkWell(
            onTap: ()
            {
              setState(() {
                _searchCon.text = title;
              });
            },
            child: Transform.rotate(
                angle: -45 * 0.0174533,
                child: Icon(Icons.arrow_upward,size: 22,color: Colors.black.withOpacity(0.8),)),
          )


        ],
      ),
    );
  }
}