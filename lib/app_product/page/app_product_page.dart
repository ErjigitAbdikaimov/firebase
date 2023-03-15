// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:jarnama_app/components/custom_text_field.dart';
import 'package:jarnama_app/components/image_container.dart';
import 'package:jarnama_app/model/produkt_model.dart';
import 'package:jarnama_app/services/date_time_service.dart';
import 'package:jarnama_app/services/loading_service.dart';
import 'package:jarnama_app/services/storage_service.dart';
import 'package:jarnama_app/services/store_service.dart';

class AppProductPage extends StatelessWidget {
  const AppProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    final desc = TextEditingController();
    final dateTime = TextEditingController();
    final phone = TextEditingController();
    final userName = TextEditingController();
    final adress = TextEditingController();
    final price = TextEditingController();
    List<XFile> images = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('AppProductPage'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CustomTextField(
            controller: title,
            hintText: 'Title',
          ),
          const SizedBox(height: 12),
          CustomTextField(
            controller: desc,
            maxLines: 4,
            hintText: 'Descroption',
          ),
          const SizedBox(height: 12),
          ImageContainer(
            images: images,
            onPicked: (value) => images = value,
            onDelete: (xfile) => images.remove(xfile),
          ),
          const SizedBox(height: 12),
          CustomTextField(
            controller: dateTime,
            hintText: 'DateTime',
            focusNode: FocusNode(),
            onTap: () async {
              await DateTimeService.showDateTimePicker(
                  context,
                  (value) =>
                      dateTime.text = DateFormat("d MMM , y").format(value)
                  // (value) => dateTime.text = value.toString(),
                  );
            },
          ),
          const SizedBox(height: 12),
          CustomTextField(
            controller: phone,
            hintText: 'Phone Number',
          ),
          const SizedBox(height: 12),
          CustomTextField(
            controller: userName,
            hintText: 'User Name',
          ),
          const SizedBox(height: 12),
          CustomTextField(
            controller: adress,
            hintText: 'Adress',
          ),
          const SizedBox(height: 12),
          CustomTextField(
            controller: price,
            hintText: 'Price',
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () async {
              LoadingService().showLoading(context);
              final urls = await StorageService().uploadImage(images);
              final product = Product(
                title: title.text,
                description: desc.text,
                dateTime: dateTime.text,
                phoneNumber: phone.text,
                userName: userName.text,
                adress: adress.text,
                images: urls,
                pricers: price.text,
              );
              await StoreService().saveProduct(product);
              // ignore: use_build_context_synchronously
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            icon: const Icon(Icons.publish),
            label: const Text('Add to fireStore'),
          ),
        ],
      ),
    );
  }
}
