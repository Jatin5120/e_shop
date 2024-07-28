import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/models/models.dart';
import 'package:e_shop/utils/utils.dart';

class CollectionInterfaces {
  CollectionInterfaces._();

  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static final users = firestore.collection(CollectionConstants.users).withConverter<UserModel>(
        fromFirestore: (snapshot, _) => UserModel.fromMap(snapshot.data()!),
        toFirestore: (data, _) => data.toMap(),
      );
}
