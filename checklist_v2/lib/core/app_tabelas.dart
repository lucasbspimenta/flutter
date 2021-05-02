class AppTabelas {
  static final String usuario =
      'CREATE TABLE Usuario(matricula TEXT PRIMARY KEY,nome TEXT,foto TEXT)';

  static final String agendamentoTipos =
      'CREATE TABLE AgendamentoTipo(id INT PRIMARY KEY,nome TEXT,cor TEXT)';

  static final String agendamentos = '''CREATE TABLE Agendamento(
        id INT PRIMARY KEY,
        agendamentotipo_id INT,
        data NUMERIC,
        unidade TEXT,
        unidade_id INT,
        concluido NUMERIC,
        data_concluido NUMERIC,
        )''';

  static final String item = '''CREATE TABLE Item(
        id INT PRIMARY KEY,
        nome TEXT,
        descricao TEXT,
        foto NUMERIC,
        item_pai INT,
        )''';

  static final String checklist = '''CREATE TABLE Checklist(
        id INT PRIMARY KEY,
        data_concluido NUMERIC,
        data_concluido NUMERIC,
        agendamento_id INT,
        )''';

  static final String resposta = '''CREATE TABLE Resposta(
        id INT PRIMARY KEY,
        item_id INT,
        checklist_id INT,
        resposta TEXT,
        foto TEXT,
        )''';
}
