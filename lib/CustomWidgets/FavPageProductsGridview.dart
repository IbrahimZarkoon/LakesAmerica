import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Models/Product.dart';
import '../SharedPreferences/WishlistManager.dart';
import 'ShopPageProductsGridview.dart';

class FavPageProdContainer extends StatefulWidget {
  final Product product;
  final Function onRemove;

  const FavPageProdContainer({Key? key, required this.product, required this.onRemove}) : super(key: key); // Modify this line

  @override
  State<FavPageProdContainer> createState() => _FavPageProdContainerState();
}

class _FavPageProdContainerState extends State<FavPageProdContainer> {
  String selectedSize = 'SELECT SIZE';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  widget.product.image,
                  width: double.infinity, // Makes the image take the full width of the container
                  height: MediaQuery.of(context).size.height * 0.225, // Fixed height for the image
                  fit: BoxFit.cover,
                ),
              ),
              if(double.parse(widget.product.discountPrice) > 0)Positioned(
                bottom: MediaQuery.sizeOf(context).height*0.055,
                left: 0.0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.0125, vertical: MediaQuery.sizeOf(context).height*0.0075),
                  decoration: BoxDecoration(
                      color: secondaryColor, // Customize the color as needed
                      borderRadius: BorderRadius.only(topRight: Radius.circular(2),bottomRight: Radius.circular(2)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1,2),
                            spreadRadius: 1,
                            blurRadius: 1.5,
                            color: black.withOpacity(0.25)
                        )
                      ]
                  ),
                  child: Text(
                    '-${widget.product.discountAmount}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.sizeOf(context).height*0.017, // Adjust the font size as needed
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   top: 8.0,
              //   right: 8.0,
              //   child: Container(
              //     padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
              //     decoration: BoxDecoration(
              //       color: secondaryColor, // Customize the color as needed
              //       borderRadius: BorderRadius.circular(5.0),
              //     ),
              //     child: Text(
              //       'New Arrival',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 12.0, // Adjust the font size as needed
              //       ),
              //     ),
              //   ),
              // ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.005,
                right: MediaQuery.of(context).size.height * 0.005,
                child: InkWell(
                  onTap: () async {
                    WishlistManager.removeProductFromWishlist(widget.product).then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${widget.product.title} removed from wishlist!')),
                      );
                      widget.onRemove(); // Call the callback function
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error removing ${widget.product.title} from wishlist')),
                      );
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      CupertinoIcons.delete,
                      color: black,
                      size: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Text(
            widget.product.title,
            style: TextStyle(
                fontFamily: "OpenSans_SemiBold",
                fontSize: MediaQuery.sizeOf(context).height*0.018,
                color: black
            ),
          ),
          (double.parse(widget.product.discountPrice) > 0)? Row(
            children: [
              Text(
                '\$${widget.product.discountPrice}', // Display the discounted price with a '$' prefix
                style: TextStyle(
                    fontFamily: "OpenSans_SemiBold",
                    fontSize: MediaQuery.sizeOf(context).height*0.018,
                    color: secondaryColor
                ),
              ),
              SizedBox(width: MediaQuery.sizeOf(context).height*0.005), // Add some spacing between the prices
              Text(
                '${widget.product.price}', // Display the original price with a '$' prefix
                style: TextStyle(
                  color: black,
                  fontSize: MediaQuery.sizeOf(context).height*0.014,
                  fontFamily: "OpenSans_SemiBold",
                  decoration: TextDecoration.lineThrough, // Add a line-through decoration
                ),
              ),
            ],
          )  : Text(
            widget.product.price,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("New Arrival",style: TextStyle(
              fontFamily: "OpenSans_SemiBold",
              fontSize: MediaQuery.sizeOf(context).height*0.014,
              color: black.withOpacity(0.6)
          ),),

          Row(
            children: [

              Text("Color:",style: TextStyle(
                color: black,fontSize: MediaQuery.sizeOf(context).height*0.014,
                fontFamily: "OpenSans_SemiBold"
              ),),

              SizedBox(width: MediaQuery.sizeOf(context).height*0.01,),

              Dot(color: Color(0xff262427)), // Replace with your desired colors
              Dot(color: Color(0xff653c26)),
              Dot(color: Color(0xff402273)),
            ],
          ),

          // Dropdown Container for selecting size
          Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height*0.05

            ),
            margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.01),
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height * 0.015),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: white,
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.15),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0,0)
                )
              ]
            ),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    //itemHeight: MediaQuery.sizeOf(context).height*0.06,
                    menuMaxHeight: MediaQuery.sizeOf(context).height*0.25,
                    elevation: 1,
                    dropdownColor: white,
                    borderRadius: BorderRadius.circular(5),
                    underline: SizedBox(),
                    value: selectedSize, // Set the selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSize = newValue!;
                      });
                    },
                    isExpanded: true,
                    items: <String>[
                      'SELECT SIZE',
                      'Size S',
                      'Size M',
                      'Size L',
                      'Size XL',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,style: TextStyle(
                          color: black,
                          fontFamily: "OpenSans_SemiBold",
                          fontSize: MediaQuery.sizeOf(context).height*0.013
                        ),),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 8),

          // Add Button Container
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height*0.05
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: primaryColor,
                boxShadow: [
                  BoxShadow(
                      color: black.withOpacity(0.15),
                      spreadRadius: 1,
                      blurRadius: 1.5,
                      offset: Offset(0,0)
                  )
                ]
            ),
            padding: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*0.015),
            //alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.shopping_bag_outlined,color: white,size: MediaQuery.sizeOf(context).height*0.0225,),
                SizedBox(width: MediaQuery.sizeOf(context).height*0.005,),
                Text("Add",style: TextStyle(
                  color: white,
                  fontFamily: "OpenSans_Bold",
                  fontSize: MediaQuery.sizeOf(context).height*0.016
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}