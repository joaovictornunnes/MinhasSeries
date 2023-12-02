import 'package:flutter/material.dart';
import 'package:segunda_prova_app/domain/serie.dart';
import 'package:segunda_prova_app/helpers/serie_helper.dart';
import 'package:segunda_prova_app/widgets/custom_form_field.dart';
import 'package:segunda_prova_app/widgets/custom_rating_bar.dart';

import 'telaSobre.dart';
//questão 6: criar tela detalhe.
class TelaAltera extends StatefulWidget {
  const TelaAltera({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _TelaAlteraState createState() => _TelaAlteraState();
}

class _TelaAlteraState extends State<TelaAltera> {
  final _formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final autorController = TextEditingController();
  final qntTemporadasController = TextEditingController();
  double rating = 0.0;
  final generoController = TextEditingController();
  final sinopseController = TextEditingController();

  final seridHelper = SerieHelper();
  Serie? _serie;

  @override
  void initState() {
    super.initState();
    _loadSerie();
  }

  Future<Serie> _loadSerie() async {
    _serie = await seridHelper.getSerie(widget.id);
    nomeController.text = _serie!.name;
    autorController.text = _serie!.autor;
    qntTemporadasController.text = _serie!.qntTemporadas.toString();
    rating = _serie!.avaliacao;
    generoController.text = _serie!.genero;
    sinopseController.text = _serie!.sinopse;
    return _serie!;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Serie>(
      future: _loadSerie(),
      builder: (BuildContext context, AsyncSnapshot<Serie> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Alterar Série'),
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          Serie serie = snapshot.data!;
          nomeController.text = serie.name;
          autorController.text = serie.autor;
          qntTemporadasController.text = serie.qntTemporadas.toString();
          rating = serie.avaliacao;
          generoController.text = serie.genero;
          sinopseController.text = serie.sinopse;

          return Scaffold(
            appBar: AppBar(
              title: Text('Alterar Série'),
            ),
            body: Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  CustomFormField(
                    controller: nomeController,
                    labelText: "Nome",
                    validate_function: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Adicione um Nome';
                      }
                      return null;
                    },
                  ),
                  CustomFormField(
                    controller: autorController,
                    labelText: "Autor",
                    validate_function: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Adicione um autor';
                      }
                      return null;
                    },
                  ),
                  CustomFormField(
                    controller: qntTemporadasController,
                    labelText: "Quantidade de temporadas",
                    validate_function: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Adicione uma quantidade de temporadas';
                      }
                      return null;
                    },
                  ),
                  CustomFormField(
                    controller: generoController,
                    labelText: "Gênero",
                    validate_function: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Adicione um gênero';
                      }
                      return null;
                    },
                  ),
                  CustomFormField(
                    controller: sinopseController,
                    labelText: "Sinopse",
                    validate_function: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Adicione uma sinopse';
                      }
                      return null;
                    },
                  ),
                  CustomRatingBar(
                    ratingFunction: (value) {
                      rating = value;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _serie!.name = nomeController.text;
                        _serie!.autor = autorController.text;
                        _serie!.qntTemporadas =
                            int.parse(qntTemporadasController.text);
                        _serie!.avaliacao = rating;
                        _serie!.genero = generoController.text;
                        _serie!.sinopse = sinopseController.text;
                        seridHelper.updateSerie(_serie!);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Série alterada com sucesso!'),
                        ));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Confirmar'),
                  ),
                ],
              ),
            ),
          );
        }
      },
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
