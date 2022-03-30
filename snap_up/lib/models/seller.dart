// contains the seller class.

class seller{
// null safety
int? id;
String? name;
String? image;
String? address;
String? description;
// constructor
seller.fromMap(Map<dynamic,dynamic>map){
   id = int.parse(map['id']) ;
   //as data from response is in the form of a string hence we need to parse it.
   name = map['name'] ;
   address = map['address'] ;
   image = map['image'] ;
   description = map['description'] ;

}

}