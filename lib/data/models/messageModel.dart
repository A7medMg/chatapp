class MessageModel {
  final String message;
  final String messageEmail;
  MessageModel({required this.message,required this.messageEmail});
  factory MessageModel.fromJson( json) {
    return MessageModel(
      message: json['text'],
      messageEmail: json['email'],
    );
  }
}