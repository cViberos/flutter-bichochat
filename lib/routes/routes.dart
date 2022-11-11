import 'package:flutter/material.dart';

import 'package:flu_bichochat/pages/chat_page.dart';
import 'package:flu_bichochat/pages/loading_page.dart';
import 'package:flu_bichochat/pages/login_page.dart';
import 'package:flu_bichochat/pages/register_page.dart';
import 'package:flu_bichochat/pages/usuarios_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'usuarios': (_) => UsuariosPage(),
  'chat': (_) => const ChatPage(),
  'login': (_) => const LoginPage(),
  'register': (_) => const RegisterPage(),
  'loading': (_) => const LoadingPage(),
};
