import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/menu_drawer.dart';
import 'package:shopping_app/utils/constants.dart';
// import 'package:kitchenease/custom/password_form_field.dart';
// import 'package:kitchenease/model/user.dart';
// import 'package:kitchenease/custom/check_box_form_field.dart';
// import 'package:kitchenease/model/password.dart';
// import 'package:kitchenease/navigation/bottom_navigation.dart';
// import 'package:kitchenease/navigation/menu_drawer.dart';
// import 'package:kitchenease/screens/profile_page.dart';
// import 'package:kitchenease/screens/shopping_cart_page.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => AddProductState();
}

// enum CategoryOptions { Pantry, Fridge, Freezer}

class AddProductState extends State<AddProduct> {
  var _formKey = GlobalKey<FormState>();
  // CategoryOptions gender = CategoryOptions.Pantry;

  @override
  @override
  Widget build(BuildContext context) {

    var student = {};
    // var student = {'RegId':' ', 'Name':' ', 'Email':' ', };
    // student['course'] = 'Bcom';
    var Transfer = [];

    // User user = User();

    String dropdownvalue = 'Courses';
    List<String> dropdownitems= [
      'Courses','FullStack','Cloud Computing','Artificial Intelligence'];
    
    return Scaffold(
      resizeToAvoidBottomInset : false,

      appBar: AppBar(
        title: Text('Add Product'),
        // backgroundColor: Colors.red, 
        centerTitle: true,

      ),

      // drawer: const MenuDrawer(),
      // bottomNavigationBar:const BottomNavigation(),

      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('User Name'),
              accountEmail: Text('useremail@example.com'),
              currentAccountPicture: CircleAvatar(
                // backgroundImage: AssetImage('images/alex_unsplash.jpg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add Product'),
              onTap: () {},
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

      body: Container(
        height: double.infinity,
        width: double.infinity,
        // color: Color.fromARGB(255, 251, 105, 105),
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     fit: BoxFit.cover, image: AssetImage('images/bg.png')
        //   ),
        // ),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Container(
        padding: EdgeInsets.fromLTRB(0, 20, 5, 20),

            child: ListView(
              children: [
                
                Form(
                  key: _formKey,
                  // autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [

                      // UserAccountsDrawerHeader(
                      //   accountName: Text('User Name'),
                      //   accountEmail: Text('useremail@example.com'),
                      //   currentAccountPicture: CircleAvatar(
                      //     // backgroundImage: AssetImage('images/alex_unsplash.jpg'),
                      //   ),
                      // ),

// //------------------------------------Red Id-------------------------------------------
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: '',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            print("<<Validating Item Id field>>");
                            if (value!.isEmpty) {
                              return "Provide Item Id";
                            }
                            return null; // successful validation
                          },

                          // decoration: InputDecoration(labelText: 'Product ID',
                          decoration: InputDecoration(labelText: "Item Id",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          onSaved: (String? value) {
                                // _id = value;
                              },
                        ),
                      ),

// //------------------------------------Name-------------------------------------------
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: '',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            print("<<Validating Item Name field>>");
                            if (value!.isEmpty) {
                              return "Provide Item name";
                            }
                            return null; // successful validation
                          },

                          decoration: InputDecoration(labelText: "Item Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          // decoration: const InputDecoration(labelText: "Item Name"),
                          onSaved: (String? value) {
                                // user.Name = value.toString();
                              },
                        ),
                      ),

// //------------------------------------Quantity-------------------------------------------
                      
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: '',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            print("<<Validating Item Price field>>");
                            if (value!.isEmpty) {
                              return "Provide Item Price";
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please enter valid price';
                            }
                            return null; // successful validation
                          },

                          // decoration: const InputDecoration(labelText: "Item Price"),
                          decoration: InputDecoration(labelText: 'Price',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (String? value) {
                            // _price = double.parse(value);
                          },
                        ),
                      ),
                      
// //------------------------------------Expiry Date-------------------------------------------
                      // Image.network(""),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: '',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            print("<<Validating Image Url field>>");
                            if (value!.isEmpty) {
                              return "Provide Image Url";
                            }
                            return null; // successful validation
                          },

                          // decoration: const InputDecoration(labelText: "Image Url"),
                          decoration: InputDecoration(labelText: 'Photo URL',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          onSaved: (String? value) {
                            // _photoUrl = value;
                          },
                        ),
                      ),

// //------------------------------------Expiry Date-------------------------------------------
                      
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: '',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            print("<<Validating Description field>>");
                            if (value!.isEmpty) {
                              return "Provide Description";
                            }
                            return null; // successful validation
                          },

                          // decoration: const InputDecoration(labelText: "Description"),
                          decoration: InputDecoration(labelText: 'Description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          onSaved: (String? value) {
                            // _description = value;  
                          },
                        ),
                      ),

// //------------------------------------Expiry Date-------------------------------------------
                      
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: '',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            print("<<Validating Quantity field>>");
                            if (value!.isEmpty) {
                              return "Provide Quantity";
                            }
                            if (int.tryParse(value) == null) {
                              return 'Provide valid Quantity';
                            }
                            return null; // successful validation
                          },
                          
                          decoration: InputDecoration(
                            labelText: 'Quantity', 
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (String? value) {
                            // _quantity = int.parse(value);
                          },
                        ),
                      ),

                    ],
                  )
                ),

//------------------------------------Submit Button-------------------------------------------
                Container(
                  // margin: EdgeInsets.fromLTRB(0, 20 , 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          // (){
                          //   // Navigator.pushNamed(context, ConstantRoutes.ADD_PRODUCT_ROUTE);
                          // }, 
                          child: Text("Add")
                        )
                      ),
                      
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: _resetForm,
                          // (){
                          //   // Navigator.push(
                          //   //         context, MaterialPageRoute(builder: (_) => Register()));
                          //   // Navigator.pushNamed(context, '/Register');
                          //   Navigator.pushNamed(context, ConstantRoutes.ADD_PRODUCT_ROUTE);
                          // }, 
                          child: Text("Reset")
                        )
                      ),
                    ],
                  )
                )
              ],
            ),
          ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: Add product to database
      // Navigator.pushNamed(context, RoutesConstants.LOGIN);
    }
  }
  void _resetForm() {
    _formKey.currentState!.reset();
    // Navigator.pop(context);
  }


}
