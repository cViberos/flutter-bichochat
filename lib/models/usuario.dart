class Usuario {
  final String nombre;
  final bool estado;
  final String email;
  final String uid;

  Usuario({
    required this.nombre,
    required this.estado,
    required this.email,
    required this.uid,
  });

  /*
  COPIA DE INSTANCIAS
  */
  Usuario copyWith({
    String? nombre,
    bool? estado,
    String? email,
    String? uid,
  }) =>
      Usuario(
        nombre: nombre ?? this.nombre,
        estado: estado ?? this.estado,
        email: email ?? this.email,
        uid: uid ?? this.uid,
      );
}
