import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/Pages/Dashboard.dart';

import '../Constants/colors.dart';
import '../CustomWidgets/FavPageProductsGridview.dart';
import '../CustomWidgets/ShopPageProductsGridview.dart';
import '../Models/Product.dart';
import '../SharedPreferences/WishlistManager.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Future<List<Product>> _wishlistFuture;

  @override
  void initState() {
    super.initState();
    _wishlistFuture = WishlistManager.getWishlistProducts();
  }

  void _removeProductAndUpdate() {
    setState(() {
      _wishlistFuture = WishlistManager.getWishlistProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: RefreshIndicator(
        color: primaryColor,
        backgroundColor: white,
        edgeOffset: 0.5,
        displacement: MediaQuery.sizeOf(context).height*0.2,
        onRefresh: () async {
          await WishlistManager.getWishlistProducts();
        },
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: kToolbarHeight / 1.75,
              backgroundColor: white,
              elevation: 0, // Set elevation to 0 to remove the shadow
              title: Text(
                "Free Express Shipping over \$75",
                style: TextStyle(
                  fontFamily: "OpenSans_SemiBold",
                  fontSize: MediaQuery.of(context).size.height * 0.015,
                ),
              ),
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight / 1.5),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.015),
                  child: Text(
                    "Save these items permanently and manage them on any device by logging in or creating an account.",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "OpenSans_SemiBold",
                      fontSize: MediaQuery.of(context).size.height * 0.015,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: FutureBuilder<List<Product>>(
                future: _wishlistFuture,
                builder: (context, snapshot) {
                  //print(snapshot.error);
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error loading wishlist"));
                  } else if (snapshot.hasData) {
                    if (snapshot.data!.length > 0) {
                      // return ShopPageProductsGridView.custom(0.25, 0.475,snapshot: snapshot.data!,);
                      return FavProductsGrid(context, snapshot.data!, _removeProductAndUpdate);
                    } else {
                      return noWishlistProducts();
                    }
                  } else {
                    return noWishlistProducts();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );

  }

  Widget noWishlistProducts() {
    return Container(
      height: MediaQuery.sizeOf(context).height/2,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.015),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  CupertinoIcons.cube_box,
                  size: MediaQuery.sizeOf(context).height * 0.1,
                ),
                // Image.asset(
                //   'assets/images/EmptyFavIcon.png', // Replace with your asset image
                //   height: MediaQuery.of(context).size.height * 0.175,
                //   fit: BoxFit.fitHeight,
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height * 0.02),
                  child: Text(
                    "View all your favorite items here by adding to your love list.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                        fontFamily: "OpenSans_Bold"),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.02,
            child: Center(
              child: InkWell(
                onTap: () {
                  // Add your onTap functionality here
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DashboardPage(tabindex: 1)));
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.015,
                      bottom: MediaQuery.of(context).size.height * 0.015),
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height * 0.015),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Add to favorites",
                    style: TextStyle(
                      color: white,
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                      fontFamily: "OpenSans_SemiBold",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
