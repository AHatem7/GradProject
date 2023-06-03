// // import 'dart:typed_data';
// //
// // import 'package:encrypt/encrypt.dart';
// //
// // class FileEncrpt {
// //
// //
// //   static  encryptFile(data) async {
// //     final key = Key.fromSecureRandom(16);
// //     final iv = IV.fromLength(16);
// //     final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
// //
// //     final encryptedFile = encrypter.encryptBytes(data, iv: iv);
// //     return encryptedFile.bytes;
// //   }
// //
// //
// //
// // }
//

////////////////////////////////////////////////////////////////////////////////////////
//




// import 'dart:io';
// import 'package:aes_crypt/aes_crypt.dart';
//
// class EncryptData {
//   static String encrypt_file(String path) {
//     AesCrypt crypt = AesCrypt();
//     crypt.setOverwriteMode(AesCryptOwMode.on);
//     crypt.setPassword('my cool password');
//     late String encFilepath;
//     try {
//       encFilepath = crypt.encryptFileSync(path);
//       print('The encryption has been completed successfully.');
//       print('Encrypted file: $encFilepath');
//     } catch (e) {
//       if (e == AesCryptExceptionType.destFileExists) {
//         print('The encryption has been completed unsuccessfully.');
//         print(e);
//       }
//       else{
//         return 'ERROR';
//       }
//     }
//     return encFilepath;
//   }
//
//   static String decrypt_file(String path) {
//     AesCrypt crypt = AesCrypt();
//     crypt.setOverwriteMode(AesCryptOwMode.on);
//     crypt.setPassword('my cool password');
//    late String decFilepath;
//     try {
//       decFilepath = crypt.decryptFileSync(path);
//       print('The decryption has been completed successfully.');
//       print('Decrypted file 1: $decFilepath');
//       print('File content: ' + File(decFilepath).path);
//     } catch (e) {
//       if (e == AesCryptExceptionType.destFileExists) {
//         print('The decryption has been completed unsuccessfully.');
//         print(e);
//       }
//       else{
//         return 'ERROR';
//       }
//     }
//     return decFilepath;
//   }
// }





/////////////////////////////////////////////////////

