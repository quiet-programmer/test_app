import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:my_template/app/auth/wrapper.dart';
import 'package:my_template/components/product_list_component.dart';
import 'package:my_template/const_value.dart';
import 'package:my_template/functions/loading_indicator.dart';
import 'package:my_template/functions/navigate_to.dart';
import 'package:my_template/models/product_model.dart';
import 'package:my_template/models/user_model.dart';
import 'package:my_template/request/get_request.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box<UserModel>? storeData;

  bool isLoading = false;

  List? data = [];

  Future fetchTransactions() async {
    setState(() {
      isLoading = true;
    });

    var res = await GetRequest.makeGetRequest(
      requestEnd: 'products',
      context: context,
    );

    logger.i(res);

    if (res != null) {
      if (mounted) {
        setState(() {
          data = res;
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            LucideIcons.listFilter,
            color: frontColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              storeData!.delete(tokenKey);
              navigateEndTo(context, destination: const Wrapper());
            },
            icon: Icon(
              LucideIcons.logOut,
              color: frontColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Most Popular Today',
                style: GoogleFonts.dmSans(
                    fontSize: 25.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            isLoading == true
                ? platformLoadingIndicator()
                : data!.isEmpty
                    ? Center(
                        child: Text(
                          'No Product available',
                          style: GoogleFonts.dmSans(
                              fontSize: 25.sp, fontWeight: FontWeight.bold),
                        ),
                      )
                    : GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 2 / 3,
                        ),
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data!.length,
                        itemBuilder: (_, index) {
                          ProductModel product =
                              ProductModel.fromJsonProduct(data![index]);
                          return ProductListComponent(
                            product: product,
                          );
                        },
                      ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
