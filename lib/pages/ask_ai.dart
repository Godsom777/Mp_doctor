import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mp_doctor/components/my_card.dart';
import 'package:mp_doctor/components/my_textfield.dart';
import 'package:mp_doctor/main.dart';

import '../components/myIcons.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

// Step 3: Create an instance of GeminiController

const BoxShadow myShadow = BoxShadow(
  color: Color.fromARGB(31, 146, 139, 188),
  blurRadius: 18.60,
  offset: Offset(0, 20),
  spreadRadius: 0,
);

const Color myCardColor = Color(0xffFBFDFA); //soft white color
Color logoColor = const Color(0xff3F3F69); //get the logo color
DateTime now = DateTime.now(); // Get current local time
String formattedTime = DateFormat('hh:mm a').format(now);
Color myBgColor = const Color(0xFFEFF1EE);

//  date using DateFormat
String formattedDate = DateFormat('EE, MMM d, yy').format(now);

Text h2Text(String text, double size, FontWeight weight, Color logoColor) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style:
        GoogleFonts.koHo(fontSize: size, fontWeight: weight, color: logoColor),
  );
}

class SectionItem {
  final int index;
  final String title;
  final Widget widget;

  SectionItem(this.index, this.title, this.widget);
}

int _selectedItem = 0;

final _sections = <SectionItem>[
  // SectionItem(0, 'Stream text', const SectionTextStreamInput()),
  // SectionItem(1, 'textAndImage', const SectionTextAndImageInput()),
  SectionItem(0, 'chat', const SectionChat()),
  // SectionItem(3, 'Stream chat', const SectionStreamChat()),
  // SectionItem(4, 'text', const SectionTextInput()),
  // SectionItem(5, 'embedContent', const SectionEmbedContent()),
  // SectionItem(6, 'batchEmbedContents', const SectionBatchEmbedContents()),
  // SectionItem(7, 'response without setState()', const ResponseWidgetSection()),
];

//////////////////////////////////////////////////////////////
///
class SectionChat extends StatefulWidget {
  const SectionChat({super.key});

  @override
  State<SectionChat> createState() => _SectionChatState();
}

class _SectionChatState extends State<SectionChat> {
  final controller = TextEditingController();
  final gemini = Gemini.instance;
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool set) => setState(() => _loading = set);
  final List<Content> chats = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatModel>(
      builder: (context, chatModel, child) {
        return Column(
          children: [
            Expanded(
                child: chatModel.chats.isNotEmpty
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: SingleChildScrollView(
                          reverse: true,
                          child: ListView.builder(
                            itemBuilder: chatItem,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: chatModel.chats.length,
                            reverse: false,
                          ),
                        ),
                      )
                    : const Center(child: Text('Ask any health question!'))),
            if (loading) const CircularProgressIndicator(),
            ChatInputBox(
              controller: controller,
              onSend: () {
                if (controller.text.isNotEmpty) {
                  final searchedText = controller.text;
                  chatModel.addChat(
                      Content(role: 'You', parts: [Parts(text: searchedText)]));
                  controller.clearComposing();
                  loading = true;

                  gemini.chat(chatModel.chats).then((value) {
                    chatModel.addChat(Content(
                        role: 'Yiatsi', parts: [Parts(text: value?.output)]));
                    loading = false;
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget chatItem(BuildContext context, int index) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context, listen: false);
    final Content content = chats[index];

    return Card(
      elevation: 1,
      color: provider.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(content.role ?? 'role'),
            Markdown(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                data:
                    content.parts?.lastOrNull?.text ?? 'cannot generate data!'),
          ],
        ),
      ),
    );
  }
}

class ChatModel extends ChangeNotifier {
  final List<Content> chats = [];

  void addChat(Content chat) {
    chats.add(chat);
    notifyListeners();
  }
}
