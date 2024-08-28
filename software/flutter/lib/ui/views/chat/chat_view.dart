import 'package:diabeticretinopathydetection/app/constants/validators.dart';
import 'package:diabeticretinopathydetection/ui/common/ui_helpers.dart';
import 'package:diabeticretinopathydetection/ui/views/chat/chat_view.form.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'chat_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'message',
    validator: FormValidators.validateText,
  )
])
class ChatView extends StackedView<ChatViewModel> with $ChatView {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChatViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
              child: SingleChildScrollView(
            reverse: true,
          )),
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 212, 69, 30),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                       Expanded(
                        child: TextField(
                          onChanged:(newText)=> viewModel.updateMsgText(newText),
                          controller: messageController,
                          decoration: const InputDecoration(
                              hintText: "Write message...",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        
                        onPressed: () {},
                        backgroundColor: const Color.fromARGB(255, 212, 69, 30),
                        elevation: 0,
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      horizontalSpaceSmall
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  ChatViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatViewModel();
}
