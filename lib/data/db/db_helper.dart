// import 'package:event/data/model/event.dart';
// import 'package:firebase_database/firebase_database.dart';

// // class DBHalper{

//   import 'package:event/data/model/event.dart';
// import 'package:firebase_database/firebase_database.dart';

// Future<List<Event>> getBooks() async {
//   final   dataSnapshot = await FirebaseDatabase.instance.ref('event');
//   final Stream<DatabaseEvent> booksData = dataSnapshot.onValue;
//   final List<Event> books = booksData.entries.map((entry) {
//     final String id = entry.key;
//     final Map<dynamic, dynamic> bookData = entry.value;
//     return Event.fromJson(bookData)..id = id;
//   }).toList();
//   return Event;
//   }

//   final DataSnapshot dataSnapshot = await FirebaseDatabase.instance.reference().child('books').once();
// final Map<dynamic, dynamic> booksData = dataSnapshot.value;
// final List<Book> books = booksData.entries.map((entry) {
//   final String id = entry.key;
//   final Map<dynamic, dynamic> bookData = entry.value;
//   return Book.fromJson(bookData)..id = id;
// }).toList();
// }





// //  static Stream<List<UserModel>>
//   // read()  {
//   //   final userCollection =  FirebaseFirestore.instance.collection("users");
//   //   return userCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());



// }