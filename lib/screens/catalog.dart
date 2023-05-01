import 'package:flutter/material.dart';
import 'package:shopping_app/models/user.dart';
//import 'package:shopping_app/bottom_navigation.dart';
import 'package:shopping_app/screens/cart.dart';
// import 'package:shopping_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/utils/constants.dart';

List<String> catalogOption=["Code Small","Control Flow","Interpreter","Recursion","Sprint","Heisenburg","Scope","Callback","Spaghetti","Pumpkin"];
List  colors=[Colors.brown,Colors.redAccent,Colors.purple,Colors.indigo,Colors.blue,Colors.teal,Colors.green,Colors.yellow,Colors.amber,Colors.orange];

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  var formKey = GlobalKey<FormState>();

  User1 user= User1();
  @override
  @override
  List<Widget> listCatalogFunc()
  {
    List<Widget> data=[];
    for(int i=0;i<catalogOption.length;i++)
    {
      data.add(Row(
        children: [
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            // padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.all(10),
            decoration: new BoxDecoration(
              color: colors[i] ,
            )
          ),
          Expanded(child: Text(catalogOption[i],style: TextStyle(fontSize: 20))),

          Container(
            child: Container(
              child:
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Colors.grey[50], // Change the color here..
                elevation: 0,
                // onPrimary: Colors.amberAccent,
      ),
                // onHover: ,
                // child: Text((user.Selected[i]==false)?"Add":Icon(Icons.shopping_cart).toString(),style: TextStyle(color: Colors.black) )
                child: (user.Selected[i]==false)?Text("Add",style: TextStyle(color: Colors.black)):Icon(Icons.check,color: Colors.black,)
                , onPressed: (){
                 setState(() {
                  if(user.Selected[i]==true)user.Selected[i]=false;
                  else user.Selected[i]=true;
                });
              },)
              // CheckboxListTile(
              // title: Text(catalogOption[i]),
              // value: user.Selected[i],
              // onChanged: (bool? value) {
              //   setState(() {
              //     user.Selected[i]=value;
              //   });
              // })
            ),
          )
        ],
      ));
    }
    return data;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,

      drawer: Drawer(
        // backgroundColor: Colors.amber,
        child: Column(
          children: [

            const UserAccountsDrawerHeader(
              accountName: Text('Aman Sharma'),
              accountEmail: Text('aman20csu009@ncuindia.edu'),

              currentAccountPicture: CircleAvatar(
                // backgroundImage: AssetImage('images/alex_unsplash.jpg'),

              ),
            ),

            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add Product'),
              onTap: () {
                Navigator.pushNamed(context, ConstantRoutes.ADD_PRODUCT_ROUTE);
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search Product'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () async{
                FirebaseAuth.instance.signOut();
                await Future.delayed(Duration(seconds: 1));  
                Navigator.pushNamed(context, ConstantRoutes.LOGIN_ROUTE);
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        title: Text('Catalog', style: TextStyle(color: Colors.black, fontFamily: "Montserrat"),),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        iconTheme: IconThemeData( color: Colors.black,),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: (){
             Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart(user: user,catalogOption:catalogOption))
            );
          },
          )
        ],
      ),
      //bottomNavigationBar: const BottomNavigation(),


      body: Container(
        // margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
                key: formKey,
                // autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: listCatalogFunc(),
                )),
           
          ],
        ),
      ),
    );
  }
}