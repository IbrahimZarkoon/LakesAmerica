import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/Constants/colors.dart';

import '../Models/Product.dart';
import '../SharedPreferences/WishlistManager.dart';

class ShopPageProductsGridView extends StatelessWidget {

  ShopPageProductsGridView.custom(double max, double aspect){
   this.childAspect = aspect;
   this.maxCross = max;
  }

  ShopPageProductsGridView(){

  }

  double maxCross = 0.25;
  double childAspect = 0.475;
  // Example products data
  final List<Product> products = [
    {
      'image': 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F78%2F7e%2F787e1829d6187109fc0e4a86060a69524627d798.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
      'title': 'Regular Fit Jacket',
      'category': 'Men Jackets',
      'price': '\$99',
      'discountAmount' : '30%',
      'discountPrice' : '69',
    },
    {
      'image': 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F5a%2Fc2%2F5ac237b7320e3fde2b7dd25abe30c2ec3e75bedf.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
      'title': 'Regular Fit Twill top',
      'category': 'Men Tops',
      'price': '\$199','discountAmount' : '',
      'discountPrice' : '0',
    },
    {
      'image': 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F9a%2F32%2F9a326a674d8098187b56c96e3355a1ab15b84d6e.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
      'title': 'Regular Fit Twill Jacket',
      'category': 'Men Jacket',
      'price': '\$99','discountAmount' : '',
      'discountPrice' : '0',
    },
    {
      'image': 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F2e%2Fdd%2F2edd3ef227c08e59274ab4818934c8174aef2f45.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]',
      'title': 'Straight Regular Jeans',
      'category': 'Men Pants',
      'price': '\$199','discountAmount' : '30%',
      'discountPrice' : '69',
    },
    {
      'image': 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F79%2F44%2F7944a885374245793a75d963b0d2d8c5121eb7f1.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]',
      'title': 'Relaxed Fit Zip-top sweatshirt',
      'category': 'Men Sweatshirt',
      'price': '\$99',
      'discountAmount' : '30%',
      'discountPrice' : '69',
    },
    {
      'image': 'https://lp.arket.com/app006prod?set=quality%5B79%5D%2Csource%5B%2Fa1%2Ff9%2Fa1f9fe34758854edc6c1fb4f22fd95a1fe7be7b0.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D%2Ctarget%5Bhm.com%5D&call=url[file:/product/main]',
      'title': 'Men Sweatshirts',
      'category': 'Category 2',
      'price': '\$199','discountAmount' : '30%',
      'discountPrice' : '69',
    },
    // Add more products as needed
  ].map((productMap) => Product(
    image: productMap['image']!,
    title: productMap['title']!,
    category: productMap['category']!,
    price: productMap['price']!,
    discountAmount: productMap['discountAmount'] ?? "0.0",
    discountPrice: productMap['discountPrice'] ?? "0.0",
  )).toList();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding:  EdgeInsets.all(MediaQuery.sizeOf(context).height*0.015),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.sizeOf(context).height*maxCross, // Maximum extent for items
        childAspectRatio: childAspect, // Adjust the aspect ratio as needed
        crossAxisSpacing: MediaQuery.sizeOf(context).height*0.015, // Spacing between columns
        mainAxisSpacing: MediaQuery.sizeOf(context).height*0.0, // Spacing between rows
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ShopPageProdContainer(product: products[index]);
      },
    );
  }
}

class ShopPageProdContainer extends StatelessWidget {
  final Product product;

  const ShopPageProdContainer({Key? key, required this.product}) : super(key: key);

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
                  product.image,
                  width: double.infinity, // Makes the image take the full width of the container
                  height: MediaQuery.of(context).size.height * 0.3, // Fixed height for the image
                  fit: BoxFit.cover,
                ),
              ),
              if(double.parse(product.discountPrice) > 0)Positioned(
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
                    '-${product.discountAmount}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.sizeOf(context).height*0.017, // Adjust the font size as needed
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8.0,
                right: 8.0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                  decoration: BoxDecoration(
                    color: secondaryColor, // Customize the color as needed
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    'New Arrival',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0, // Adjust the font size as needed
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.005,
                right: MediaQuery.of(context).size.height * 0.005,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: ()
                      async{
                        WishlistManager.addProductToWishlist(product).then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${product.title} added to wishlist!')),
                          );
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error adding ${product.title} to wishlist')),
                          );
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: Offset(0,0),
                              blurRadius: 1.5,
                              spreadRadius: 1,
                            )
                          ]
                        ),
                        padding: EdgeInsets.all(5),
                        child: Stack(
                          children: [
                            Icon(
                              Icons.favorite_border_outlined,
                              color: black, // Outline color (black)
                              size: MediaQuery.of(context).size.height * 0.025,
                            ),

                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: MediaQuery.sizeOf(context).height*0.005,),

                    InkWell(
                      onTap: ()
                      async{

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                offset: Offset(0,0),
                                blurRadius: 1.5,
                                spreadRadius: 1,
                              )
                            ]
                        ),
                        padding: EdgeInsets.all(5),
                        child: Stack(
                          children: [
                            Icon(
                              Icons.add,
                              color: primaryColor, // Outline color (black)
                              size: MediaQuery.of(context).size.height * 0.025,
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
          SizedBox(height: 8),
          Text(
            product.title,
            style: TextStyle(
                fontFamily: "OpenSans_SemiBold",
                fontSize: MediaQuery.sizeOf(context).height*0.018,
                color: black
            ),
          ),
          SizedBox(height: 2),
          Text(product.category,style: TextStyle(
              fontFamily: "OpenSans_SemiBold",
              fontSize: MediaQuery.sizeOf(context).height*0.014,
              color: black.withOpacity(0.6)
          ),),
          SizedBox(height: 2),
          (double.parse(product.discountPrice) > 0)? Row(
            children: [
              Text(
                '\$${product.discountPrice}', // Display the discounted price with a '$' prefix
                style: TextStyle(
                  fontFamily: "OpenSans_SemiBold",
                    fontSize: MediaQuery.sizeOf(context).height*0.018,
                  color: secondaryColor
                ),
              ),
              SizedBox(width: MediaQuery.sizeOf(context).height*0.005), // Add some spacing between the prices
              Text(
                '${product.price}', // Display the original price with a '$' prefix
                style: TextStyle(
                  color: black,
                  fontSize: MediaQuery.sizeOf(context).height*0.014,
                  decoration: TextDecoration.lineThrough, // Add a line-through decoration
                ),
              ),
            ],
          )  : Text(
            product.price,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Dot(color: Color(0xff262427)), // Replace with your desired colors
              Dot(color: Color(0xff653c26)),
              Dot(color: Color(0xff402273)),
            ],
          ),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final Color color;

  const Dot({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).height*0.01,
      height: MediaQuery.sizeOf(context).height*0.01,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(0,0)
          )
        ],
        shape: BoxShape.circle,
        color: color,
      ),
      margin: EdgeInsets.only(right: 4.0),
    );
  }
}
