import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:habit/constant/size.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _urlFocusNode = FocusNode();
  final _actionNameController = TextEditingController(text: '');
  final _urlController = TextEditingController(text: '');

  @override
  void dispose() {
    _actionNameController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add action'),
          actions: [
            IconButton(
              onPressed: () => context.goNamed('qr_scan'),
              icon: const Icon(Icons.qr_code_scanner),
            )
          ],
        ),
        body: SingleChildScrollView(
          reverse: true,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: S4),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GAP3,
                TextFormField(
                  autofocus: true,
                  controller: _actionNameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(labelText: 'Action name'),
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_urlFocusNode),
                  validator: (e) {
                    if (e == null) return 'ERROR';

                    return null;
                  },
                ),
                GAP3,
                TextFormField(
                  focusNode: _urlFocusNode,
                  controller: _urlController,
                  keyboardType: TextInputType.url,
                  // keyboardType:
                  //     widget.maxLine == 1 ? TextInputType.text : TextInputType.multiline,
                  decoration: const InputDecoration(labelText: 'url'),
                  onFieldSubmitted: (e) {},
                  validator: (e) {
                    if (e == null) return 'ERROR';

                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            FocusScope.of(context).unfocus();

            if (!_formKey.currentState!.validate()) return;

            _formKey.currentState?.save();
          },
          label: const Text('Done'),
        ),
      ),
    );
  }
}
