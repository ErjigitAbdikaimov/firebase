import 'package:cloud_firestore/cloud_firestore.dart';

class StoreService {
  final db = FirebaseFirestore.instance;

  Future<void> saveProduct(product) async {
    await db.collection('products').add(product.toJson());
  }
}
