
import 'package:provider/provider.dart';
import 'package:shopping_app/models/password.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/models/password_model.dart';

class PasswordResetFormField extends FormField<Passwords>{
  
  // final passModel = Provider.of<PasswordModel>(context); //??? what this

  PasswordResetFormField({
    FormFieldSetter<Passwords>? onSaved,
    FormFieldValidator<Passwords>? validator,
    Passwords? initialValue,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    required TextEditingController passwordCtrl,
    required TextEditingController passConfirmCtrl

  }) : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            builder: (FormFieldState<Passwords> state) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        controller: passwordCtrl,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        ),
                        onChanged: (String value) {
                          state.value?.password = value;
                          state.didChange(state.value);
                        },
                      ),
                    ),
                    Container(
                    margin: EdgeInsets.all(10),
                      child: TextField(
                        controller: passConfirmCtrl,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        ),
                        onChanged: (String value) {
                          state.value?.confirmPassword = value;
                          state.didChange(state.value);
                        },
                      ),
                    ),
                    
                    // state.hasError
                    //     ? Text(
                    //         state.errorText.toString(),
                    //         style: TextStyle(color: Colors.red),
                    //       )
                    //     : Container(),

                    state.hasError ? Text(state.errorText.toString(), style: TextStyle(color: Colors.red),) : Container()
                    
                  ],
                ),
              );
            });
            
}