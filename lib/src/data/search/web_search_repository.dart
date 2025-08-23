import 'package:flutter_app_template/src/data/search/adapters/stub_search_adapter.dart';

class WebSearchResult {
  final String url;
  final String title;
  final String snippet;

  const WebSearchResult({required this.url, required this.title, required this.snippet});
}

abstract class WebSearchRepository {
  Future<List<WebSearchResult>> search(String query, {int limit = 3});
}

class WebSearchRepositoryStub implements WebSearchRepository {
  final StubSearchAdapter _adapter;
  WebSearchRepositoryStub(this._adapter);

  @override
  Future<List<WebSearchResult>> search(String query, {int limit = 3}) async {
    return _adapter.search(query, limit: limit);
  }
}