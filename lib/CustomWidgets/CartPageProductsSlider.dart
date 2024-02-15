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

  String _selectedQuantity = "1";
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedQuantity = "${widget.product.quantity}";
  }

  @override
  Widget build(BuildContext context) {
    var CartProv = Provider.of<CartProvider>(context,listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    widget.product.image,
                    width: MediaQuery.of(context).size.width*0.3,
                    height: MediaQuery.of(context).size.height * 0.2,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                if(double.parse(widget.product.discountPrice) > 0)Positioned(
                  top: MediaQuery.sizeOf(context).height*0.015,
                  left: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.0075, vertical: MediaQuery.sizeOf(context).height*0.005),
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
                        fontSize: MediaQuery.sizeOf(context).height*0.014, // Adjust the font size as needed
                      ),
                    ),
                  ),
                ),

              ],
            ),

            SizedBox(width: MediaQuery.sizeOf(context).height*0.015,),
            //Details Con
            Expanded(
              child: Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.product.title}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: "OpenSans_SemiBold",
                                    fontWeight: FontWeight.bold,
                                    fontSize: MediaQuery.sizeOf(context).height*0.018,
                                    color: black
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.005),

                              (double.parse(widget.product.discountPrice) > 0)? Row(
                                children: [
                                  Text(
                                    '\$${widget.product.discountPrice}', // Display the discounted price with a '$' prefix
                                    style: TextStyle(
                                        fontFamily: "OpenSans_SemiBold",
                                        fontSize: MediaQuery.sizeOf(context).height*0.02,
                                        color: secondaryColor
                                    ),
                                  ),
                                  SizedBox(width: MediaQuery.sizeOf(context).height*0.005), // Add some spacing between the prices
                                  Text(
                                    '\$${widget.product.price}', // Display the original price with a '$' prefix
                                    style: TextStyle(
                                      color: black,
                                      fontSize: MediaQuery.sizeOf(context).height*0.014,
                                      fontFamily: "OpenSans_SemiBold",
                                      decoration: TextDecoration.lineThrough, // Add a line-through decoration
                                    ),
                                  ),
                                ],
                              )
                                  :
                              Text(
                                widget.product.price,
                                style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: MediaQuery.sizeOf(context).height*0.018,
                                  fontFamily: "OpenSans_SemiBold",
                                ),
                              ),
                            ],
                          ),
                        ),

                        InkWell(
                          onTap: () async {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();

                            try {
                              CartProv.removeFromCart(widget.product);
                              CustomSnackBar.show(context, "${widget.product.title} removed from cart!", action: SnackBarAction(label: "Undo", textColor: Colors.white, onPressed: () => CartProv.addToCart(widget.product,1)));
                              widget.onRemove(); // Call the callback function

                            } catch (error) {
                              CustomSnackBar.show(context, 'Error removing ${widget.product.title} from cart');
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),

                            child: Icon(
                              CupertinoIcons.delete,
                              color: black,
                              size: MediaQuery.of(context).size.height * 0.03,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.005),

                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[

                          TextSpan(
                            text: 'Article No: ',
                            style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.014,fontWeight: FontWeight.bold),

                          ),
                          TextSpan(
                            text: '1216311002\n',
                            style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.014,),

                          ),
                          TextSpan(
                            text: 'Length: ',
                            style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.014,fontWeight: FontWeight.bold),

                          ),
                          TextSpan(
                            text: 'Short\n',
                            style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.014,),

                          ),
                          TextSpan(
                            text: 'Waist: ',
                            style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.014,fontWeight: FontWeight.bold),

                          ),
                          TextSpan(
                            text: 'Regular waist\n',
                            style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.014,),

                          ),
                          TextSpan(
                            text: 'Fit: ',
                            style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.014,fontWeight: FontWeight.bold),

                          ),

                          TextSpan(
                            text: 'Regular fit\n',
                            style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.014,),

                          ),
                          TextSpan(
                            text: 'Description: ',
                            style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.014,fontWeight: FontWeight.bold),

                          ),

                          TextSpan(
                            text: 'Black/white, Striped\n',
                            style: TextStyle(color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.014,),

                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: MediaQuery.sizeOf(context).height*0.015,),


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            InkWell(
              onTap: () async {
                // Hide any currently showing SnackBar
                ScaffoldMessenger.of(context).hideCurrentSnackBar();

                try {
                  await WishlistManager.addProductToWishlist(widget.product);
                  CustomSnackBar.show(context, "${widget.product.title} added to wishlist!",action: SnackBarAction(label: "Undo",textColor: white, onPressed:  ()async{
                    await WishlistManager.removeProductFromWishlist(widget.product);
                    setState(() {

                    });
                  }));
                } catch (error) {
                  CustomSnackBar.show(context, 'Error adding ${widget.product.title} to wishlist');
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width*0.015),
                width: MediaQuery.of(context).size.width*0.3,
                height: MediaQuery.sizeOf(context).height*0.05,
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
                child: Center(
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: black, // Outline color (black)
                    size: MediaQuery.of(context).size.height * 0.025,
                  ),
                ),
              ),
            ),

            SizedBox(width: MediaQuery.sizeOf(context).height*0.015,),

            // Dropdown Container for selecting size
            Expanded(
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.sizeOf(context).height*0.05,
                ),
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
                        value: _selectedQuantity, // Set the selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedQuantity = newValue!;
                            CartProv.setQuantity(widget.product, int.parse("${newValue}"));
                          });

                        },
                        isExpanded: true,
                        items: <String>[
                          '1',
                          '2',
                          '3',
                          '4',
                          '5',
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
            ),
          ],
        ),

      ],
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
        childAspectRatio: 1.5,
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
