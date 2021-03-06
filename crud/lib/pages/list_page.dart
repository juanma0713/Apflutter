import 'package:crud/db/operation.dart';
import 'package:crud/models/note.dart';
import 'package:crud/pages/save_page.dart';
import 'package:flutter/material.dart';


class ListPage extends StatelessWidget {

  static const String ROUTE = "/";
  

  @override
  Widget build(BuildContext context) {

    
    return _MyList();
  }
}

class _MyList extends StatefulWidget {
  
  @override
  State<_MyList> createState() => _MyListState();
}

class _MyListState extends State<_MyList> {
  List<Note> notes = [];

  @override
  void initState() {

       _loadData();
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       floatingActionButton: FloatingActionButton(child: const Icon(Icons.add),onPressed: () {
         Navigator.pushNamed(context, SavePage.ROUTE,).then((value) => setState((() {

            _loadData();

           })));
         
       },
       ),

      appBar: AppBar(
        title: const Text(
          "Listado"
          ),
        ),

      body:  ListView.builder(
      itemCount: notes.length,
      itemBuilder: (_,i) => _createItem(i),
     
    )
    );
    
   
   

  }

  _loadData() async {

    List<Note> auxNote = await Operation.notes();
    setState(() {
      notes = auxNote;
    });
    
  }

_createItem(int i) {
  return Dismissible(
    key : Key(i.toString()),
    direction: DismissDirection.startToEnd,
    background: Container(
      color: const Color.fromARGB(255, 112, 86, 84),
      padding: const EdgeInsets.only(left: 5),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Icon(Icons.delete,color: Color.fromARGB(255, 159, 190, 234)),
        ) ,
    ),
    onDismissed: (direction){
      print(direction);
      Operation.delete(notes[i]);
      
    },
    child: ListTile(
      
      title: Text(notes[i].title),
      trailing: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, SavePage.ROUTE,arguments: notes[i]).then((value) => setState((() {
            
         
            _loadData();
           })));
        },
        child: const Icon(Icons.edit)) ,
      
      
    ),
  );
 }

 _createItemd(int i) {
  return Dismissible(
    key : Key(i.toString()),
    direction: DismissDirection.startToEnd,
    background: Container(
      color: const Color.fromARGB(255, 112, 86, 84),
      padding: const EdgeInsets.only(left: 5),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Icon(Icons.delete,color: Color.fromARGB(255, 159, 190, 234)),
        ) ,
    ),
    onDismissed: (direction){
      print(direction);
      Operation.delete(notes[i]);
      
    },
    child: ListTile(
      title: Text(notes[i].content),
       trailing: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, SavePage.ROUTE,arguments: notes[i]);
        },
        child: const Icon(Icons.edit)) ,
      
      
    ),
  );
 }
}