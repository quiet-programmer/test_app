import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:my_template/const_value.dart';
import 'package:my_template/functions/loading_indicator.dart';
import 'package:my_template/models/product_model.dart';
import 'package:my_template/models/user_model.dart';
import 'package:my_template/request/get_request.dart';
import 'package:my_template/utils/hex_to_color.dart';
import 'package:my_template/widgets/mbutton.dart';

class ProductDetails extends StatefulWidget {
  final int? id;

  const ProductDetails({super.key, this.id});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Box<UserModel>? storeData;

  bool isLoading = false;

  Map? data = {};

  ProductModel? product;

  Future fetchTransactions() async {
    setState(() {
      isLoading = true;
    });

    var res = await GetRequest.makeGetRequest(
      requestEnd: 'products/${widget.id}',
      context: context,
    );

    logger.i(res);

    if (res != null) {
      if (mounted) {
        setState(() {
          data = res;
          product = ProductModel.fromJsonProduct(data);
        });
      }
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    storeData = Hive.box<UserModel>(userModel);
    fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading == true
          ? Center(
              child: platformLoadingIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 300.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage('${product!.image}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${product!.title}',
                                    style: GoogleFonts.dmSans(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.clip,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                        '${product!.rating!['rate']}',
                                        style: GoogleFonts.dmSans(
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: frontColor,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${product!.category}',
                                        style: GoogleFonts.robotoMono(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Product details',
                                  style: GoogleFonts.robotoMono(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              Text(
                                '${product!.description}',
                                style: GoogleFonts.dmSans(
                                  fontSize: 14.sp,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  height: 100,
                  decoration: BoxDecoration(
                    color: grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${currencyFormatter(product!.price, '\$')}',
                          style: GoogleFonts.dmSans(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: MButton(
                          radius: 30,
                          title: 'Add to Cart',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
    );
  }
}
