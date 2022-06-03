
import 'package:crud/pages/list_page.dart';
import 'package:crud/widgets/input_decorations.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {

  static const String ROUTE = "/Login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(padding: EdgeInsets.all(20),
      child: Scaffold(
        
         floatingActionButton: FloatingActionButton(child: Text("Ir"),onPressed: () {
           Navigator.pushNamed(context, ListPage.ROUTE);
           
         },),

        body: Container(
          width:double.infinity,
          height: double.infinity,
          child: Stack(// el stack per,ite agregar varios widget en un solo div pudiendo superponerlos
            children: [
              cajapurpura(size),

              iconopersona(),

              loginform(context),
            
            ] ,
          ),
        ), 
      ),
    );
  }

   SingleChildScrollView loginform(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
              children: [
                const SizedBox(height: 300),
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 30), 
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 15,
                        offset: Offset(1 , 5),
                      ),
                    ]),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Login', 
                        style: Theme.of(context).textTheme.headline4),Container(
                          child: Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  autocorrect: false,
                                  decoration: InputDecorations.inputDecoration( 
                                    hintext: '',
                                    labeltext:'Correo Electronico' ,
                                     icono:  Icon(Icons.alternate_email_rounded),
                                    
                                     ),
                                  
                                  ),
                                  
                                   /*const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color:  Colors.deepOrange)
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                      color: Colors.deepOrange, width:2
                                      ),
                                    ),
                                    
                                    labelText: 'Correo Electronico',
                                    prefixIcon: Icon(Icons.alternate_email_rounded),
                                  ),
    */
                                
                                SizedBox(height: 30),
                                 TextFormField(
                                  autocorrect: false,
                                  decoration: 
                                  InputDecorations.inputDecoration( 
                                    hintext: '',
                                    labeltext: 'Contraseña',
                                     icono:   Icon(Icons.lock_outline),
                                    
                                     ),
    
                                  /*const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color:  Colors.deepOrange)
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                      color: Colors.deepOrange, width:2
                                      ),
                                    ),
                                    
                                    labelText: 'Contraseña',
                                    prefixIcon: Icon(Icons.lock_outline),
                                  ),
                                  */
    
                                ),
    
                                const SizedBox(height: 30),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  disabledColor: Colors.grey,
                                  color: Color.fromARGB(177, 154, 240, 225),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal:80 , vertical:15),
                                    child: Text("Ingresar", style: TextStyle(color: Colors.white),),
                                  ),
                                  onPressed: () {},
                                

                                   
                                    ),

                                
    
                              ],
                            )
                             ),
                        ),
    
                       
                      ],
                    ),
                ),
    
                SizedBox(height: 50),
                Text('Crear Cuenta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            
              ),
    );
  }

  SafeArea iconopersona() {
    return SafeArea(//el safe area es el nombre del widget solamnte pero asi se llama cuando se quiere tomar toda la apnatall ahats acon la camara frontal
            child: Container(
              margin: const EdgeInsets.only(top:30),
              width: double.infinity,
              child: const Icon(
                Icons.person_pin,
                color:Colors.white,
                size:100,
              ),
            ),
          );
  }

  Container cajapurpura(Size size) {
    return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                
                Color.fromRGBO(110, 218, 200, 0.7),
                Color.fromRGBO(140, 230, 210, 0.5),
                
                //Color.fromRGBO(310, 410, 510, 0.7),
                 //Color.fromRGBO(178, 218, 250, 1),
              ])
            ),
            width: double.infinity,//el infinity permite tomar todo el viewport de la pantalla en la direccion indicada
            height: size.height * 0.4,
            child: Stack(
              children: [
                Positioned(child:  burbuja(), top:90, left:30),

                  Positioned(child: burbuja(), top:50, left:370),

                  Positioned(child:  burbuja(), top:220, left:230),

                  Positioned(child:  burbuja(), top:-40, left:80),
              ],
            ),
          );
  }

  Container burbuja() {
    return Container(
                width:100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromRGBO(300, 300, 300, 0.05)),
                
                );
  }
}