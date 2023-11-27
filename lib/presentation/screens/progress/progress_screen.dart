import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name='ProgressScreen';
  
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress indicator'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text('Circular progress indicator'),
          SizedBox(height: 10),
          CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.black),

           SizedBox(height: 10),
           Text('Circular y Linear Controlado'),
            SizedBox(height: 10),
            _ControlledProgressIndicator()
          
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300),(value){
        return (value*2)/100;
      }).takeWhile((value) => value<100),
     builder: (context, snapshot){
      final progressValue=snapshot.data??0;
       return Padding(
        padding:EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(value: progressValue,strokeWidth: 2,backgroundColor:Colors.black12),
            SizedBox(width: 20),
            Expanded(
              child: LinearProgressIndicator(value: progressValue)
              )
          ],
        ),
        
        );
     },
    );
  }
}