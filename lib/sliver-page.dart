import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _List_task(),
      body: Stack(children: [
        _ManinScroll(),
        Positioned(
          bottom: -10,
          right: 0,
          child: _BotonNewList(),
        )
      ]),
    );
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width * 0.8,
      height: 70,
      child: RaisedButton(
        onPressed: () {},
        color: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
        ),
        child: Text('Asignar nueva tarea',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            )),
      ),
    );
  }
}

class _ManinScroll extends StatelessWidget {
  final items = [
    _ListItem('El ', Color(0xffF08F66)),
    _ListItem('Futuro', Color(0xffF2A38A)),
    _ListItem('es hoy ggg!!!', Color(0xffF7CDD5)),
    _ListItem('es hoy ggg!!!', Color(0xffF7CDD5)),
    _ListItem('es hoy ggg!!!', Color(0xffF7CDD5)),
    _ListItem('es hoy ggg!!!', Color(0xffF7CDD5)),
    _ListItem('es hoy ggg!!!', Color(0xffF7CDD5)),
    _ListItem('es hoy ggg!!!', Color(0xffF7CDD5)),
    _ListItem('El ', Color(0xffF08F66)),
    _ListItem('Futuro', Color(0xffF2A38A)),
    _ListItem('es hoy ggg!!!', Color(0xffF7CDD5)),
    _ListItem('es hoy ggg!!!', Color(0xffF7CDD5)),
    _ListItem('es hoy ggg!!!', Color(0xffF7CDD5)),
    _ListItem('es hoy ggg!!!', Color(0xffF7CDD5)),
    _ListItem('es hoy ggg!!!', Color(0xffF7CDD5)),
    _ListItem('es hoy ggg!!!', Color(0xffF7CDD5)),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      /* SliverAppBar(
        floating: true,
        backgroundColor: Colors.red,
        title: Text("data"),
      ), */
      SliverPersistentHeader(
        floating: true,
        delegate:
            _SliderCustomDelegate(200, 100, _Titulo("Esto es una prueba")),
      ),
      SliverList(
          delegate: SliverChildListDelegate([
        ...items,
        SizedBox(
          height: 100,
        )
      ]))
    ]);
  }
}

class _Titulo extends StatelessWidget {
  final String titulo;
  const _Titulo(@required this.titulo);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: double.infinity,
        child: Center(
          child: Text(titulo),
        ));
  }
}

class _SliderCustomDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;
  _SliderCustomDelegate(
    @required this.minheight,
    @required this.maxheight,
    @required this.child,
  );
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => (minheight > maxheight) ? minheight : maxheight;

  @override
  // TODO: implement minExtent
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant _SliderCustomDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight < oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}

// header de nuestra app
class _List_task extends StatelessWidget {
  final items = [
    _ListItem('El ', Color(0xffF08F66)),
    _ListItem('Futuro', Color(0xffF2A38A)),
    _ListItem('es hoy ggg!!!', Color(0xffF7CDD5)),
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
