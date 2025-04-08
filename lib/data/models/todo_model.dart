class TodoModel{

  String ? id;
  String ? title;
  String ? description;
  int ? created_at;
  bool isDone;

TodoModel({
  this.id,
  required this.title,
  required this.description,
  required this.created_at,
  this.isDone =  false // default to false
});

  TodoModel.fromJson(Map<String,dynamic> json) :
    id = json['id'],
    title = json['title'],
    description = json['description'],
    created_at = json['created_at'],
    isDone = json['isDone'] ?? false; //default to false if null


Map<String,dynamic> toJson(){
 final Map<String,dynamic> data = <String,dynamic>{};
 data['id'] = id;
 data ['title'] = title;
 data['description'] = description;
 data['created_at'] = created_at;
 data['isDone'] = isDone;
 return data;
}
}