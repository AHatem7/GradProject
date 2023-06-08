// import 'package:encrypt/encrypt.dart';
//
// void main() {
//   final key = "Your16CharacterK";
//   final plainText = "lorem ipsum example example";
//   Encrypted encrypted = encrypt(key, plainText);
//   String decryptedText = decrypt(key, encrypted);
//   print(decryptedText);
// }
//
// String decrypt(String keyString, Encrypted encryptedData) {
//   final key = Key.fromUtf8(keyString);
//   final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
//   final initVector = IV.fromUtf8(keyString.substring(0, 16));
//   return encrypter.decrypt(encryptedData, iv: initVector);
// }
//
// Encrypted encrypt(String keyString, String plainText) {
//   final key = Key.fromUtf8(keyString);
//   final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
//   final initVector = IV.fromUtf8(keyString.substring(0, 16));
//   Encrypted encryptedData = encrypter.encrypt(plainText, iv: initVector);
//   return encryptedData;
// }




////////////////////////////////////////////////////
// import 'package:crypto/crypto.dart';
// import 'package:encrypt/encrypt.dart';
//
//
// class EncryptData{
// //for AES Algorithms
//
//   static Encrypted? encrypted;
//   static var decrypted;
//
//
//   static encryptAES(plainText){
//     final key = Key.fromUtf8('my 32 length key................');
//     final iv = IV.fromLength(16);
//     final encrypter = Encrypter(AES(key));
//     encrypted = encrypter.encrypt(plainText, iv: iv);
//     print(encrypted!.base64);
//   }
//
//   static decryptAES(plainText){
//     final key = Key.fromUtf8('my 32 length key................');
//     final iv = IV.fromLength(16);
//     final encrypter = Encrypter(AES(key));
//     decrypted = encrypter.decrypt(encrypted!, iv: iv);
//     print(decrypted);
//   }
// }