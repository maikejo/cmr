import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String nome;
  final String cpf;
  String email;
  final String imagemUrl;
  final String senha;
  final bool ativado;
  final String tipo;

  User({
    this.nome,
    this.cpf,
    this.email,
    this.imagemUrl,
    this.senha,
    this.ativado,
    this.tipo
  });

  Map<String, Object> toJson() {
    return {
      'nome': nome,
      'cpf': cpf,
      'email': email == null ? '' : email,
      'imagemUrl': imagemUrl,
      'senha': senha,
      'appIdentifier': 'flutter-onboarding',
      'ativado': ativado,
      'tipo': tipo
    };
  }

  factory User.fromJson(Map<String, Object> doc) {
    User user = new User(
      nome: doc['nome'],
      cpf: doc['cpf'],
      email: doc['email'],
      imagemUrl: doc['imagemUrl'],
      senha: doc['senha'],
      ativado: doc['ativado'],
      tipo: doc['tipo']
    );
    return user;
  }

  factory User.fromDocument(DocumentSnapshot doc) {
    return User.fromJson(doc.data);
  }
}
