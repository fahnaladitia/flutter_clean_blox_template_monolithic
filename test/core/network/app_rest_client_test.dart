import 'package:flutter_clean_blox_template/core/config/config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/core/network/network.dart'; // Ganti dengan path sesuai proyekmu

void main() {
  late AppRestClient client;

  setUp(() {
    AppConfig.resetForTest(); // Pastikan state fresh sebelum setiap test
    AppConfig.load(AppFlavor.staging); // Atur flavor sesuai kebutuhan
    client = AppRestClientImpl.create(
      baseURL: 'https://jsonplaceholder.typicode.com',
      apiKey: 'dummy-api-key', // Tidak digunakan tapi tetap diuji
    );
  });

  group('AppRestClientImpl with JSONPlaceholder', () {
    test('GET /posts/1 returns correct data', () async {
      // ACT
      final response = await client.get<Map<String, dynamic>>('/posts/1');

      // ASSERT
      expect(response.statusCode, 200);
      expect(response.data, isA<Map<String, dynamic>>());
      expect(response.data!['id'], 1);
    });

    test('POST /posts creates a new post', () async {
      // ARRANGE
      final data = {'title': 'foo', 'body': 'bar', 'userId': 1};

      // ACT
      final response = await client.post<Map<String, dynamic>>(
        '/posts',
        data: data,
      );

      // ASSERT
      expect(response.statusCode, 201);
      expect(response.data, containsPair('title', 'foo'));
      expect(response.data, containsPair('userId', 1));
    });

    test('PUT /posts/1 updates a post', () async {
      // ARRANGE
      final data = {
        'id': 1,
        'title': 'updated',
        'body': 'new body',
        'userId': 1,
      };

      // ACT
      final response = await client.put<Map<String, dynamic>>(
        '/posts/1',
        data: data,
      );

      // ASSERT
      expect(response.statusCode, 200);
      expect(response.data!['title'], equals('updated'));
    });

    test('PATCH /posts/1 partially updates a post', () async {
      // ARRANGE
      final patch = {'title': 'patched title'};

      // ACT
      final response = await client.patch<Map<String, dynamic>>(
        '/posts/1',
        data: patch,
      );

      // ASSERT
      expect(response.statusCode, 200);
      expect(response.data!['title'], equals('patched title'));
    });

    test('DELETE /posts/1 deletes a post', () async {
      // ACT
      final response = await client.delete('/posts/1');

      // ASSERT
      expect(response.statusCode, 200);
      expect(response.data, isNotNull);
    });
  });
}
