import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:developer' as developer;
import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/auth/export.dart';

class UserCollection {
  final userCollection = FirebaseFirestore.instance.collection(
    CollectionNames.users,
  );

  Future<void> addUser(UserModel user, {required String? userId}) async {
    try {
      userId ??= userCollection.doc().id;

      await userCollection.doc(userId).set(
            user.toJson(),
            SetOptions(merge: true),
          );
    } catch (e) {
      developer.log('addUser', name: 'UserCollection', error: e);
    }
  }

  Future<void> updateUser(UserModel user, String userId) async {
    try {
      await userCollection
          .doc(userId)
          .set(user.toJson(), SetOptions(merge: true));
    } catch (e) {
      developer.log('updateUser', name: 'UserCollection', error: e);
      rethrow;
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await userCollection.doc(userId).delete();
    } catch (e) {
      developer.log('deleteUser', name: 'UserCollection', error: e);
      rethrow;
    }
  }

  Future<UserModel?> getUserById(String userId) async {
    try {
      final snapshot = await userCollection.doc(userId).get();

      if (snapshot.exists) {
        return UserModel.fromJson(snapshot.data()!);
      }
      return null;
    } catch (e) {
      developer.log('getUserById', name: 'UserCollection', error: e);
      rethrow;
    }
  }

  Future<List<UserModel>> getAllUsers() async {
    try {
      final snapshot = await userCollection.get();
      return snapshot.docs
          .map((userDoc) => UserModel.fromJson(userDoc.data()))
          .toList();
    } catch (e) {
      developer.log('getAllUsers', name: 'UserCollection', error: e);
      rethrow;
    }
  }

  Future<List<UserModel>> getAllUsersWhere(Object? isEqualTo) async {
    try {
      final snapshot =
          await userCollection.where('userType', isEqualTo: isEqualTo).get();
      return snapshot.docs
          .map((userDoc) => UserModel.fromJson(userDoc.data()))
          .toList();
    } catch (e) {
      developer.log('getAllUsers', name: 'UserCollection', error: e);
      rethrow;
    }
  }

  Future<(bool, UserModel?)> isUserExists(String userId) async {
    try {
      final snapshot = await userCollection.doc(userId).get();
      if (snapshot.exists) {
        final user = UserModel.fromJson(snapshot.data()!);
        return (true, user);
      }
      return (false, null);
    } catch (e) {
      developer.log('isUserExists', name: 'UserCollection', error: e);
      rethrow;
    }
  }

  Future<List<UserModel>> getUserWhere(Object field, Object? isEqualTo) async {
    try {
      final snapshot =
          await userCollection.where(field, isEqualTo: isEqualTo).get();
      return snapshot.docs
          .map((userDoc) => UserModel.fromJson(userDoc.data()))
          .toList();
    } catch (e) {
      developer.log('getAllUsers', name: 'UserCollection', error: e);
      rethrow;
    }
  }
}
