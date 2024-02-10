import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lakesamerica/CustomWidgets/ShopPageProductsGridview.dart';

import '../Constants/colors.dart';
import '../CustomWidgets/PriceRangeFilter.dart';
import '../CustomWidgets/Sort&Filter.dart';

class AllProductsPage extends StatefulWidget {
   AllProductsPage({super.key, required this.title, required this.img});

  String title;
  String img;

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  bool _isVisible = true;
  String _selectedSize = "Filter & Sort";
  Color filter = secondaryColor;
  String filterText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filterText = widget.title == ''? "In Store"  : widget.title;
    if(widget.title == '')
      {
        widget.title = "All Products";
      }
    if(widget.img == '')
      {
        widget.img = 'https://img.freepik.com/free-photo/vivid-blurred-colorful-wallpaper-background_58702-2734.jpg?w=2000&t=st=1707485383~exp=1707485983~hmac=3b12060362abad3a6ee41c47c7051eae1946d7e61695f101621496b1bca53e10';
      }

  }

  double maxCross = 0.25;
  double childAspect = 0.475;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: ()=> Navigator.pop(context),
            child: Icon(Icons.arrow_back,color: black,size: MediaQuery.sizeOf(context).height*0.03,)),
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: "OpenSans_SemiBold",
            fontSize: MediaQuery.of(context).size.height * 0.024,
          ),
        ),
      ),

      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: MediaQuery.sizeOf(context).height*0.225,
            backgroundColor: white,
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            title: Stack(
              children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.2,
                foregroundDecoration: BoxDecoration(
                  color: black.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(3)
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    image: DecorationImage(
                        image: NetworkImage(
                            widget.img
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        opacity: 0.75)

                ),
              ),

                Positioned(
                    top: 0,bottom: 0,left: 40,right: 20,
                    child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("20% off \$80 + free shipping!",maxLines: 2,textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,style: TextStyle(
                                color: white,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.035
                              ),),
                            SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
                        
                            Text("Start shopping for spring",maxLines: 1,textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,style: TextStyle(
                                  color: white,fontFamily: "OpenSans",fontSize: MediaQuery.sizeOf(context).height*0.02
                              ),),
                          ],
                        ),
                      ),

                      Icon(Icons.info_outline,color: white,size: MediaQuery.sizeOf(context).height*0.03,)
                    ],
                  ),
                ))
            ]
            ),
            centerTitle: true, // Ensures the title is centered in the AppBar
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Container(
                height: MediaQuery.of(context).size.height*0.065,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
                  scrollDirection: Axis.horizontal,
                  children: [

                    //Sort By
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          context: context,
                          builder: (BuildContext context) => const SortandFilter(),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        //width: MediaQuery.of(context).size.width*0.25,

                        margin: const EdgeInsets.only(right: 15),
                        padding: const EdgeInsets.only(left: 25,right: 25,bottom: 5,top: 5),

                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black.withOpacity(0.2)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 1,
                                  offset: const Offset(0, 0))
                            ]),
                        child: Row(
                          children: [

                            // Transform(
                            //   alignment: Alignment.center,
                            //   transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
                            //   child: const Icon(Icons.sort,size: 17,),
                            // ),

                            Icon(Icons.filter_list_outlined,size: 17,color: black,),

                            const SizedBox(width: 5,),

                            Text(
                              "$_selectedSize",
                              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                            ),

                            const SizedBox(width: 5,),

                            const Icon(Icons.keyboard_arrow_down,size: 18,)
                          ],
                        ),
                      ),
                    ),

                    //In Store Container
                    GestureDetector(
                      onTap: ()
                      {
                        if(filter == secondaryColor)
                          {
                            setState(() {
                              filter = white;
                            });
                          }else{
                          setState(() {
                            filter = secondaryColor;
                          });
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        //width: MediaQuery.of(context).size.width*0.25,

                        margin: const EdgeInsets.only(right: 15),
                        padding: const EdgeInsets.only(left: 25,right: 25,bottom: 5,top: 5),
                        decoration: BoxDecoration(
                            color: filter,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: filter == secondaryColor? secondaryColor : Colors.black.withOpacity(0.2)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 1,
                                  offset: const Offset(0, 0))
                            ]),
                        child: Text(
                          filterText,
                          style:  TextStyle(color: (filter == secondaryColor)? Colors.white : Colors.black ,fontWeight: FontWeight.bold,fontSize: 12),
                        ),
                      ),
                    ),

                    //Price Range
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(

                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),),
                          context: context,
                          builder: (BuildContext context) {
                            return  Container(
                                height: MediaQuery.of(context).size.height*0.35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: PriceRangeFilter());
                          },
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        //width: MediaQuery.of(context).size.width*0.25,

                        margin: const EdgeInsets.only(right: 0),
                        padding: const EdgeInsets.only(left: 25,right: 25,bottom: 5,top: 5),

                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black.withOpacity(0.2)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 1,
                                  offset: const Offset(0, 0))
                            ]),
                        child: Row(
                          children: [

                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: white,
                                    border: Border.all(color: Colors.black.withOpacity(0.5))
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.black.withOpacity(0.5),
                                  //     spreadRadius: 1,
                                  //     blurRadius: 0.5,
                                  //     offset: Offset(0,0)
                                  //   )
                                  // ]
                                ),
                                padding: const EdgeInsets.all(2),
                                child: const Icon(Icons.price_check,size: 12,)),

                            const SizedBox(width: 5,),

                            const Text(
                              "Price Range",
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                            ),

                            const SizedBox(width: 5,),

                            const Icon(Icons.keyboard_arrow_down,size: 18,)
                          ],
                        ),
                      ),
                    ),

                    //Clear all Filters
                    GestureDetector(
                      onTap: ()
                      {

                      },
                      child: Container(
                        alignment: Alignment.center,
                        //width: MediaQuery.of(context).size.width*0.25,

                        padding: const EdgeInsets.only(left: 25,right: 25,bottom: 5,top: 5),
                        // decoration: BoxDecoration(
                        //     color: inStoreColor,
                        //     borderRadius: BorderRadius.circular(20),
                        //     boxShadow: [
                        //       BoxShadow(
                        //           color: Colors.black.withOpacity(0.15),
                        //           blurRadius: 1,
                        //           offset: const Offset(0, 0))
                        //     ]),
                        child: const Text(
                          "Clear all",
                          style:  TextStyle(color: Colors.black,fontSize: 13),
                        ),
                      ),
                    ),

                  ],
                ),
              )
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.01,vertical: MediaQuery.sizeOf(context).height*0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [

                      Text("965 Items",style: TextStyle(
                        color: black,fontFamily: "OpenSans_SemiBold",fontSize: MediaQuery.sizeOf(context).height*0.016
                      ),),

                      SizedBox(width: MediaQuery.sizeOf(context).height*0.01,),

                      InkWell(
                          onTap: ()
                          {
                            setState(() {
                              maxCross = 0.25;
                              childAspect = 0.475;
                            });
                          },
                          child: Icon(Icons.crop_square,color: black,size: MediaQuery.sizeOf(context).height*0.03,)),

                      SizedBox(width: MediaQuery.sizeOf(context).height*0.01,),

                      InkWell(
                          onTap: ()
                          {
                            setState(() {
                              maxCross = 0.425;
                              childAspect = 0.95;
                            });
                          },
                          child: Icon(Icons.grid_view_outlined,color: black,size: MediaQuery.sizeOf(context).height*0.03,)),

                    ],
                  ),
                ),

                ShopPageProductsGridView.custom(maxCross, childAspect)

              ],
            )
          ),
        ],
      ),

    );
  }
}
