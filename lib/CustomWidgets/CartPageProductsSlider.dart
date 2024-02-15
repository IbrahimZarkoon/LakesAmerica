import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constants/colors.dart';
import '../Models/Product.dart';
import '../Providers/CartProvider.dart';
import '../Routes/PageRoutes.dart';
import '../SharedPreferences/WishlistManager.dart';
import 'CustomSnackBar.dart';
import 'ShopPageProductsGridview.dart';

class CartPageProdContainer extends StatefulWidget {
  const CartPageProdContainer({super.key, required this.product, required this.onRemove});

  final Function onRemove;
  final Product product;

  @override
  State<CartPageProdContainer> createState() => _CartPageProdContainerState();
}

class _CartPageProdContainerState extends State<CartPageProdContainer> {
  @override
  Widget build(BuildContext context) {
    var CartProv = Provider.of<CartProvider>(context,listen: false);

    return InkWell(
      onTap: ()
      {
        navigateToSingleProductPage(context,widget.product);
      },
      child: Container(
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
                    height: MediaQuery.of(context).size.height * 0.3, // Fixed height for the image
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                if(double.parse(widget.product.discountPrice) > 0)Positioned(
                  top: MediaQuery.sizeOf(context).height*0.055,
                  left: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.02, vertical: MediaQuery.sizeOf(context).height*0.01),
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

                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.01,
                  right: MediaQuery.of(context).size.height * 0.01,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();

                          try {
                            CartProv.removeFromCart(widget.product);
                            CustomSnackBar.show(context, "${widget.product.title} removed from cart!", action: SnackBarAction(label: "Undo", textColor: Colors.white, onPressed: () => CartProv.addToCart(widget.product)));
                            widget.onRemove(); // Call the callback function

                          } catch (error) {
                            CustomSnackBar.show(context, 'Error removing ${widget.product.title} from cart');
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                offset: Offset(0, 0),
                                blurRadius: 1.5,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            CupertinoIcons.delete,
                            color: Colors.black,
                            size: MediaQuery.of(context).size.height * 0.03,
                          ),
                        ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                      InkWell(
                        onTap: () async {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();

                          try {
                            CartProv.addToCart(widget.product);
                            CustomSnackBar.show(context, "${widget.product.title} added to cart!", action: SnackBarAction(label: "Undo", textColor: Colors.white, onPressed: () => CartProv.removeFromCart(widget.product)));
                          } catch (error) {
                            CustomSnackBar.show(context, 'Error adding ${widget.product.title} to cart');
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                offset: Offset(0, 0),
                                blurRadius: 1.5,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.add,
                            color: primaryColor,
                            size: MediaQuery.of(context).size.height * 0.03,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                //Details Con
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width*0.5
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                      Text(
                        "${widget.product.title}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: MediaQuery.sizeOf(context).height*0.018,
                          fontFamily: "OpenSans_SemiBold",
                        ),
                      ),
                      widget.product.newArrival? Text("New Arrival",style: TextStyle(
                          fontFamily: "OpenSans_SemiBold",
                          fontSize: MediaQuery.sizeOf(context).height*0.014,
                          color: black.withOpacity(0.6)
                      ),) : SizedBox(),

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
                    ],
                  ),
                ),

                SizedBox(width: MediaQuery.sizeOf(context).height*0.015,),

                // Dropdown Container for selecting size
                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.sizeOf(context).height*0.05,
                      maxWidth: MediaQuery.sizeOf(context).width*0.4
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
                          value: "SELECT SIZE", // Set the selected value
                          onChanged: (String? newValue) {

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
                              enabled: true,
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
              ],
            ),

          ],
        ),
      ),
    );
  }
}

Widget CartProductsGrid(BuildContext context,List<Product> snapshot,Function removeProductAndUpdate)
{
  return Container(
    margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.015),
    child: GridView.builder(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.height * 0.55, // Maximum extent for items
        childAspectRatio: 1.05,
        crossAxisSpacing: MediaQuery.of(context).size.height * 0.0, // Spacing between columns
        mainAxisSpacing: MediaQuery.of(context).size.height * 0.0, // Spacing between rows
      ),
      itemCount: snapshot.length,
      itemBuilder: (context, index) {
        final product = snapshot[index];
        return CartPageProdContainer(
          product: product,
          onRemove: removeProductAndUpdate,
        );
      },
    ),
  );
}
