import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'SnackbarScreen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('Estas seguro?'),
        content: Text(
            'Hola este un parrafo muy grande los vecinos estan afuera jugando futbol'),
            actions: [
              TextButton(onPressed: ()=>context.pop(), child: Text('Cancelar')),
              FilledButton(onPressed: ()=>context.pop(), child: Text('Aceptar'))
            ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbars y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    Text(
                        'Hola esto es un parrafo dsgdsgsd sdgsdg sdgsd gsdgsdgsd gsdg')
                  ]);
                },
                child: Text('Licencias Usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                
                child: Text('Mostrar Dialogos de pantalla')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: Text('Mostrar Snackbar'),
        icon: Icon(Icons.remove_red_eye),
      ),
    );
  }
}
