enum EnvironmentType{dev, stg, prod}

abstract class EnvironmentBase{
  String get host;
  Duration get apiTimeout => const Duration(seconds: 60);
}

class _Product extends EnvironmentBase{
  @override
  String get host => "https://api.product";
}

class _Staging extends EnvironmentBase{
  @override
  // TODO: implement host
  String get host => "https://api.staging";
}

class _Develop extends EnvironmentBase{
  @override
  // TODO: implement host
  String get host => "https://api.develop";
}

class Environment{
  static EnvironmentBase _environment = _Develop();
  static String get host => _environment.host;
  static Duration get apiTimeout => _environment.apiTimeout;

  static void config(EnvironmentType type){
    switch(type){
      case EnvironmentType.dev: _environment = _Develop(); break;
      case EnvironmentType.stg: _environment = _Staging(); break;
      case EnvironmentType.prod: _environment = _Product(); break;
    }
  }
}