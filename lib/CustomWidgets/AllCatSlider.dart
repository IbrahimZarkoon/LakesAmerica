import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Routes/PageRoutes.dart';

class AllCatSlider extends StatefulWidget {
  const AllCatSlider({super.key});

  @override
  State<AllCatSlider> createState() => _AllCatSliderState();
}

class _AllCatSliderState extends State<AllCatSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height*0.18,
          padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.015),
          //color: Colors.blue,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(right: MediaQuery.sizeOf(context).height*0.015),
            children: [

              productCon(context, "Trousers",
                  "Men",
                  "https://image.hm.com/assets/hm/0d/eb/0deb1eea741c464de7da245a5efcae46bec2a1c0.jpg?imwidth=657"),

              productCon(context, "Tops",
                  "Women",
                  "https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F9d%2F28%2F9d28116c2e1cec1e606511f78c2d99d9bd4ce949.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D"),

              productCon(context, "Hoodies",
                  "Men",
                  "https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2Fbb%2F1a%2Fbb1ab6ddb21543657c9bc2e5a5e6213d560adc7e.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D"),

              productCon(context, "Cardigans",
                  "Women",
                  "https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F48%2Fde%2F48ded15ccb3c968728abcdc6dd8d99a7b47e390f.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_premium_selection_cardigansjumpers%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D"),
              productCon(context, "Jumpers",
                  "Women",
                  "https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F48%2Fde%2F48ded15ccb3c968728abcdc6dd8d99a7b47e390f.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_premium_selection_cardigansjumpers%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D"),

              productCon(context, "New Arrivals",
                  "Men",
                  "https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F30%2F21%2F30217c66660ea1d25500a857632da9e63bf281de.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bmen_tshirtstanks_shortsleeve%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]"),




            ],
          ),
        )


      ],
    );
  }

  Widget productCon(BuildContext context,String title,String category,String img)
  {
    return InkWell(
      onTap: ()
      {
        // navigateToAllProductsPage(
        //     context,
        //     img,
        //     title);
      },
      child: Container(
        //color: Colors.red,
        //padding: EdgeInsets.all(MediaQuery.si),
        width: MediaQuery.sizeOf(context).width*0.18,
        margin: EdgeInsets.only(right: MediaQuery.sizeOf(context).height*0.005),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),

            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                '$img',
                width: MediaQuery.sizeOf(context).height*0.075,
                height: MediaQuery.sizeOf(context).height*0.075,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
            Text(
              '$category',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).height*0.012,
                  fontFamily: "OpenSans_SemiBold",color: black.withOpacity(0.5)
              ),
            ),
            Text(
              '$title',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).height*0.015,
                  fontFamily: "OpenSans_Bold",color: black
              ),
            ),
          ],
        ),
      ),
    );

  }
}
