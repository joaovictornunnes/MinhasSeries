import 'package:flutter/material.dart';
import 'package:segunda_prova_app/domain/serie.dart';
import 'package:segunda_prova_app/helpers/serie_helper.dart';

import 'telaSobre.dart';

class TelaDetalhe extends StatefulWidget {
  const TelaDetalhe({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _TelaDetalheState createState() => _TelaDetalheState();
}

class _TelaDetalheState extends State<TelaDetalhe> {
  Serie? _serie;
  final seridHelper = SerieHelper();

  @override
  void initState() {
    super.initState();
    _loadSerie();
  }

  Future<void> _loadSerie() async {
    _serie = await seridHelper.getSerie(widget.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Detalhes da Série"),
      ),
      body: Center(
        child: _serie == null
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Detalhes da Série",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Text("Nome: ${_serie!.name}",
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text("Id: ${_serie!.id}",
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text("Autor: ${_serie!.autor}",
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text("Quantidade de temporadas: ${_serie!.qntTemporadas}",
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text("Avaliação: ${_serie!.avaliacao}",
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text("Gênero: ${_serie!.genero}",
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text("Sinopse: ${_serie!.sinopse}",
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
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
