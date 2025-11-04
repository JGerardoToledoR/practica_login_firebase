import 'package:firebase_auth/firebase_auth.dart';

String mapAuthErrorToMessage(Object e) {
  if (e is! FirebaseAuthException) return 'Correo o contraseña inválidos.';
  switch (e.code) {
    case 'invalid-email':
    case 'user-not-found':
    case 'wrong-password':
      return 'Correo o contraseña inválidos.'; // mensaje genérico para no filtrar info
    case 'email-already-in-use':
      return 'No se pudo crear la cuenta.'; // genérico: evita enumerar correos
    case 'weak-password':
      return 'La contraseña no cumple los requisitos.';
    case 'user-disabled':
      return 'La cuenta está deshabilitada.';
    case 'too-many-requests':
      return 'Demasiados intentos. Intenta más tarde.';
    case 'network-request-failed':
      return 'Problema de red. Verifica tu conexión.';
  }
  return 'No se pudo completar la operación.';
}