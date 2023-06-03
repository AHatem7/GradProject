class Tasks{
  static const String collectionName = 'task';
  String? id;
  String? title;
  String? content;
  //DateTime? dateTime;
  //bool? isDone;
  Tasks({this.id,this.title,this.content,});

  Tasks.fromFireStore(Map<String,dynamic> data):
        this(
          id: data['id'],
          title: data['title'],
          content: data['content'],
          //dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
          //isDone: data['isDone']
      );
  Map<String,dynamic> toFireStore(){
    return {
      'id' :id,
      'title':title,
      'content':content,
      //'isDone':isDone,
      //'dateTime':dateTime?.millisecondsSinceEpoch
    };
  }
}