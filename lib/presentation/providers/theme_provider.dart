
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';

final isDarkmodeProvider = StateProvider((ref)=>false);

final selectedColorProvider = StateProvider((ref)=>0);

//listado de colores inmutables
final colorListProvider=Provider((ref) => colorList);
