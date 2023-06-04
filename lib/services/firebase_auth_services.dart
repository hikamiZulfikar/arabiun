import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/model/user_model.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser(
      {required String name,
      required String email,
      required String password}) async {
    String result = "Terjadi Kesalahan";
    try {
      //Mendaftarkan User
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //Membuat Objek User
      UserModel userModel = UserModel(
        uid: user.user!.uid,
        email: email,
        name: name,
        avatar: "avatar1.png",
        password: password,
        quiz_h0_attempts: 0,
        quiz_k7_attempts: 0,
        quiz_k9_attempts: 0,
      );

      await _firestore.collection('users').doc(user.user!.uid).set(
            userModel.toJson(),
          );

      // Setup Materi Huruf Hijaiyah
      await _firestore.collection('hijaiyah').doc(user.user!.uid).set({
        'last_click': 'Baca materi dulu',
        'id': user.user!.uid,
      });
      for (var i = 0; i < 30; i++) {
        await _firestore
            .collection('hijaiyah')
            .doc(user.user!.uid)
            .collection("hijaiyah")
            .doc((i + 1).toString())
            .set({'status': false, 'id': i + 1});
      }

      // Setup Materi Karakter Rasulullah
      await _firestore
          .collection('materi_kosakata_karakter_rasulullah')
          .doc(user.user!.uid)
          .set(
        {
          'id': user.user!.uid,
          'last_click': 'Baca materi dulu',
          'class': "Kelas 7",
          'status': "Belum Selesai"
        },
      );
      for (var i = 0; i < 6; i++) {
        await _firestore
            .collection('materi_kosakata_karakter_rasulullah')
            .doc(user.user!.uid)
            .collection("materi_list")
            .doc((i + 1).toString())
            .set({'status': false, 'id': i + 1});
      }

      // Setup Materi Profesi Satu
      await _firestore
          .collection('materi_kosakata_profesi_1')
          .doc(user.user!.uid)
          .set(
        {
          'id': user.user!.uid,
          'last_click': 'Baca materi dulu',
          'class': "Kelas 7",
          'status': "Belum Selesai"
        },
      );
      for (var i = 0; i < 5; i++) {
        await _firestore
            .collection('materi_kosakata_profesi_1')
            .doc(user.user!.uid)
            .collection("materi_list")
            .doc((i + 1).toString())
            .set({'status': false, 'id': i + 1});
      }

      // Setup Materi Kata Benda
      await _firestore
          .collection('materi_kosakata_kata_benda')
          .doc(user.user!.uid)
          .set(
        {
          'id': user.user!.uid,
          'last_click': 'Baca materi dulu',
          'class': "Kelas 7",
          'status': "Belum Selesai"
        },
      );
      for (var i = 0; i < 5; i++) {
        await _firestore
            .collection('materi_kosakata_kata_benda')
            .doc(user.user!.uid)
            .collection("materi_list")
            .doc((i + 1).toString())
            .set({'status': false, 'id': i + 1});
      }

      // Setup Materi Hewan Ternak
      await _firestore
          .collection('materi_kosakata_hewan_ternak')
          .doc(user.user!.uid)
          .set(
        {
          'id': user.user!.uid,
          'last_click': 'Baca materi dulu',
          'class': "Kelas 9",
          'status': "Belum Selesai"
        },
      );
      for (var i = 0; i < 6; i++) {
        await _firestore
            .collection('materi_kosakata_hewan_ternak')
            .doc(user.user!.uid)
            .collection("materi_list")
            .doc((i + 1).toString())
            .set({'status': false, 'id': i + 1});
      }

      // Setup Materi Profesi 2
      await _firestore
          .collection('materi_kosakata_profesi_2')
          .doc(user.user!.uid)
          .set(
        {
          'id': user.user!.uid,
          'last_click': 'Baca materi dulu',
          'class': "Kelas 9",
          'status': "Belum Selesai"
        },
      );
      for (var i = 0; i < 10; i++) {
        await _firestore
            .collection('materi_kosakata_profesi_2')
            .doc(user.user!.uid)
            .collection("materi_list")
            .doc((i + 1).toString())
            .set({'status': false, 'id': i + 1});
      }

      // Setup Materi Hewan Ternak
      await _firestore
          .collection('materi_kosakata_muannas_mudzakar')
          .doc(user.user!.uid)
          .set(
        {
          'id': user.user!.uid,
          'last_click': 'Baca materi dulu',
          'class': "Kelas 9",
          'status': "Belum Selesai"
        },
      );
      for (var i = 0; i < 10; i++) {
        await _firestore
            .collection('materi_kosakata_muannas_mudzakar')
            .doc(user.user!.uid)
            .collection("materi_list")
            .doc((i + 1).toString())
            .set({'status': false, 'id': i + 1});
      }

      result = "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        result = "Password terlalu lemah";
      } else if (e.code == 'email-already-in-use') {
        result = "Email ini udah terdaftar";
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

  Future<String> logInUser(
      {required String email, required String password}) async {
    String result = "Terjadi Kesalahan";
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      result = "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        result = "Email ini ga ditemukan";
      } else if (e.code == 'wrong-password') {
        result = "Password yang kamu masukin salah";
      }
    } catch (err) {
      result = err.toString();
    }
    print(result);
    return result;
  }
}
