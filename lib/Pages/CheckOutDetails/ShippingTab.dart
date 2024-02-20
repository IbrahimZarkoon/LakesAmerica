import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/CustomWidgets/Headings.dart';
import 'package:lakesamerica/Models/CheckoutModels/ShippingModel.dart';
import 'package:provider/provider.dart';

import '../../Constants/colors.dart';
import '../../CustomWidgets/CustomSnackBar.dart';
import '../../Providers/CartProvider.dart';
import '../../Providers/CheckoutProvider.dart';


class ShippingTab extends StatefulWidget {
   ShippingTab({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<ShippingTab> createState() => _ShippingTabState();
}

class _ShippingTabState extends State<ShippingTab> {
  final List<Shipping> shippingOptions = [
    Shipping('Free Shipping', '5-8 days', 'Free'),
    Shipping('Standard Shipping', '3-7 days', '\$4.99'),
    Shipping('Express Shipping', '2-3 days', '\$14.99'),
    Shipping('Overnight Shipping', '1 day', '\$19.99'),
    Shipping('International Shipping', '5-10 days', '\$15.99'),
  ];

  bool _isLoading = false;


  int _selectedIndex = -1;

  Future<void> saveDetails()
  async {
    setState(() => _isLoading = true);
    await Future.delayed(Duration(milliseconds: 500));
    widget.tabController.animateTo(0);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    var CheckoutProv = Provider.of<CheckoutProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),

      body: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemCount: shippingOptions.length,
            itemBuilder: (context, index) {
              Shipping option = shippingOptions[index];
              return Column(
                children: [
                  RadioListTile<int>(
                    value: index,
                    groupValue: _selectedIndex,
                    activeColor: secondaryColor,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedIndex = value!;
                      });
                    },
                    title: Text(option.shippingTitle,
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).height*0.018,
                          fontFamily: "OpenSans_SemiBold",color: black,fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle: Text(option.shippingDays,
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).height*0.016,
                          fontFamily: "OpenSans",color: black.withOpacity(0.8)
                      ),),
                    secondary: Text(option.shippingPrice,
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).height*0.018,
                          fontWeight: FontWeight.bold,
                          fontFamily: "OpenSans",color: primaryColor
                      ),),
                  ),

                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.025),
                      child: shadowLine(context))
                ],
              );
            },
          ),

          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _isLoading
                  ? Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ))
                  : SizedBox())
        ],
      ),

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [


          InkWell(
            onTap: ()
            async {
              if(_selectedIndex != -1)
                {
                  CheckoutProv.shipping = Shipping(shippingOptions[_selectedIndex].shippingTitle, shippingOptions[_selectedIndex].shippingDays, shippingOptions[_selectedIndex].shippingPrice);
                  await saveDetails();
                }
              else{
                CustomSnackBar.show(context, "Select a shipping method first");

              }
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
                "Select",
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

        ],
      ),
    );
  }
}
