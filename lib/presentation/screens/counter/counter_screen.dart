import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/counter_provider.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';
import 'package:widget_app/presentation/screens/screens.dart';

class Counter_screen extends ConsumerWidget {
  const Counter_screen({super.key});
  static const name = 'Counter_screen';

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final int clickCounter=ref.watch(counterProvider);
    final isDarkmode=ref.watch(isDarkmodeProvider);

    return  Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
        actions: [
          IconButton(onPressed: (){ref.read(isDarkmodeProvider.notifier)
            .update((isDarkmode) => !isDarkmode);}, 
          //icon:Icon(Icons.light_mode_outlined),
          icon:Icon(isDarkmode?Icons.dark_mode_outlined:Icons.light_mode_outlined),
          )
        ],
      ),
      body: Center(
        child: Text('Valor: $clickCounter',style:Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          ref.read(counterProvider.notifier).state++;
          //ref.read(counterProvider.notifier).update((state) => state+1);
        },
        child: Icon(Icons.add),
      
      ),
    );
  }
}