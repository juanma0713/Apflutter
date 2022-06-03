import 'package:crud/db/operation.dart';
import 'package:crud/models/note.dart';
import 'package:flutter/material.dart';

class SavePage extends StatelessWidget {
 
 static const String ROUTE = "/save";

    final _formKey = GlobalKey<FormState>(); 
    final titleController = TextEditingController();
    final contentController = TextEditingController();

    
 
  @override
  Widget build(BuildContext context) {

 Object? note = ModalRoute.of(context)?.settings.arguments;

   _init;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Guardar"),
        ),
        body: Container(
          child: _buildForm(Note note),
          ),

    );
  }

  

  _init(Note note){

    titleController.text = note.title;
    contentController.text = note.content;

  }

  Widget _buildForm( Note note ){
     return Container(

      
      padding: const EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: Column(children: <Widget>[
        TextFormField(
          controller: titleController,
          validator: (value) {
              if (value!.isEmpty) {
                return 'Por Favor Ingrese Titulo';
              }
              return null;
            },
          
          decoration: const InputDecoration(
            labelText: "Titulo",
            border:  OutlineInputBorder (),//(borderRadius: BorderRadius.all(Radius.circular(20)))
          ),
        ),
       
       const SizedBox(height:15,
       ),
       
        TextFormField(
          controller: contentController,
          maxLines: 7,
          maxLength: 1000,
           validator: (value) {
              if (value!.isEmpty) {
                return 'Por Favor Ingrese Contenido';
              }
              return null;
            },
          decoration: const InputDecoration(
            labelText: "Contenido",
            border:  OutlineInputBorder ()//(borderRadius: BorderRadius.all(Radius.circular(20)))
          ),
        ),
       ElevatedButton(child: const Text("Guardar"),
       onPressed: () {
          if(_formKey.currentState!.validate()){
            
            if(note.title == null){
/*
              //Actualizacion
              note.title = titleController.text;
              note.content = contentController.text;
              Operation.update(note);
             
 

            }else*/
              //Insercion

              Operation.insert(
              Note(title: titleController.text, 
              content: contentController.text));


            }

            Operation.insert(
              Note(title: titleController.text, 
              content: contentController.text));


          }
        },
        ),
       ],
      ),
     ),
     
    );
  }
}