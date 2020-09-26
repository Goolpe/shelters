import 'package:timeago/timeago.dart' as timeago;

timeago.LookupMessages selectLocale(String locale){
  switch(locale){
    case 'ru': return SheltersRuTime();
    default: return SheltersEnTime();
  }
}

class SheltersEnTime extends timeago.EnMessages {
  @override
  String suffixAgo() => '';
}

class SheltersRuTime extends timeago.RuMessages {
  @override
  String suffixAgo() => '';
}
