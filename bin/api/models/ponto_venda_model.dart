import 'computador_model.dart';
import 'conta_movimento_model.dart';

import 'impressora_model.dart';

class PontoVenda {
  final int id;
  final String apelidoPdv;
  final DateTime dataCadastro;
  final bool imprimeNFCE;
  final bool imprimeCOMPROVANTE;
  final String iniciarTela;
  final String modeloImpressao;
  final bool realizaTef;
  final bool registraItens;
  final String tipo;
  final String tipoTerminal;
  final DateTime syncDataAtualizacao;
  final ComputadorModel computador; // COMPUTADOR_ID int
  final ContaMovimentoModel contaMovimento; // CONTAMOVIMENTO_ID int
  final ImpressoraModel impressora; // IMPRESSORA_ID int
  final String textoTerminalCaixa;

  PontoVenda(
    this.id,
    this.apelidoPdv,
    this.dataCadastro,
    this.imprimeNFCE,
    this.imprimeCOMPROVANTE,
    this.iniciarTela,
    this.modeloImpressao,
    this.realizaTef,
    this.registraItens,
    this.tipo,
    this.tipoTerminal,
    this.syncDataAtualizacao,
    this.computador,
    this.contaMovimento,
    this.impressora,
    this.textoTerminalCaixa,
  );

  String get nomeTabela => "pdv_pontovenda";
}

// Table: pdv_pontovenda
// Columns:
// ID int AI PK
// APELIDOPDV varchar(255)
// DATACADASTRO date
// IMPRIMENFCE tinyint(1)
// IMPRIMIRCOMPROVANTENFE tinyint(1)
// INICIARTELA varchar(1)
// MODELOIMPRESSAO varchar(1)
// REALIZATEF tinyint(1)
// REGISTRAITENS tinyint(1)
// TIPO varchar(255)
// TIPOTERMINAL varchar(1)
// SYNC_DATAATUALIZACAO datetime
// COMPUTADOR_ID int
// CONTAMOVIMENTO_ID int
// IMPRESSORA_ID int
// TEXTOTERMINALCAIXALIVRE varchar(255)
