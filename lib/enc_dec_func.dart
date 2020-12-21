import 'package:encrypt/encrypt.dart' as ec;

var encrypted;
Map<String, ec.Encrypted> cont = Map<String, ec.Encrypted>();
var previous = "";
String encryp(String text) {
  final key = ec.Key.fromUtf8("MySecretKeyForEncryptionAndDecry");
  final iv = ec.IV.fromUtf8("Helloworldhellow");
  final encrypter = ec.Encrypter(ec.AES(key, mode: ec.AESMode.cbc));
  encrypted = encrypter.encrypt(text, iv: iv);
  previous = encrypted.base64;
  cont.addAll({previous: encrypted});
  print(cont);
  return encrypted.base64;
}

String decryp(ec.Encrypted encrypted) {
  final key = ec.Key.fromUtf8("MySecretKeyForEncryptionAndDecry");
  final iv = ec.IV.fromUtf8("Helloworldhellow");
  final encrypter = ec.Encrypter(ec.AES(key, mode: ec.AESMode.cbc));
  final decrypted = encrypter.decrypt(encrypted, iv: iv);
  return decrypted;
}

ec.Encrypted getencrypter(String text) {
  return cont[text];
}

bool present(String text) {
  if (cont.containsKey(text)) {
    return true;
  }
  return false;
}
