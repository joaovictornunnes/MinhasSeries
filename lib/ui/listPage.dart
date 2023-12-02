import 'package:flutter/material.dart';

import '../domain/serie.dart';
import '../helpers/serie_helper.dart';
import 'telaAltera.dart';
import 'telaDetalhe.dart';
import 'telaSobre.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Minhas Séries"),
      ),
      body: const ListBody(),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}

class ListBody extends StatefulWidget {
  const ListBody({super.key});

  @override
  State<ListBody> createState() => _ListBodyState();
}

class _ListBodyState extends State<ListBody> {
  late Future<List> serie;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    serie = SerieHelper().getAll();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: serie,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  return ListItem(serie: snapshot.data![i]);
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

class ListItem extends StatelessWidget {
  final Serie serie;
  const ListItem({super.key, required this.serie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TelaDetalhe(id: serie.id),
          ),
        );
      },
      onLongPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TelaAltera(id: serie.id),
          ),
        );
      },
      child: ListTile(
        title: Text(serie.name),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget HomeBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AppBar(
            title: const Text('Sobre'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.info),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaSobre()),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
