void main() {
  sendMessage('Hello there!');
  sendMessage('Please respond ASAP.', urgent: true);
}

void sendMessage(String message, {bool urgent = false}) {
  if (urgent) {
    print('Sending urgent message: $message');
  } else {
    print('Sending message: $message');
  }
}
