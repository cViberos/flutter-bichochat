import 'package:flutter/material.dart';

import '../widgets/boton_azul.dart';
import '../widgets/custom_input.dart';
import '../widgets/labels.dart';
import '../widgets/logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientacion = MediaQuery.of(context).orientation;

    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              // height: (orientacion == Orientation.portrait)
              //     ? MediaQuery.of(context).size.height * 0.9
              //     : 650,
              height: MediaQuery.of(context).size.height * 0.9,
              child: (orientacion == Orientation.portrait)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Logo(titulo: 'Mensajes'),
                        _Form(),
                        const Labels(
                          ruta: 'register',
                          titulo: '¿No tienes cuenta?',
                          subTitulo: 'Crea una ahora!',
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            'Desarrollado por Cristian Viberos 06/11/22',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Logo(titulo: 'Mensajes'),
                            Labels(
                              ruta: 'register',
                              titulo: '¿No tienes cuenta?',
                              subTitulo: 'Crea una ahora!',
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: Text(
                                'Desarrollado por Cristian Viberos 06/11/22',
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: _Form()),
                      ],
                    ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomInput(
            icon: Icons.mail_outlined,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_open_outlined,
            placeholder: 'Contraseña',
            keyboardType: TextInputType.emailAddress,
            textController: passCtrl,
            isPassword: true,
          ),
          BotonAzul(
            text: 'Iniciar',
            onPressed: () {
              print(emailCtrl);
              print(passCtrl);
            },
          ),
        ],
      ),
    );
  }
}
