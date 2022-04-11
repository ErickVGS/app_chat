import 'dart:io';

import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/models/services/auth/auth_firebase_service.dart';
import 'package:chat/core/models/services/auth/auth_mock_service.dart';

abstract class AuthService {
  ChatUser? get currentUser; //pegar o usuário corrente

  Stream<ChatUser?>
      get userChanges; // Gerar uma Streamer de dados sempre que o usuário modificar

  Future<void> signup(
      String nome, String email, String password, File? image); //cadastrar

  Future<void> login(String email, String senha); // logar

  Future<void> logout(); // deslogar

  factory AuthService() {
    // return AuthMockService();
    return AuthFirebaseService();
  }
}
