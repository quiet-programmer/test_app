import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_template/components/product_list_component.dart';
import 'package:my_template/const_value.dart';
import 'package:my_template/functions/navigate_to.dart';
import 'package:my_template/models/favourite_manager.dart';
import 'package:my_template/models/product_model.dart';
import 'package:my_template/utils/hex_to_color.dart';

import 'home_view/product_details.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  Box<ProductModel>? storeProductData;

  @override
  void initState() {
    super.initState();
    storeProductData = Hive.box<ProductModel>(productModel);
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> favorites = FavoriteManager.getFavorites();
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 55.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Fav',
                style: GoogleFonts.dmSans(
                    fontSize: 25.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            ValueListenableBuilder(
                valueListenable: storeProductData!.listenable(),
              builder: (context, Box<ProductModel> userData, _) {
                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 2 / 3,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        navigateTo(context,
                            destination: ProductDetails(
                              id: favorites[index].id,
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage('${favorites[index].image}'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              defaultBlack.withOpacity(0.5),
                              BlendMode.darken,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10, top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.solidStar,
                                      color: hexToColor('#daa520'),
                                      size: 13.r,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      '${favorites[index].rating!['rate']}',
                                      style: GoogleFonts.dmSans(
                                        color: defaultWhite,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            ValueListenableBuilder(
                                valueListenable: storeProductData!.listenable(),
                                builder: (context, Box<ProductModel> userData, _) {
                                  return Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${favorites[index].title}',
                                            style: GoogleFonts.dmSans(
                                              color: defaultWhite,
                                              fontSize: 16.sp,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${currencyFormatter(favorites[index].price, '\$')}',
                                                style: GoogleFonts.dmSans(
                                                  color: defaultWhite,
                                                  fontSize: 16.sp,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  // FavoriteManager.toggleFavorite(userData);
                                                },
                                                child: FaIcon(
                                                  FavoriteManager.isFavorite(favorites[index].id!) == false ? FontAwesomeIcons.heart : FontAwesomeIcons.solidHeart,
                                                  color: frontColor,
                                                  size: 20.r,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
