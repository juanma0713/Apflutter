
import 'package:flutter/material.dart';

class InputDecorations {
     static InputDecoration inputDecoration ({
        required String hintext,
        required String labeltext,
        required Icon icono
     
     }) {
         return  InputDecoration(
            enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color:  Color.fromARGB(255, 96, 193, 231)),
            ),
            focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
            color: Color.fromARGB(255, 96, 193, 231), width:2
             ),
           ),
         
                                        
           labelText: labeltext,
            prefixIcon: icono,
         );
         
     }
}