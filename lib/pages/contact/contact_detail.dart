import 'package:flutter/material.dart';
import 'package:onestop_dev/globals/my_colors.dart';
import 'package:onestop_dev/globals/my_fonts.dart';
import 'package:onestop_dev/models/contacts/contact_model.dart';
import 'package:onestop_dev/widgets/contact/contact_display.dart';

class Contacts2 extends StatefulWidget {
  final String title;
  ContactModel ? contact;
  Contacts2({Key? key, this.contact, required this.title}) : super(key: key);
  @override
  State<Contacts2> createState() => _Contacts2State();
}

class _Contacts2State extends State<Contacts2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlueGrey,
          leading: Container(),
          leadingWidth: 0,
          title: Text('Contacts', style: MyFonts.medium.size(20).setColor(kWhite)),
          actions: [
            IconButton(
                onPressed: () {Navigator.of(context).pop();},
                icon: Icon(IconData(0xe16a, fontFamily: 'MaterialIcons')))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      widget.contact!.name,
                      style: MyFonts.med6.size(16).setColor(kWhite),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      widget.contact!.group,
                      style: MyFonts.regular.size(14).setColor(kGrey2),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 2),
                  child: Text(
                    widget.contact!.contacts.length.toString()+' contacts',
                    style: MyFonts.medium.size(12).setColor(kGrey11),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                ContactTextHeader(text: 'Name', width: MediaQuery.of(context).size.width / 3 - 10, align: AlignmentDirectional.topStart),
                ContactTextHeader(text: 'Email id', width: MediaQuery.of(context).size.width / 3 - 10, align: AlignmentDirectional.center),
                ContactTextHeader(text: 'Contact No', width: MediaQuery.of(context).size.width / 3 - 15, align: AlignmentDirectional.bottomEnd),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.96,
              child: Divider(
                color: Colors.blueGrey,
                thickness: 1,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.contact!.contacts.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: Row(
                        children: [
                          ContactText(text: item.name, align: AlignmentDirectional.topStart),
                          ContactText(text: item.email, align: AlignmentDirectional.center),
                          ContactText(text: item.contact.toString(), align: AlignmentDirectional.bottomEnd),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
