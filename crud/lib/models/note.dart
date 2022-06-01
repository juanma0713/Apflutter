class Note {
  
    late String title;
    late String content;

  Note({  required this.title, required this.content}); 

  Note.Empty();
    
    
  

  Map<String, dynamic> toMap(){
   return {
      'title' : title, 'content' : content
   };
  }
}


  
   

 