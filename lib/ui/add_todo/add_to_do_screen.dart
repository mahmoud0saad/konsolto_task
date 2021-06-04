import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konsolto_app/CommonUtils/size_config.dart';
import 'package:konsolto_app/base/view/base_state.dart';
import 'package:konsolto_app/generated/l10n.dart';
import 'package:konsolto_app/res/colors.dart';
 import 'package:konsolto_app/widgets/submit_button_without_border.dart';
import 'package:provider/provider.dart';

import 'add_to_do_presenter.dart';
import 'add_to_do_provider.dart';

class AddToDoScreen extends StatefulWidget {
  static const String TAG = "/AboutNartaqiScreen";

  @override
  AddToDoScreenState createState() => AddToDoScreenState();
}

class AddToDoScreenState extends BaseState<AddToDoScreen, AddToDoPresenter>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  AddToDoProvider<dynamic> provider = AddToDoProvider<dynamic>();

  Color screenColor = MColors.primary_color;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<AddToDoProvider<dynamic>>(
      create: (_) => provider,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .07,
          leadingWidth: MediaQuery.of(context).size.height * .07,
          backgroundColor: MColors.page_background,
          centerTitle: true,
          title: Text(
            S.of(context).todoListApp,
            textScaleFactor: SizeConfig.textScaleFactor,
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => {Navigator.pop(context)},
          ),
        ),
        body: Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                buildTitleTextField(context),
                buildBodyTextField(context),
                SubmitButtonWithoutBorder(
                    onPressed: () {
                      mPresenter.addToDo();
                    },
                    label:S.of(context).add)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitleTextField(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(12)),

         ),
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth*.04,vertical: SizeConfig.screenWidth*.04),
      child: TextFormField(
        controller: mPresenter.titleController,
        decoration:  InputDecoration(
          fillColor: MColors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          hintText: "title",
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(fontSize: 14, color: Colors.grey),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(
              const Radius.circular(10),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(
              const Radius.circular(10),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              const Radius.circular(10),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              const Radius.circular(10),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              const Radius.circular(50),
            ),
          ),
        ),

        maxLength: 50,
        maxLengthEnforced: false,
        keyboardType: TextInputType.emailAddress,
        validator: (title) {
          if (title.isEmpty) {
            return S.of(context).titleShouldNotEmpty;
          }
          return null;
        },
        autofocus: false,
        textInputAction: TextInputAction.next,
      ),
    );
  }
  Widget buildBodyTextField(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(12)),

         ),
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth*.04,vertical: SizeConfig.screenWidth*.04),
      child: TextFormField(
        controller: mPresenter.bodyController,
        decoration:  InputDecoration(
          fillColor: MColors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          hintText: S.of(context).body,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(fontSize: 14, color: Colors.grey),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(
              const Radius.circular(10),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(
              const Radius.circular(10),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              const Radius.circular(10),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              const Radius.circular(10),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              const Radius.circular(50),
            ),
          ),
        ),

        maxLength: 50,
        maxLengthEnforced: false,
        keyboardType: TextInputType.emailAddress,
        validator: (title) {
          if (title.isEmpty) {
            return S.of(context).bodyShouldNotEmpty;
          }
          return null;
        },
        autofocus: false,
        textInputAction: TextInputAction.done,
      ),
    );
  }

  @override
  AddToDoPresenter createPresenter() {
    return AddToDoPresenter();
  }

  @override
  bool get wantKeepAlive => true;

  goBack() {
    Navigator.of(context).pop();
  }
}
