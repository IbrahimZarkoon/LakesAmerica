import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/Models/CheckoutModels/MyInfoModel.dart';
import 'package:lakesamerica/Providers/CheckoutProvider.dart';
import 'package:provider/provider.dart';

import '../../Constants/colors.dart';
import '../../Providers/CartProvider.dart';

class MyInformationTab extends StatefulWidget {
   MyInformationTab({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<MyInformationTab> createState() => _MyInformationTabState();
}

class _MyInformationTabState extends State<MyInformationTab> with SingleTickerProviderStateMixin{

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  Future<void> saveDetails()
  async {
    setState(() => _isLoading = true);
    await Future.delayed(Duration(milliseconds: 1000));
    widget.tabController.animateTo(0);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    var CheckoutProv = Provider.of<CheckoutProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white,
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email *',
                    labelStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                      fontFamily: "OpenSans",
                      color: black,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.015,
                        vertical: MediaQuery.of(context).size.height * 0.015),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white,
                ),
                child: TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name*',
                    labelStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                      fontFamily: "OpenSans",
                      color: black,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.015,
                        vertical: MediaQuery.of(context).size.height * 0.015),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white,
                ),
                child: TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name*',
                    labelStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                      fontFamily: "OpenSans",
                      color: black,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.015,
                        vertical: MediaQuery.of(context).size.height * 0.015),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.005),
            ],
          ),
            
            Positioned(
                left: 0,right: 0,
                bottom: 0,
                child: _isLoading
                ? Center(child: CircularProgressIndicator(color: primaryColor,)) : SizedBox())
        ]
        ),
      ),

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [


          InkWell(
            onTap: ()
            async {
              CheckoutProv.myInformation = MyInformation(
                _emailController.text.isNotEmpty ? _emailController.text : '',
                _firstNameController.text.isNotEmpty ? _firstNameController.text : '',
                _lastNameController.text.isNotEmpty ? _lastNameController.text : '',
              );
              await saveDetails();
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height * 0.025
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).height * 0.02,
                  vertical: MediaQuery.sizeOf(context).height * 0.0125),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: black, width: 1),
                  color: black,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: Offset(0, 0),
                      blurRadius: 1.5,
                    )
                  ]),
              child: Text(
                "Save",
                style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).height * 0.018,
                    fontFamily: "OpenSans_SemiBold",
                    color: Colors.white),
              ),
            ),
          ),

          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.025,
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(CupertinoIcons.lock,color: black.withOpacity(0.6),size: MediaQuery.sizeOf(context).height*0.025,),

              SizedBox(width: MediaQuery.sizeOf(context).height*0.005,),
              Text("All data will be encrypted.",style: TextStyle(
                  color: black.withOpacity(0.6),
                  fontFamily: "OpenSans",fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.sizeOf(context).height*0.016
              ),),
            ],
          ),

          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.025,
          ),

        ],
      ),
    );
  }
}
