import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constants/colors.dart';
import '../Pages/SearchPage.dart';
import '../Providers/CartProvider.dart';
import '../Routes/PageRoutes.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    var CartProv = Provider.of<CartProvider>(context,listen: false);

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,//Color(0xff414342),

      automaticallyImplyLeading: false,
      // leading: InkWell(
      //     onTap: () => Scaffold.of(context).openDrawer(),
      //     child: Icon(Icons.menu,size: 25,color: Color(0xff00afef),)),
      leadingWidth: 0,
      centerTitle: true,
      title: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SearchPage(tag: "searchTag"))),
        child: Container(
          margin: EdgeInsets.only(bottom: 5, top: 5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: black.withOpacity(0.05),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "searchTag",
                child: Icon(CupertinoIcons.search, size: 20, color: Colors.black.withOpacity(0.5)),
              ),
              const SizedBox(width: 10),
              Text(
                "Search",
                style: TextStyle(color: black.withOpacity(0.5), fontFamily: "OpenSans", fontSize: 16),
              ),
            ],
          ),
        ),
      ),

      actions: [

        Consumer<CartProvider>(
          builder: (context,CartProv,_)
              {
                return InkWell(
                  onTap: () {
                    navigateToCartPage(context);
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.0125,horizontal: MediaQuery.of(context).size.height * 0.008),
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          size: MediaQuery.of(context).size.height * 0.03,
                          color: CartProv.cartItems.length > 0 ? secondaryColor : Colors.black.withOpacity(0.5),
                        ),
                      ),
                      if (CartProv.cartItems.length > 0) // Show count only if cart is not empty
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.005),
                            decoration: BoxDecoration(
                              color: secondaryColor, // You can change the color as needed
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              CartProv.cartItems.length.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.sizeOf(context).height*0.014,
                                fontFamily: "OpenSans_SemiBold",
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }
        ),

        SizedBox(width: MediaQuery.sizeOf(context).width*0.025,),

        InkWell(
            onTap: ()
            {
              Scaffold.of(context).openEndDrawer();
            },
            child: Icon(Icons.menu,size: MediaQuery.sizeOf(context).height*0.03,color: Colors.black.withOpacity(0.5),)),

        SizedBox(width: MediaQuery.sizeOf(context).width*0.05,),

      ],
    );
  }
}
