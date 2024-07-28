import 'package:e_shop/models/models.dart';
import 'package:e_shop/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signup(String name, String email, String password) async {
    try {
      final creds = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = creds.user;

      if (user != null) {
        await CollectionInterfaces.users.doc(user.uid).set(
              UserModel(
                id: user.uid,
                name: name,
                email: email,
              ),
            );
      } else {
        throw AuthException('User creation failed', 'User object is null.');
      }
    } on FirebaseAuthException catch (e) {
      throw AuthException('Failed to sign up', e.message);
    } on FirebaseException catch (e) {
      throw FirestoreException('Failed to save user data', e.message);
    } catch (e) {
      throw AppExceptions('An unexpected error occurred', e.toString());
    }
  }

  Future<UserModel?> login(String email, String password) async {
    try {
      final creds = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      var user = creds.user;

      if (user != null) {
        final doc = await CollectionInterfaces.users.doc(user.uid).get();

        if (!doc.exists) {
          throw AuthException('User data not found', 'Document does not exist in Firestore.');
        }
        return doc.data();
      } else {
        throw AuthException('Login failed', 'User object is null.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw AuthException('Invalid credentials', 'Either email or password is incorrect');
      } else {
        throw AuthException('Failed to log in', e.message ?? 'Unknown error');
      }
    } on FirebaseException catch (e) {
      throw FirestoreException('Failed to fetch user data', e.message);
    } catch (e) {
      throw AppExceptions('An unexpected error occurred', e.toString());
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw AppExceptions('Failed to log out', e.toString());
    }
  }

  User? getCurrentUser() => _auth.currentUser;
}
