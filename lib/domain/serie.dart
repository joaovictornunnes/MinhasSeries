class Serie{
//questão 2: criar classe
  static const String serieTable = "serie_table";
  static const String idColumn = "id";
  static const String nameColumn = "name";
  static const String autorColumn = "autor";
  static const String qntTemporadasColumn= "quantidade_temporadas";
  static const String avaliacaoColumn = "avaliacao";
  static const String generoColumn = "genero";
  static const String sinopseColumn = "sinopse";

  //1 primeira questão
  int id = 0;
  String name = '';
  String autor = '';
  int qntTemporadas = 0;
  double avaliacao = 0;
  String genero = '';
  String sinopse = '';

  Serie(this.name, this.autor, this.qntTemporadas, this.avaliacao, this.genero, this.sinopse);

  Serie.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    autor = map[autorColumn];
    qntTemporadas = map[qntTemporadasColumn];
    avaliacao = map[avaliacaoColumn];
    genero = map[generoColumn];
    sinopse = map[sinopseColumn];
  }

  Map<String, dynamic> toMap() {
    return {
      nameColumn: name,
      autorColumn: autor,
      qntTemporadasColumn:qntTemporadas,
      avaliacaoColumn:avaliacao,
      generoColumn:genero,
      sinopseColumn:sinopse
    };
  }

  @override
  String toString() {
    return 'Serie{nome: $name, autor: $autor, qntTemporadas: $qntTemporadas, avaliacao: $avaliacao, genero: $genero, sinopse: $sinopse}';
  }
}