class CountModel {
  int _count = 0;
  int _max = 0;
  int _total = 0;
  String _category = '';

  int get count => _count;
  int get max => _max;
  int get total => _total;
  String get category => _category;

  set maximum(int max) => _max = max;
  set increment(dynamic _) => _count += 1;
  set decrement(dynamic _) => _count -= 1;
  set total(int current) => _total += current;
  set mode(String category) => _category = category;
}
