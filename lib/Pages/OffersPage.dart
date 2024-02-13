import 'package:flutter/material.dart';
import 'package:lakesamerica/CustomWidgets/Headings.dart';
import 'package:lakesamerica/CustomWidgets/OffersPageProductsSlider.dart';
import 'package:lakesamerica/Routes/PageRoutes.dart';

import '../Constants/colors.dart';
import '../CustomWidgets/TrendingContainer.dart';
import '../Models/Product.dart';
import 'Dashboard.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> with SingleTickerProviderStateMixin{
  late Animation<double> _animation;
  late AnimationController _controller;


  int initialPage = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Product>? saleProducts = [
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
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [

          //Top Offer Con

          topOfferCon(
              "",
              "Winter Sale",
              "Up to 70% off online & in-store is almost gone!",
              "Shop our biggest deals ever before it's too late."
          ),

          Container(
            height: MediaQuery.sizeOf(context).height*0.5,
            child: Stack(
              children: [
              PageView(
                onPageChanged: (int index) {
                  setState(() {
                    initialPage = index;
                  });
                },
                //controller: _pageController, // Use the PageController here
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  TrendingContainer(
                      title: "Embrace Winter Elegance",
                      price: "32.49",
                      shortDesc:
                          "Discover Your Perfect Warmth: Trench Coats & More for the Season.",
                      img:
                          "https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F0a%2F1b%2F0a1bd7516b51c302c823f8257a815d9f6c9068dc.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D"),

                  TrendingContainer(
                      title: "Timeless Jeans & Tops",
                      price: "27.49",
                      shortDesc:
                          "Redefine Your Everyday Look with Our Latest Denim Collection.",
                      img:
                          "https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F3f%2Fdc%2F3fdce35c3ad4891c666aad4748a1c5314b034f34.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D"),
                  TrendingContainer(
                      title: "Vacation-ready swimwear",
                      price: "24.99",
                      shortDesc:
                      "From classic staples to playful patterned options, find the perfect swim trunks for your gateway.",
                      img:
                      "https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F11%2F4b%2F114b1d99073ede6a8df9487b9d1dbbd04a4f2b14.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D"),
                ],
              ),
                initialPage == 2? SizedBox(): Positioned(
                  right: MediaQuery.sizeOf(context).height*0.02,

                  top: MediaQuery.sizeOf(context).height*0.04,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => DashboardPage(tabindex: 1)));
                    },
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset( 7.5 * _animation.value,0.0),
                          child: Row(
                            children: [

                              Text("Explore",style: TextStyle(
                                  color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.018
                              ),),
                              Icon(
                                Icons.keyboard_arrow_right,
                                size: MediaQuery.sizeOf(context).height*0.05,
                                color: black,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    // child: AnimatedBuilder(
                    //   animation: _animation,
                    //   builder: (context, child) {
                    //     return Transform.translate(
                    //       offset: Offset(0.0, 20.0 * _animation.value),
                    //       child: const Icon(
                    //         Icons.keyboard_arrow_up,
                    //         size: 50,
                    //         color: Colors.white,
                    //       ),
                    //     );
                    //   },
                    // ),
                  ),
                )

              ]
            ),
          ),

          //First Offer con
          Stack(
            children: [

              Container(
                height: MediaQuery.sizeOf(context).height*0.2,
                width: MediaQuery.sizeOf(context).width,
                foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3)
                ),
                decoration: BoxDecoration(
                    color: Color(0xfff5f0e0)
                ),
              ),

              Positioned(
                  top: 0,bottom: 0,left: MediaQuery.sizeOf(context).height*0.015,right: MediaQuery.sizeOf(context).height*0.015,
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Just for you \$20 off your first order!",textAlign: TextAlign.center,style: TextStyle(
                              color: secondaryColor,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.026
                          ),),
                        ),

                        SizedBox(width: MediaQuery.sizeOf(context).height*0.005,),

                        Icon(Icons.info_outline,color: secondaryColor,size: MediaQuery.sizeOf(context).height*0.03,),

                        SizedBox(width: MediaQuery.sizeOf(context).height*0.015,),

                      ],
                    ),
                  ))

            ],
          ),

          SizedBox(height: MediaQuery.sizeOf(context).height*0.015,),


          //Products Slider
          Headings(context, "Exclusive Offers & Deals"),

          OffersPageProductSlider.custom(snapshot: saleProducts),

          Headings(context, "Upto 70% off"),

          OffersPageProductSlider(),



        ],
      ),
    );
  }


  Widget topOfferCon(String img,String title,String subheading,String intro)
  {
    return InkWell(
      onTap: ()
      {
        navigateToAllProductsPage(context, img, title);
      },
      child: Stack(
        children: [

          Container(
            height: MediaQuery.sizeOf(context).height*0.35,
            width: MediaQuery.sizeOf(context).width,
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3)
            ),
            decoration: BoxDecoration(
                color: secondaryColor
            ),
          ),

          Positioned(
              top: 0,bottom: 0,left: MediaQuery.sizeOf(context).height*0.02,right: MediaQuery.sizeOf(context).height*0.02,
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(title,textAlign: TextAlign.center,style: TextStyle(
                              color: white,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.018,letterSpacing: 5
                          ),),

                          SizedBox(height: MediaQuery.sizeOf(context).height*0.015,),


                          Text(subheading,textAlign: TextAlign.center,style: TextStyle(
                              color: white,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.028
                          ),),

                          SizedBox(height: MediaQuery.sizeOf(context).height*0.015,),

                          Text(intro,textAlign: TextAlign.center,style: TextStyle(
                              color: white.withOpacity(0.9),fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.0165
                          ),),
                        ],
                      ),
                    ),

                  ],
                ),
              ))

        ],
      ),
    );
  }
}
