class Note {
  
  final String title;
  final String content;

  Note({  required this.title, required this.content}) {
    // TODO: implement 
    
  }

  Map<String, dynamic> toMap(){
   return {
      'title' : title, 'content' : content
   };
  }
}