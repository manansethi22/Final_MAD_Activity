import 'package:flutter/material.dart';
import 'package:shopping_app/models/message.dart';
import 'package:shopping_app/models/seller.dart';
import 'package:shopping_app/screens/register.dart';
import 'package:shopping_app/services/seller_operations.dart';
import 'package:shopping_app/utils/constants.dart';
import 'package:shopping_app/utils/toast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}


class LoginState extends State<Login> {
  var formKey = GlobalKey<FormState>();

  late TextEditingController emailCtrl;
  late TextEditingController passwordCtrl;
  bool isLoggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      // appBar: AppBar(
        // title: Text('Login Form'),
        // backgroundColor: Colors.amberAccent, 
      // ),
      // drawer: const MenuDrawer(),
      // bottomNavigationBar:const BottomNavigation(),

      body: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[

            SizedBox(height: 20,),
            Text("Welcome",style: TextStyle(fontSize: 40,color: Colors.black, fontWeight: FontWeight.bold, )),


            // Image.asset('images/Shop.jpeg'),
            Container(
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     fit: BoxFit.cover, image: AssetImage(''images/Shop.jpeg'')
              //   ),
              // ),
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: emailCtrl,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  prefixIcon: Icon(Icons.login),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: passwordCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent, // Background color
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  ),
                  onPressed: (){
                    // Navigator.pushNamed(context, ConstantRoutes.ADD_PRODUCT_ROUTE);
                    _doLogin().then((value) async {
                          if (value == 1) {
                            await Future.delayed(Duration(seconds: 1));
                            Navigator.pushNamed(
                                // context, ConstantRoutes.ADD_PRODUCT_ROUTE
                                context, ConstantRoutes.CATALOG_ROUTE
                                );
                          }
                        });
                  }, 
                  child: Text("Login",style: TextStyle(color: Colors.black, fontSize: 20,),)
                  )
                ),
              
              Container(
                // alignment: Cc,
                // crossAxisAlignment:
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent, // Background color
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  ),
                  
                  onPressed: (){
                  // Navigator.push(
                  //         context, MaterialPageRoute(builder: (_) => Register()));
                  // Navigator.pushNamed(context, '/Register');
                  Navigator.pushNamed(context, ConstantRoutes.REGISTER_ROUTE);

                  }, 
                  child: Text("Register",style: TextStyle(color: Colors.black, fontSize: 20,),)
                )
              ),
            ],)


          ]
        ),
      )
    );
  }

  Future<int> _doLogin() async {
    String sellerId = emailCtrl.text;
    String password = passwordCtrl.text;
    Seller seller = Seller.takeInput(
        userId: sellerId, password: password, appId: Constants.APP_ID);
    SellerOperations opr = SellerOperations();
    Message msgObject = await opr.read(seller);
    createToast(msgObject.message, context);
    return msgObject.code;
  }

}
