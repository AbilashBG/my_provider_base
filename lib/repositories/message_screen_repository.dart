import '../utils/api_end_points.dart';
import '../utils/enums.dart';
import '../utils/helper/api_helper.dart';

class MessageScreenRepository with ApiHelper {
  Future<void> sendTelegramMessage(String message) async {
    try {
      final Map<String, dynamic> body = {
        'chat_id': '5751447516',
        'text': message,
      };

      final response = await request(
        baseUrl: telegramBaseUrl,
        type: RequestType.post,
        endpoint: telegramEndPoint,
        data: body,
      );

      if (response['ok']) {
        print('Message sent successfully!');
      } else {
        print('Failed to send message: ${response['description']}');
      }
    } catch (e) {
      print('Error sending message: $e');
    }
  }
}
