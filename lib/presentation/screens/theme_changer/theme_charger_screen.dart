import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});
  static const name = 'theme_changer_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkmode = ref.watch(isDarkmodeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: () {
              // Aquí cambias el estado del tema.
              ref.read(isDarkmodeProvider.notifier).state = !isDarkmode;
            },
            icon: Icon(
              isDarkmode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
          ),
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int Selectedcolors = ref.watch(selectedColorProvider);
   

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        return RadioListTile(
            title: Text('Este color', style: TextStyle(color: color)),
            subtitle: Text('${color.value}'),
            activeColor: color,
            value: index,
            groupValue: Selectedcolors,
            onChanged: (value) {
              ref.read(selectedColorProvider.notifier).state = index;
            });
      },
    );
  }
}
