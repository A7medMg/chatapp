import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../data/models/messageModel.dart';
import '../../data/webServices/cache.dart';
import '../../data/webServices/data.dart';
import '../widget/customChatitem.dart';
import '../widget/customChatitemFeind.dart';

class Homescreen extends StatefulWidget {
  static String id = "home";

  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final CollectionReference messagesCollection =
  FirebaseFirestore.instance.collection('messages');

  final ScrollController _scrollController = ScrollController();

  String? myEmail;

  @override
  void initState() {
    super.initState();
    myEmail = CacheHelper.getEmail();
  }

  @override
  void dispose() {
    messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messagesCollection.orderBy('timestamp').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        List<MessageModel> messagesList = snapshot.data!.docs
            .map((doc) => MessageModel.fromJson(doc))
            .toList();

        // ينزل لآخر رسالة تلقائي
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.jumpTo(
              _scrollController.position.maxScrollExtent,
            );
          }
        });

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Chats",
              style: TextStyle(
                color: Color(0xffA23603),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    final message = messagesList[index];

                    if (message.messageEmail == myEmail) {
                      return CustomChatItem(messageModel: message);
                    } else {
                      return Customchatitemferind(messageModel: message);
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: messageController,
                    minLines: 1,
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "";
                      }
                      return null;
                    },
                    onFieldSubmitted: sendMessage,
                    decoration: InputDecoration(
                      hintText: "Message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.send,
                          color: Color(0xffA23603),
                          size: 30,
                        ),
                        onPressed: () => sendMessage(messageController.text),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> sendMessage(String text) async {
    if (!formKey.currentState!.validate()) return;

    await DataMethods().addUser(text, messagesCollection);
    messageController.clear();
  }
}
