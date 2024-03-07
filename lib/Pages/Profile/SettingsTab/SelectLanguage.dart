import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  int _selectedLanguage = -1;

  List<String> languages = [
    'English',
    'Mandarin Chinese',
    'Hindi',
    'Spanish',
    'French',
    'Standard Arabic',
    'Bengali',
    'Russian',
    'Portuguese',
    'Urdu',
  ];

  TextEditingController _searchCon = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose()
  {
    _searchCon.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios,size: MediaQuery.sizeOf(context).height*0.025,color: black.withOpacity(0.8),),
        ),
        centerTitle: true,
        title: Text("Language",
          style: TextStyle(
            fontFamily: "OpenSans_SemiBold",
            fontWeight: FontWeight.bold,
            color: black,
            fontSize: MediaQuery.of(context).size.height * 0.022,
          ),),
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height * 0.025, vertical: MediaQuery.sizeOf(context).height * 0.025),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: black.withOpacity(0.05),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: black.withOpacity(0.5), size: 22),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _searchCon,
                          focusNode: _focusNode,
                          onChanged: (value) {
                            setState(() {});
                          },
                          style: TextStyle(color: black, fontSize: 14),
                          cursorColor: primaryColor,
                          cursorHeight: 20,
                          // Adjust cursor height
                          decoration: InputDecoration(
                            hintText: "Search by Language",
                            hintStyle: TextStyle(color: black.withOpacity(0.5), fontSize: 14),
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            // Adjust TextField height
                            isDense: true,
                            // Added for better control of the field's height
                          ),
                        ),
                      ),
                      SizedBox(width: _searchCon.text.isEmpty ? 0 : 10),
                      _searchCon.text.isEmpty
                          ? SizedBox()
                          : InkWell(
                          onTap: () {
                            setState(() {
                              _searchCon.text = '';
                            });
                          },
                          child: Icon(
                            CupertinoIcons.xmark_circle_fill,
                            color: primaryColor.withOpacity(0.75),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height * 0.01),
              itemCount: languages.where((lang) => lang.toLowerCase().contains(_searchCon.text.toLowerCase())).length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                final filteredLanguages = languages.where((lang) => lang.toLowerCase().contains(_searchCon.text.toLowerCase())).toList();
                return Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.1), width: 0.5))),
                  child: ListTile(
                    title: Text(filteredLanguages[index]),
                    onTap: () {
                      // Add your logic to handle country selection here
                      print('Selected language: ${filteredLanguages[index]}');
                      setState(() {
                        _selectedLanguage = index;
                      });
                    },
                    trailing: _selectedLanguage == index ? Icon(Icons.check_circle_outline, color: primaryColor, size: MediaQuery.sizeOf(context).height * 0.025) : SizedBox(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
