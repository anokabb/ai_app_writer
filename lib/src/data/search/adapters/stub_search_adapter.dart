import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/data/search/web_search_repository.dart';

class StubSearchAdapter {
  final ProviderConfig _config = locator<ProviderConfig>();

  Future<List<WebSearchResult>> search(String query, {int limit = 3}) async {
    // TODO: Replace with real web search API using _config.searchBaseUrl/_config.searchApiKey
    final results = List.generate(limit, (i) {
      return WebSearchResult(
        url: 'https://example.com/${Uri.encodeComponent(query)}/$i',
        title: 'Reference ${i + 1} for "$query"',
        snippet: 'This is a stubbed search result snippet for "$query" (item ${i + 1}).',
      );
    });
    return results;
  }
}