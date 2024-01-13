import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_template/app/screens/tab_view/home_view/product_details.dart';
import 'package:my_template/const_value.dart';
import 'package:my_template/functions/navigate_to.dart';
import 'package:my_template/models/product_model.dart';
import 'package:my_template/utils/hex_to_color.dart';

class ProductListComponent extends StatefulWidget {
  final ProductModel? product;

  const ProductListComponent({super.key, required this.product});

  @override
  State<ProductListComponent> createState() => _ProductListComponentState();
}

class _ProductListComponentState extends State<ProductListComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context,
            destination: ProductDetails(
              id: widget.product!.id,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage('${widget.product!.image}'),
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
                      '${widget.product!.rating!['rate']}',
                      style: GoogleFonts.dmSans(
                        color: defaultWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.product!.title}',
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
                          '${currencyFormatter(widget.product!.price, '\$')}',
                          style: GoogleFonts.dmSans(
                            color: defaultWhite,
                            fontSize: 16.sp,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        GestureDetector(
                          child: FaIcon(
                            FontAwesomeIcons.heart,
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
            )
          ],
        ),
      ),
    );
  }
}
