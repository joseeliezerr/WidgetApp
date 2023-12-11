import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'UiControlsScreen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui Controls + Tiles'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView({
    super.key,
  });

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {

  bool wantsBreakfast=false;
  bool wantsLunch=false;
  bool wantsDinner=false;

  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: Text('Developer Mode'),
          subtitle: Text('Controles adicionales'),
          value: isDeveloper, // Usa la variable isDeveloper aquí
          onChanged: (value) {
            setState(() {
              isDeveloper = value; // Asigna el nuevo valor a isDeveloper
            });
          },
        ),
        ExpansionTile(
          title: Text('Vehiculo de Transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile<Transportation>(
              title: Text('By Car'),
              subtitle: Text('Viajar por carro'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (Transportation? value) {
                setState(() {
                  selectedTransportation = value ?? Transportation.car;
                });
              },
            ),
            RadioListTile<Transportation>(
              title: Text('By Boat'),
              subtitle: Text('Viajar por bote'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (Transportation? value) {
                setState(() {
                  selectedTransportation = value ?? Transportation.boat;
                });
              },
            ),
            RadioListTile<Transportation>(
              title: Text('By Plane'),
              subtitle: Text('Viajar por avión'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (Transportation? value) {
                setState(() {
                  selectedTransportation = value ?? Transportation.plane;
                });
              },
            ),
            RadioListTile<Transportation>(
              title: Text('By Submarine'),
              subtitle: Text('Viajar por submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (Transportation? value) {
                setState(() {
                  selectedTransportation = value ?? Transportation.submarine;
                });
              },
            ),
          ],
        ),
        CheckboxListTile(
          title: Text('Desayuno?'),
          value: wantsBreakfast, 
          onChanged: (value)=>setState(() {
          wantsBreakfast=!wantsBreakfast;
        })),
         CheckboxListTile(
          title: Text('Almuerzo?'),
          value: wantsLunch, 
          onChanged: (value)=>setState(() {
          wantsLunch=!wantsLunch;
        })),
         CheckboxListTile(
          title: Text('Cena?'),
          value: wantsDinner, 
          onChanged: (value)=>setState(() {
          wantsDinner=!wantsDinner;
        })),

      ],
      
    );
  }
}
