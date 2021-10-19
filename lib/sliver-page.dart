import 'package:flutter/material.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _List_task(),
    );
  }
}

// header de nuestra app
class _List_task extends StatelessWidget {
  final items = [
    _ListItem('El ', Color(0xffF08F66)),
    _ListItem('Futuro', Color(0xffF2A38A)),
    _ListItem('es hoy !!!', Color(0xffF7CDD5)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => items[index]);
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        padding: EdgeInsets.all(30),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          titulo,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
