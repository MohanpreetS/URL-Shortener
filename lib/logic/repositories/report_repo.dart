import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '/models/report_model.dart';
import '../../models/user_model.dart';

//TODO: add snackbars for all the success failures
class ReportRepo extends GetxController {
  static ReportRepo get instance => Get.find();

  final _storage = FirebaseStorage.instance;
  final _db = FirebaseFirestore.instance;
  List<ReportModel>? reports;

  bool valuesChanged = false;

  Future<List<ReportModel>> fetchReports() async {
    if (reports == null || valuesChanged) {
      reports = await getReports();
      valuesChanged = false;
      return Future.delayed(Duration.zero, () => reports!);
    }
    return reports!;
  }

  Future<List<ReportModel>> getReports() async {
    final snapshot = await _db.collection("Reports").get();
    final testList = snapshot.docs.map((doc) => ReportModel.fromSnapshot(doc)).toList();
    return testList;
  }

  Future<FilePickerResult?> pickWordFile() async {
    final filePickerResult = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: ["pdf", "doc", "docx", "docm"],
      type: FileType.custom,
    );
    return filePickerResult;
  }

  Future<void> pickAndUploadPdf(UserModel user, String testName, String pFname, String pLname) async {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    DateFormat dateFormat2 = DateFormat("ddMMyyyymmss");
    DateTime dtNow = DateTime.now();
    String date = dateFormat.format(dtNow);
    String dtKey = dateFormat2.format(dtNow);

    //final String reference = "reports/${user.firstName}_${testName}_$dtKey";

    //final reportsRef = _storage.ref().child(reference);

    final filePicker = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: ["pdf", "doc", "docx", "docm"],
      type: FileType.custom,
    );

    Uint8List? fileBytes = filePicker!.files.single.bytes;
    // UploadTask uploadTask = reportsRef.putData(fileBytes!);
    final String reference = "reports/${dtKey}_${filePicker.files.single.name}";
    UploadTask uploadTask = _storage.ref().child(reference).putData(fileBytes!);

    String? downloadUrl;

    await uploadTask.whenComplete(() async {
      downloadUrl = await _storage.ref().child(reference).getDownloadURL();
    });

    ReportModel report = ReportModel(
      reference: reference,
      userId: user.id!,
      firstName: pFname,
      lastName: pLname,
      phoneNo: user.phoneNo,
      downloadUrl: downloadUrl!,
      date: date,
      testName: testName,
    );

    await addReport(report);
  }

  Future<void> addReport(ReportModel report) async {
    DateFormat dateFormat2 = DateFormat("ssmmHHddMMyyyy");
    String dtKey = dateFormat2.format(DateTime.now());

    await _db.collection("Reports").doc("r$dtKey").set(report.toJson());
  }

  Future<void> updateReport(ReportModel report) async {
    await _db.collection("Reports").doc(report.id).update(report.toJson());
  }

  Future<void> deleteReport(ReportModel report) async {
    await _db.collection("Reports").doc(report.id).delete();
    await _storage.ref(report.reference).delete();
  }
}
