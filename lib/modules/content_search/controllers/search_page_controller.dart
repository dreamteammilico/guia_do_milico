import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:guia_do_milico/common/ui/helpers/loader.dart';
//import 'dart:html' as html;

import 'package:guia_do_milico/modules/content_search/repository/content_search_repository.dart';
import 'package:guia_do_milico/modules/permission/controllers/permission_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:word_cloud/word_cloud_data.dart';
import 'package:word_cloud/word_cloud_tap.dart';

import '../../../common/components/common_appbar.dart';

class SearchPageController extends GetxController
    with StateMixin<List<Map<String, dynamic>>> {
  late ContentSearchRepository repository;
  // SearchPageController({required this.repository});
  RxString? searchTermParam = "".obs;
  TextEditingController searchController = TextEditingController();
  PermissionController permission = Get.find();
  //WordCloudData myData = WordCloudData(data: List.empty());
  //late WordCloudTap myTap;
  //var byTag = false.obs;

  @override
  onInit() async {
    //WidgetsFlutterBinding.ensureInitialized();
    super.onInit();
    change(null, status: RxStatus.success());
    repository = Get.put(ContentSearchRepository());
    GetStorage().write('auth_ticket', repository.authenticate('admin', 'dreamteam'));
    //List<Map<String, dynamic>> tagsData = await getAllTagsWith();
    //myData = WordCloudData(data: tagsData);
    //myTap = await initializeMyCloudTap();
    //search();
  }

  // cloudPrepair() async {
  //   List<Map<String, dynamic>> tagsData = await getAllTagsWith();
  //   myData = WordCloudData(data: tagsData);
  //   myTap = await initializeMyCloudTap();
  // }

  // WordCloudData getMyData() {
  //   return myData;
  // }

  // Future<WordCloudTap> initializeMyCloudTap() async {
  //   List<Map<String, dynamic>> tagsData = await getAllTagsWith();
  //   int count = 0;
  //   String wordstring = '';
  //   WordCloudTap wordtaps = WordCloudTap();
  //   for (int i = 0; i < tagsData.length; i++) {
  //     void tap() {
  //       count += 1;
  //       wordstring = tagsData[i]['word'];
  //       searchTermParamUpdate(wordstring);
  //       byTagParamUpdate(true);
  //       search();
  //     }

  //     wordtaps.addWordtap(tagsData[i]['word'], tap);
  //   }
  //   myTap=wordtaps;
  //   return wordtaps;
  // }

  searchTermParamUpdate(String? searchTerm) {
    searchController.text = searchTerm!;
    searchTermParam!.value = searchTerm!;
    update();
  }

  enterPage(){
    searchController.text = "";
    change(null, status: RxStatus.success());
  }


  // byTagParamUpdate(bool param) {
  //   byTag.value = param;
  //   update();
  // }

Future<void> displayPdf(Uint8List pdfData,BuildContext context, String nameFile) async {

  Directory? tempDir = await  getExternalStorageDirectory();
  final tempFile = File('${tempDir!.path}/$nameFile.pdf');
  var exists = await tempDir.exists();
  if (tempDir == null  && !exists) {
    Get.snackbar(
      backgroundColor: Colors.red,
      "Falha",
      'Não foi possível salvar o documento. Verifique suas permissões',
    );

    return;
  }
  await permission.requestStoragePermission();


  await tempFile.writeAsBytes(pdfData);
  LoadDialog.showToast("Documento salvo em downloads", MessageType.neutral);
    // ignore: use_build_context_synchronously
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: CommonAppBar(title: nameFile,

          actions: [
            IconButton(onPressed: (){
              shareFile(tempFile);
            }, icon: Icon(Icons.share))
          ],
        ),

        body: PDFView(
          filePath: tempFile.path,
        ),
      ),
    ),
  );
}
Future<void> downloadFile(String id, String nome,BuildContext context) async {
   LoadDialog.show(text: "Baixando arquivo...");
  final response = await repository.downloadFile(id, nome);
  if (response != null) {
    final Uint8List pdfData = response;

    displayPdf(pdfData,context, nome);
    LoadDialog.hide();
  } else {
    LoadDialog.hide();

    Get.snackbar(
      backgroundColor: Colors.red,
      "Falha",
      'Não foi possível efetuar o download do documento. Verifique a conexão com a internet',
    );
    change([], status: RxStatus.error());
  }
}



  void shareFile(File file) async {
    XFile? newFile = XFile(file.path);;

    if (newFile != null) {
      Share.shareXFiles([newFile],
          text: 'Confira este arquivo que estou compartilhando.');
    } else {
      Get.snackbar(
        backgroundColor: Colors.red,
        "Falha",
        'Ocorreu uma falha ao compartilhar',
      );    }
  }

  // Future<List<Map<String, dynamic>>> getAllTagsWith() {
  //   change([], status: RxStatus.loading());
  //   var response = repository.getAllTags();
  //   change([], status: RxStatus.success());
  //   return response;
  // }

  search() async {
    change([], status: RxStatus.loading());
    final response = await repository.searchDocuments(searchTermParam!.value,
        byTag: false);


    if (response.isNotEmpty) {
      final Map<String, dynamic> searchResult = response;
      final List<dynamic> entries = searchResult["entries"];
      List<Map<String, dynamic>> results = [];
      for (dynamic entry in entries) {
        String name = entry["entry"]["name"];
        if (name.endsWith(".pdf")) {
          name = name.substring(0, name.length - 4);
          String snippet;
          try {
            var search = entry["entry"]['search'];
            var highlight = search['highlight'];
            var snippets = highlight[0]['snippets'];
            snippet = snippets[0];
            List<String> words = snippet.split(" ");
            if (words.length >= 2) {
              words.removeAt(0);
              words.removeAt(words.length - 1);
              snippet = words.join(" ");
            }
          } catch (e) {
            snippet = "Não foi possível obter o trecho do texto";
            change(state, status: RxStatus.error());
          }
          snippet = snippet.replaceAll(RegExp(r'\s+'), ' ');
          snippet = snippet.replaceAll(RegExp(r'[0-9\.]'), ' ');
          final String idDocument = "${entry["entry"]["id"]}";
          results.add({
            "name": name,
            "snippet": snippet,
            "idDocument": idDocument,
          });
        }
      }
      if(results.isEmpty){
        change([], status: RxStatus.empty());
      }else{
        change(results, status: RxStatus.success());
      }
    } else {
      change([], status: RxStatus.empty());
    }
  }



  String? validator(String? value) {
    if (value != null && value.trim().isEmpty) {
      return 'Digite um termo para pesquisar';
    }
    return null;
  }
}
