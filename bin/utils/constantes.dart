const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');
const bool kProfileMode = bool.fromEnvironment('dart.vm.profile');
const bool kDebugMode = !kReleaseMode && !kProfileMode;

typedef MapFilter = Map<String, dynamic>;

const map = [
  {"cUf": 11, "sigla": "RO", "uf": "Rondônia"},
  {"cUf": 12, "sigla": "AC", "uf": "Acre"},
  {"cUf": 13, "sigla": "AM", "uf": "Amazonas"},
  {"cUf": 14, "sigla": "RR", "uf": "Roraima"},
  {"cUf": 15, "sigla": "PA", "uf": "Pará"},
  {"cUf": 16, "sigla": "AP", "uf": "Amapá"},
  {"cUf": 17, "sigla": "TO", "uf": "Tocantins"},
  {"cUf": 21, "sigla": "MA", "uf": "Maranhão"},
  {"cUf": 22, "sigla": "PI", "uf": "Piauí"},
  {"cUf": 23, "sigla": "CE", "uf": "Ceará"},
  {"cUf": 24, "sigla": "RN", "uf": "Rio Grande do Norte"},
  {"cUf": 25, "sigla": "PB", "uf": "Paraíba"},
  {"cUf": 26, "sigla": "PE", "uf": "Pernambuco"},
  {"cUf": 27, "sigla": "AL", "uf": "Alagoas"},
  {"cUf": 28, "sigla": "SE", "uf": "Sergipe"},
  {"cUf": 29, "sigla": "BA", "uf": "Bahia"},
  {"cUf": 31, "sigla": "MG", "uf": "Minas Gerais"},
  {"cUf": 32, "sigla": "ES", "uf": "Espírito Santo"},
  {"cUf": 33, "sigla": "RJ", "uf": "Rio de Janeiro"},
  {"cUf": 35, "sigla": "SP", "uf": "São Paulo"},
  {"cUf": 41, "sigla": "PR", "uf": "Paraná"},
  {"cUf": 42, "sigla": "SC", "uf": "Santa Catarina"},
  {"cUf": 43, "sigla": "RS", "uf": "Rio Grande do Sul"},
  {"cUf"}
];
