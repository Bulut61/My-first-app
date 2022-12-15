import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projekt/services/user_service.dart';

class Item {
  Item({required this.item, required this.buyed, required this.required});
  late String itemId;
  late String item;
  late bool buyed;
  late bool required;

  Item.fromSnapshot(snap) {
    item = snap.get('item');
    buyed = snap.get('buyed');
    required = snap.get('required');
    itemId = snap.id;
  }

  Map<String, dynamic> getData() => {'item': item, 'buyed': buyed, 'required': required};
}
