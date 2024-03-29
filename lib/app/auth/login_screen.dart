import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:my_template/app/auth/register_screen.dart';
import 'package:my_template/app/screens/tab_screen.dart';
import 'package:my_template/const_value.dart';
import 'package:my_template/functions/navigate_to.dart';
import 'package:my_template/models/user_model.dart';
import 'package:my_template/providers/user_provider.dart';
import 'package:my_template/request/post_request.dart';
import 'package:my_template/widgets/mNew_text_widget.dart';
import 'package:my_template/widgets/mbutton.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  Box<UserModel>? storeData;
  bool offText = true;
  bool isLoading = false;

  String? email;
  String? password;

  Future validateDetails() async {
    setState(() {
      isLoading = true;
    });

    var params = {
      'userLogin': '$email',
      'password': '$password',
    };

    var res = await PostRequest.makePostRequest(
      requestEnd: 'user/auth/authenticate',
      params: params,
      context: context,
    );

    logger.i(res);

    try {
      if (res['status'] == 200) {
        logger.i(res);
        Fluttertoast.showToast(msg: 'Authenticated.');
        UserModel user = UserModel.fromJsonUserDetails(res['data']);
        storeData!.put(userKey, user);

        UserModel tokenModel = UserModel.fromJsonLocalToken(res['data']);
        storeData!.put(tokenKey, tokenModel);

        if (mounted) {
          navigateEndTo(context, destination: const TabScreen());
        }
      }
    } catch (error) {
      if (error.toString().contains('Unhandled Exception')) {
        Fluttertoast.showToast(
          msg: 'Something went wrong, it\'s not you it\'s us.',
          gravity: ToastGravity.CENTER,
        );
      }
      setState(() {
        isLoading = false;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    storeData = Hive.box<UserModel>(userModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back👋',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Enter your Login details',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              MNewTextField(
                fieldName: 'user@email.com',
                sideText: 'Your Email',
                onSave: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              MNewTextField(
                fieldName: '*******',
                sideText: 'Your Password',
                isPasswordField: true,
                offText: offText,
                togglePasswordView: () {
                  setState(() {
                    offText = !offText;
                  });
                },
                onSave: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              MButton(
                title: 'Login',
                isLoading: isLoading,
                onPressed: () {
                  var form = formKey.currentState;
                  if(form!.validate()) {
                    form.save();
                    // logger.i(email);
                    validateDetails();
                  }
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              GestureDetector(
                onTap: () {
                  navigateTo(context, destination: const RegisterScreen());
                },
                child: Text(
                  'Don\'t have an Account ? Sign Up',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
