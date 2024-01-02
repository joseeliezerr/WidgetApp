import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
      MenuItem(
      title: 'ProgressIndicator',
      subTitle: 'Genrales y Controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
       MenuItem(
      title: 'indicadores y dialogos',
      subTitle: 'Indicadores en pantalla',
      link: '/Snackbars',
      icon: Icons.info_outline),
       
       MenuItem(
      title: 'Ui Controls + Tiles',
      subTitle: 'Una serie de controles de flutters',
      link: '/ui_constrols',
      icon: Icons.car_rental_outlined),
       MenuItem(
      title: 'App Tutorial',
      subTitle: 'Introduccion a la aplicacion',
      link: '/app_tutorial',
      icon: Icons.accessible_rounded),
      MenuItem(
      title: 'InfiniteScroll y Pull',
      subTitle: 'Listas Infinitas y pull to request',
      link: '/infinite_scroll',
      icon: Icons.list_alt_outlined),
];
