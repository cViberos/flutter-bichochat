import 'package:flu_bichochat/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../models/usuario.dart';

// ignore: must_be_immutable
class UsuariosPage extends StatelessWidget {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final usuarios = [
    Usuario(
        nombre: 'Cristian', online: true, email: 'viberos@gmail.com', uid: '1'),
    Usuario(
        nombre: 'Miguel', online: true, email: 'miguelito@gmail.com', uid: '2'),
    Usuario(
        nombre: 'Mikaela', online: false, email: 'miku@gmail.com', uid: '3'),
    Usuario(
        nombre: 'Melina', online: false, email: 'melina@gmail.com', uid: '4'),
    Usuario(
        nombre: 'Diego', online: true, email: 'tynidiego@gmail.com', uid: '5'),
  ];

  @override
  Widget build(BuildContext context) {
    //
    final authService = Provider.of<AuthService>(context);
    final usuario = authService.usuario;
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(usuario.nombre, style: TextStyle(color: Colors.black54)),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            // DESCONECTAR EL SOCKET SERVER

            // LLAMAR AL LOGOUT
            Navigator.pushReplacementNamed(context, 'login');
            AuthService.deleteToken();
          },
          icon: const Icon(Icons.exit_to_app, color: Colors.black87),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.blue[400]),
            // Icons.offline_bolt, color: Colors.red
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuarios,

        header: ClassicHeader(
          completeIcon: Icon(Icons.check, color: Colors.green[400]),
          completeText: 'Actualizado',
          idleText: 'Actualizar contactos',
          releaseText: 'Iniciar actualización',
          refreshingText: 'Refrescando',
        ),

        // header: WaterDropHeader(
        //   complete: Icon(Icons.check, color: Colors.blue[400]),
        //   waterDropColor: Colors.blue,
        // ),
        child: _ListViewUsuarios(),
      ),
    );
  }

  ListView _ListViewUsuarios() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_, i) => _UsuarioListTile(usuarios[i]),
      separatorBuilder: (_, i) => const Divider(),
      itemCount: usuarios.length,
    );
  }

  ListTile _UsuarioListTile(Usuario usuario) {
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Text(usuario.nombre.substring(0, 2)),
      ),
      trailing: Container(
        height: 12,
        width: 12,
        decoration: BoxDecoration(
          color: usuario.online ? Colors.green[300] : Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

  _cargarUsuarios() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}
