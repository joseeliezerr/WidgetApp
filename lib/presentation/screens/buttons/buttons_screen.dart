import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});
  static const String name = 'button_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons Screen'),
      ),
      body: _buttonsview(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}

class _buttonsview extends StatelessWidget {
  const _buttonsview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('Elevated Button')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated Disable')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.access_alarm_rounded),
                label: Text('Elevated Icon')),
            FilledButton(onPressed: () {}, child: Text('Filled')),
            FilledButton.icon(
                onPressed: () {},
                icon: Icon(Icons.abc_sharp),
                label: Text('Filled Icon')),
            OutlinedButton(onPressed: () {}, child: Text('Outline button')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.access_time_filled),
                label: Text('Outline Icon')),
            TextButton(onPressed: () {}, child: Text('Text Button')),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.account_balance_wallet),
                label: Text('Text button icon')),
            const CustomButton(),
            IconButton(onPressed: () {}, icon: Icon(Icons.access_time_rounded)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.access_time_rounded),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                  iconColor: MaterialStatePropertyAll(Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors=Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color:colors.primary ,
        child: InkWell(
          onTap: (){},
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('Hola Mundo',style: TextStyle(color: Colors.white)),
              ),
        ),
      ),
    );
  }
}
