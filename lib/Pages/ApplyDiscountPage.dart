import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constants/colors.dart';
import '../Providers/CartProvider.dart';

class ApplyDiscountPage extends StatefulWidget {
  const ApplyDiscountPage({super.key});

  @override
  State<ApplyDiscountPage> createState() => _ApplyDiscountPageState();
}

class _ApplyDiscountPageState extends State<ApplyDiscountPage> {
  final TextEditingController _discountController = TextEditingController();
  bool _isLoading = true; // Add this line

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () { // Change to 2 or 3 seconds as needed
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  String discountState = 'idle'; // 'idle', 'loading', 'success'

  void applyDiscount() async {
    setState(() {
      discountState = 'loading';
    });
    // Simulate a network request or lengthy process
    await Future.delayed(Duration(seconds: 2));
    // Assume this is where you set your discount, for demo we just change state
    setState(() {
      Provider.of<CartProvider>(context, listen: false).discountAmount = double.parse("${_discountController.text}");
      discountState = 'success';
    });
  }

  Widget build(BuildContext context) {
    var CartProv = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: black.withOpacity(0.025),
        scrolledUnderElevation: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 50,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: black,
              size: MediaQuery.sizeOf(context).height * 0.0325,
            )),
        centerTitle: true,
        title: Text(
          "Discounts",
          style: TextStyle(
            fontFamily: "OpenSans_Bold",
            fontSize: MediaQuery.of(context).size.height * 0.022,
          ),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: primaryColor,))  : SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.025,vertical: MediaQuery.sizeOf(context).height*0.015),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Add a discount code',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: black.withOpacity(0.6),
                  fontSize: MediaQuery.sizeOf(context).height*0.016,
                  fontFamily: "OpenSans_SemiBold"
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.015),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _discountController,
                    cursorColor: primaryColor,
                    enabled: discountState == 'success'? false: true,
                    decoration: InputDecoration(
                      labelText: 'Code',
                      labelStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                        fontFamily: "OpenSans",
                        color: black,
                      ),
                      // Adjust content padding to control field height
                      contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.015,vertical: MediaQuery.of(context).size.height * 0.015),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: black.withOpacity(0.5))),
                      disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: black.withOpacity(0.5))),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: black.withOpacity(0.5))),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: primaryColor)),


                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),

                GestureDetector(
                  onTap: discountState == 'idle' ? applyDiscount : null, // Prevent tapping when loading or success
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).height*0.0575,
                    height: MediaQuery.sizeOf(context).height*0.0575,
                    margin: EdgeInsets.only(left: 20), // Adjusted for simplicity
                    padding: EdgeInsets.all(discountState == 'loading'? 8 : 0), // Adjusted for simplicity
                    decoration: BoxDecoration(
                      color: discountState == 'success' ? white : primaryColor,
                      borderRadius: BorderRadius.circular(5),
                      // The rest of your BoxDecoration code...
                    ),
                    child: discountState == 'loading'
                        ? CircularProgressIndicator(
                                                  strokeWidth: 3,
                                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                                )
                        : discountState == 'success'
                        ? Icon(Icons.check, color: primaryColor)
                        : Text(
                      "Apply",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),)
              ],
            ),


            SizedBox(height: MediaQuery.sizeOf(context).height*0.03),

          ],
        ),
      ),

      bottomNavigationBar: InkWell(
        onTap: () async {
          Navigator.pop(context);
        },
        child: Container(
          height: kToolbarHeight,
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height * 0.02,vertical: MediaQuery.sizeOf(context).height * 0.02),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).height * 0.02,
              vertical: MediaQuery.sizeOf(context).height * 0.0125),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: black,width: 1),
              color: black, borderRadius: BorderRadius.circular(5),boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(0,0),
              blurRadius: 1.5,
            )
          ]),
          child: Text(
            "Proceed",
            style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).height * 0.02,
                fontFamily: "OpenSans",
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
