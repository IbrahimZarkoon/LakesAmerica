import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/CustomWidgets/ProductDescriptionAcc.dart';
import 'package:lakesamerica/CustomWidgets/ShopPageProductsGridview.dart';
import 'package:lakesamerica/Models/Product.dart';
import 'package:share/share.dart';

import '../Constants/colors.dart';
import '../CustomWidgets/CustomSnackBar.dart';
import '../CustomWidgets/Headings.dart';
import '../CustomWidgets/OffersPageProductsSlider.dart';
import '../Routes/PageRoutes.dart';
import '../SharedPreferences/WishlistManager.dart';

class SingleProductPage extends StatefulWidget {
  const SingleProductPage({super.key, required this.product});

  final Product product;

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  int selectedIndex = 0;

  List<Widget> imageWidgets = [];

  @override
  void initState() {
    super.initState();
    // Initialize your image URLs list, including the product image at the start
    List<String> imageUrls = [
      widget.product.image, // Add the product image at the beginning
      "https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2Fd2%2Fb6%2Fd2b600f3bcfc2f061a1e7ec6353fa0e0bcd2f092.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D",
      "https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F20%2F52%2F20522b9a2a26377cdf97a33ebb9061e67ba09c45.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D",
      "https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2Fd9%2F5f%2Fd95f7a98b92d4ec983851f19dbb7b53d14cdbc91.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVEDETAIL%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D",
      "https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F05%2F38%2F0538fdf4ed6f7b32edc4197e4ba96eb13538d109.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bmen_jeans_regular%5D%2Ctype%5BDESCRIPTIVEDETAIL%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D",
      "https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2Fc3%2F28%2Fc328d6c60468939bac93f46bd71a51a3a3f6474b.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D",
      // Add the rest of your image URLs here...
    ];

    // Convert the URLs to Container widgets
    imageWidgets = imageUrls.map((e) => Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(e),
              fit: BoxFit.cover
          )
      ),
    )).toList();
  }

  int selectedColorImage = 0;

  List<String> colorImageUrls = [
    "https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F54%2F96%2F549605949fdf07f526c446f7a3917b1025340695.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D",
    'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F64%2F12%2F6412515421bbf74e96c7b04751f2d59b8b3ca59e.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bmen_jeans_regular%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
    'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2Ff7%2F70%2Ff7705e9558c4b1aec042472e4da2aa8b1e4b48a3.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bmen_jeans_regular%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D'
  ];

  List<String> sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL', '3XL'];
  int selectedSizeIndex = -1;

  List<Product>? recommendedProducts = [
    {
      'image': 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F60%2F62%2F60629c6b2c3c690c247a6b1bff2d4541f4155d0c.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
      'title': 'Loose Fit Hoodie',
      'category': 'Men Jackets',
      'price': '\$99',
      'discountAmount' : '60%',
      'discountPrice' : '39',
      'newArrival' : true,
    },
    {
      'image': 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2Fb4%2F26%2Fb4261cae5350fe9209375bf73cf0014104d6e61f.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
      'title': 'Cargo joggers',
      'category': 'Men Pants',
      'price': '\$199','discountAmount' : '20%',
      'discountPrice' : '169',
      'newArrival' : false,
    },
    {
      'image': 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F70%2F90%2F7090859755dd5b6c809c17cee153b092459be037.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
      'title': 'Relaxed Fit Sweatpants',
      'category': 'Men Pants',
      'price': '\$199','discountAmount' : '55%',
      'newArrival' : true,
      'discountPrice' : '89',
    },
    {
      'image': 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F3b%2F02%2F3b02e03e308786099f336ad9df8f27aa34681d1b.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
      'title': 'Oversized turtleneck jumper',
      'category': 'Women Jumpers',
      'price': '\$99',
      'discountAmount' : '30%',
      'newArrival' : false,
      'discountPrice' : '69',
    },
    {
      'image': 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2Ff4%2F00%2Ff4004cd89e5d30466aa9a8f473caa29f32d84d0c.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_cardigansjumpers_cardigans%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
      'title': 'Rib-knit cardigan',
      'category': 'Women Knitwear',
      'price': '\$199','discountAmount' : '30%',
      'newArrival' : true,
      'discountPrice' : '69',
    },
    {
      'image': 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2Fa1%2F70%2Fa170f68ba3610172a5d8ecf6ff9fbabd915e3a6c.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
      'title': 'Tapered Regular Jeans',
      'category': 'Women Jeans',
      'price': '\$99','discountAmount' : '20%',
      'newArrival' : false,
      'discountPrice' : '79',
    },

    // Add more products as needed
  ].map((productMap) => Product(
    image: "${productMap['image']!}",
    title: "${productMap['title']!}",
    category: "${productMap['category']!}",
    price: "${productMap['price']!}",
    discountAmount: "${productMap['discountAmount'] ?? "0.0"}",
    discountPrice: "${productMap['discountPrice'] ?? "0.0"}", newArrival: productMap['newArrival'] as bool,
  )).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: white,
        shadowColor: black,
        foregroundColor: white,
        elevation: 0.25,

        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: black,
              size: MediaQuery.sizeOf(context).height * 0.025,
            )),
        leadingWidth: 50,
        centerTitle: true,
        title: Text(
          "Member perk: 10% off \$50, 15\$ off \$80 or 20% off \$100 + free shipping",
          style: TextStyle(
            color: secondaryColor,
            fontSize: MediaQuery.sizeOf(context).height*0.014,
            fontFamily: "OpenSans_Bold"
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,


        ),
        actions: [
          InkWell(
              onTap: () {
                navigateToCartPage(context);
              },
              child: Icon(
                Icons.shopping_bag_outlined,
                size: MediaQuery.sizeOf(context).height * 0.03,
                color: black,
              )),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.035,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height*0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image Container
            topImageCon(),

            //Title, Price & share
            Container(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.015,vertical: MediaQuery.sizeOf(context).height*0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width*0.8
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        //Product Title
                        Text(
                          "${widget.product.title}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: "OpenSans_Bold",
                              fontSize: MediaQuery.sizeOf(context).height*0.022,
                              color: black
                          ),
                        ),

                        SizedBox(height: MediaQuery.sizeOf(context).height*0.0015,),

                        (double.parse(widget.product.discountPrice) > 0)? Row(
                          children: [
                            Text(
                              '\$${widget.product.discountPrice}', // Display the discounted price with a '$' prefix
                              style: TextStyle(
                                  fontFamily: "OpenSans_SemiBold",
                                  fontSize: MediaQuery.sizeOf(context).height*0.022,
                                  color: secondaryColor
                              ),
                            ),
                            SizedBox(width: MediaQuery.sizeOf(context).height*0.0075), // Add some spacing between the prices
                            Text(
                              '${widget.product.price}', // Display the original price with a '$' prefix
                              style: TextStyle(
                                color: black,
                                fontSize: MediaQuery.sizeOf(context).height*0.018,
                                fontFamily: "OpenSans_SemiBold",
                                decoration: TextDecoration.lineThrough, // Add a line-through decoration
                              ),
                            ),
                          ],
                        )  : Text(
                          widget.product.price,
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: MediaQuery.sizeOf(context).height*0.022,
                            fontFamily: "OpenSans_SemiBold",
                          ),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                      onTap: ()
                      {
                        Share.share("lakesamerica.com");
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right:MediaQuery.sizeOf(context).height*0.015 ),
                        child: Icon(CupertinoIcons.share,size: MediaQuery.sizeOf(context).height*0.03,color: black,),
                      )),
                ],
              ),
            ),

            //Colors Container
            colorsWidget(),

            SizedBox(height: MediaQuery.sizeOf(context).height*0.03,),

            //Sizes Container
            sizeWidget(),

            ProductDescriptionAcc(title: "Description"),

            SizedBox(height: MediaQuery.sizeOf(context).height*0.0025,),


            ProductDescriptionAcc(title: "Materials & Suppliers"),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.0025,),

            ProductDescriptionAcc(title: "Care guide"),
            shadowLine(context),

            SizedBox(height: MediaQuery.sizeOf(context).height*0.015,),

            //Products Slider
            Container(
              padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.015,bottom: MediaQuery.sizeOf(context).height*0.01 , left:MediaQuery.sizeOf(context).height*0.015 , right:MediaQuery.sizeOf(context).height*0.015),
              child: Row(
                children:  [

                  Text("Others also bought",overflow: TextOverflow.ellipsis,
                      style:
                      TextStyle(color: Colors.black.withOpacity(0.8),fontFamily: "OpenSans_Bold", fontSize: MediaQuery.sizeOf(context).height*0.024,)),
                ],
              ),
            ),

            OffersPageProductSlider.custom(snapshot: recommendedProducts),

            Container(
              padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.015,bottom: MediaQuery.sizeOf(context).height*0.01 , left:MediaQuery.sizeOf(context).height*0.015 , right:MediaQuery.sizeOf(context).height*0.015),
              child: Row(
                children:  [

                  Text("Style with",overflow: TextOverflow.ellipsis,
                      style:
                      TextStyle(color: Colors.black.withOpacity(0.8),fontFamily: "OpenSans_Bold", fontSize: MediaQuery.sizeOf(context).height*0.024,)),
                ],
              ),
            ),

            OffersPageProductSlider(),

          ],
        ),
      ),

      bottomNavigationBar: InkWell(
        onTap: ()
        {
          //Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardPage(tabindex: 4)));
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
              color: black, borderRadius: BorderRadius.circular(10),boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(0,0),
              blurRadius: 1.5,
            )
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Icon(Icons.shopping_bag_outlined,size: MediaQuery.sizeOf(context).height*0.03,color: white.withOpacity(0.95),),

              SizedBox(width: MediaQuery.sizeOf(context).height*0.005,),

              Text(
                "Add to bag",
                style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).height * 0.02,
                    fontFamily: "OpenSans",
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget colorsWidget()
  {
    return Container(
      height: MediaQuery.sizeOf(context).height*0.2,
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Colors:",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "OpenSans_SemiBold",
              fontSize: MediaQuery.of(context).size.height * 0.022,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width*0.1),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: colorImageUrls.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColorImage = index; // Update the selected index on tap
                    });
                  },
                  child: colorImageCon(colorImageUrls[index],index),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget sizeWidget()
  {
    return Container(
      height: MediaQuery.sizeOf(context).height*0.2,
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sizes:",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "OpenSans_SemiBold",
              fontSize: MediaQuery.of(context).size.height * 0.022,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),

          Wrap(
            spacing: MediaQuery.sizeOf(context).height*0.015, // Horizontal space between chips
            runSpacing: MediaQuery.sizeOf(context).height*0.015, // Vertical space between chips lines
            children: List<Widget>.generate(sizes.length, (index) {
              return sizesCon(sizes[index],index);
            }),
          )
        ],
      ),
    );
  }

  Widget topImageCon()
  {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        // Check the direction of the drag
        if (details.primaryVelocity! > 0) {
          // Left to right swipe
          setState(() {
            if (selectedIndex > 0) {
              selectedIndex--;
            }
          });
        } else if (details.primaryVelocity! < 0) {
          // Right to left swipe
          setState(() {
            if (selectedIndex < imageWidgets.length - 1) {
              selectedIndex++;
            }
          });
        }
      },
      child: Stack(
          children:[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                color: white,
              ),
              child: PageView(
                physics: BouncingScrollPhysics(),
                  onPageChanged: (int index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  //controller: _pageController, // Use the PageController here
                  scrollDirection: Axis.horizontal,
                  children: imageWidgets
              ),
            ),

            Positioned(
              top: MediaQuery.sizeOf(context).height*0.02,
              right: MediaQuery.sizeOf(context).height*0.02,
              child: InkWell(
                onTap: () async {
                  // Hide any currently showing SnackBar
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();

                  try {
                    await WishlistManager.addProductToWishlist(widget.product);
                    CustomSnackBar.show(context, "${widget.product.title} added to wishlist!",action: SnackBarAction(label: "Undo", onPressed:  ()async{
                      await WishlistManager.removeProductFromWishlist(widget.product);
                      setState(() {

                      });
                    }));
                  } catch (error) {
                    CustomSnackBar.show(context, 'Error adding ${widget.product.title} to wishlist');
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.01),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0,0),
                          blurRadius: 1,
                          spreadRadius: 1,
                        )
                      ]
                  ),
                  child: Icon(
                    Icons.favorite_border, // Example icon, change as needed
                    color: black,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height*0.04,
              left: MediaQuery.sizeOf(context).height*0.02,
              right: MediaQuery.sizeOf(context).height*0.02,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(imageWidgets.length, (index) {
                  return Dot(color: index == selectedIndex? white :  Colors.grey);
                }),
              ),
            ),
          ]
      ),
    );
  }

  Widget colorImageCon(String img, int index)
  {
    return Container(
      margin: EdgeInsets.only(right: MediaQuery.sizeOf(context).height*0.02),
      width: MediaQuery.sizeOf(context).width*0.2,
      height: MediaQuery.sizeOf(context).height*0.15,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color:selectedColorImage == index? black : white,width: 1), // Border color
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget sizesCon(String title,int index)
  {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSizeIndex = index; // Update the selected size on tap
        });
      },
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).height*0.075,
            maxHeight: MediaQuery.sizeOf(context).height*0.05
        ),
        decoration: BoxDecoration(
          color: selectedSizeIndex == index ? primaryColor : white, // Highlight if selected
          border: Border.all(color: selectedSizeIndex == index  ? primaryColor : black.withOpacity(0.15), width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          sizes[index],
          style: TextStyle(
            color: selectedSizeIndex == index ? white : black,
            fontSize: MediaQuery.sizeOf(context).height*0.018,
            fontFamily: "OpenSans_SemiBold"
          ),
        ),
      ),
    );
  }
}
