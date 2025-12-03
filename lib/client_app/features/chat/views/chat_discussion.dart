import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:taxi_app/client_app/features/chat/views/chat_call.dart';

class ChatDetailScreen extends StatefulWidget {
  final String doctorName;

  ChatDetailScreen({required this.doctorName});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController messageController = TextEditingController();

  // Temporary demo messages
  List<Map<String, dynamic>> messages = [
    {
      "text":
      "Lorem ipsum pulvinar metus facilisi sagittis dictum ipsum aliquam ultrices praesent ultricies commodo scelerisque.",
      "isMe": false,
      "time": "14:23",
      "avatar": "assets/images/img.png",
      "sender": "Kendrick"
    },
    {
      "text":
      "Lorem ipsum pulvinar metus facilisi sagittis dictum ipsum aliquam ultrices praesent ultricies commodo scelerisque.",
      "isMe": true,
      "time": "14:23",
      "avatar": "assets/images/img.png",
      "sender": "Kendrick"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: _buildChatHeader(),
      body: Column(
        children: [
          Expanded(child: _buildMessagesList()),
          _buildMessageInput(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildChatHeader() {
    return AppBar(
      // backgroundColor: Color(0xFF0B6F78),
      elevation: 0,
      leading: Icon(Icons.arrow_back, color: Colors.white),
      title: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage("assets/avatar.png"),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.doctorName,
                  style: TextStyle(fontSize: 16)),
              Text("Offline",
                  style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
      actions: [
        InkWell(
          onTap: () => Get.to(() => CallScreen()),
          child: CircleAvatar(
              backgroundColor: Color(0xFF0B6F78),
              child: Icon(Icons.call_outlined, color: Colors.white
              )
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }

  Widget _buildMessagesList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return _buildMessageBubble(messages[index]);
      },
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> msg) {
    bool isMe = msg["isMe"];

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment:
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [

              Flexible(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: isMe ? Color(0xFF0B6F78) : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        msg["text"],
                        style: TextStyle(
                          color: isMe ? Colors.white : Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    if (!isMe) ...[
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(msg["avatar"]),
                          ),
                          const SizedBox(width: 5,),
                          Text(
                            msg["sender"],
                            style: TextStyle(
                              color: isMe ? Colors.white : Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                    ],
                  ],
                ),
              ),
              if (isMe) ...[
                // SizedBox(width: 10),
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(msg["avatar"]),
                ),
              ],
            ],
          ),

          SizedBox(height: 9),

          // Timestamp
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                left: isMe ? 0 : 40,
                right: isMe ? 40 : 0,
              ),
              child: Text(
                msg["time"],
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: "Type your message here",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Icon(Icons.attach_file, color: Colors.grey),
          SizedBox(width: 10),
          Icon(Icons.send, color: Color(0xFF0B6F78)),
        ],
      ),
    );
  }
}
