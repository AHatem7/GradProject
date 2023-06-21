// // import 'package:flutter/material.dart';
// // import 'package:untitled2/attributes.dart';
// // import 'package:untitled2/classUploadFile.dart';
// // import 'package:untitled2/editfileDB.dart';
// // import 'package:untitled2/loading.dart';
// // import 'Departments.dart';
// // import 'drop_bottom.dart';
// // import 'package:untitled2/firebase_utils.dart';
// // import 'package:firebase_database/firebase_database.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// //
// //
// // class UploadFile extends StatefulWidget {
// //   static const String routename = 'UploadFile';
// //
// //   const UploadFile({Key? key}) : super(key: key);
// //
// //   @override
// //   State<UploadFile> createState() => _UploadFileState();
// // }
// //
// // class _UploadFileState extends State<UploadFile> {
// //   // GlobalKey<FormState> formController = GlobalKey<FormState>();
// //   // //final _formKey = GlobalKey<FormState>();
// //   var formKey = GlobalKey<FormState>();
// //   List<String> items = ['Department 1', 'Departement 2', 'Department 3','Departement 4'];
// //
// // @override
// //   // void initState() {
// //   //   // TODO: implement initState
// //   //   super.initState();
// //   //   FileName = '';
// //   //   Describtion = '';
// //   // }
// //   // String FileName = '';
// //   // String Describtion = '';
// //
// //
// //   String? selectedItem = 'Departement 1';
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Stack(
// //       children: [
// //         Image.asset('assets/images/bac.png',
// //           width: double.infinity,
// //           fit: BoxFit.fill,),
// //
// //         Scaffold(
// //           resizeToAvoidBottomInset: false,
// //           backgroundColor: Colors.transparent,
// //
// //           body: SingleChildScrollView(
// //             child: Column(
// //               children: [const Padding(padding: EdgeInsets.symmetric(vertical: 25)),
// //
// //                 Row(
// //                   children: [const Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
// //                     FloatingActionButton(onPressed: (){
// //                       Navigator.pop(context, MaterialPageRoute(builder: (context)=> const Departments()));
// //
// //                     },
// //                       child: const Icon(Icons.arrow_back, color: Colors.black,size: 35),
// //                       backgroundColor: Colors.white,)
// //                   ],
// //                 ),
// //                 const SizedBox(
// //                   height: 20,
// //                 ),
// //                 Opacity(
// //                   opacity: 0.5,
// //                   child: Center(
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         Card(
// //                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// //                           child:
// //                           InkWell(
// //                             onTap: (){
// //
// //                             },
// //                             child: Container(
// //                               child:
// //                               Column( mainAxisAlignment: MainAxisAlignment.center,
// //                                 crossAxisAlignment: CrossAxisAlignment.center,
// //                                 children: const [
// //                                   Icon(Icons.cloud_upload_outlined, size: 100,),
// //                                   Text('Upload')
// //                                 ],
// //                               ),
// //                               width: 341,
// //                               height: 341,
// //
// //                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
// //                               ),
// //
// //                             ),
// //
// //                           ),
// //
// //                         )
// //                       ],
// //                     ),
// //
// //                   ),
// //                 ),
// //
// //                 // Center(
// //                 //   child: DropdownButton<String>(
// //                 //     value: selectedItem,
// //                 //     items : items
// //                 //         .map((item) => DropdownMenuItem<String>(
// //                 //       value: item,
// //                 //       child: Text(item, style: TextStyle(fontSize: 24)),
// //                 //     ))
// //                 //         .toList(),
// //                 //     onChanged: (item) => setState(() => selectedItem = item),
// //                 //
// //                 //   ),
// //                 // ),
// //
// //                 const SizedBox(
// //                   height: 20,
// //                 ),const DropDownButton(),
// //
// //                 SizedBox(
// //                   width: 312,
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     children:
// //                     [
// //
// //                     ],
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 20),
// //                 // Form(
// //                 //     key: formController,
// //                 //     child:
// //                 //     Column(
// //                 //       children: [
// //                 //         Row( mainAxisAlignment: MainAxisAlignment.center,
// //                 //           children: [
// //                 //             SizedBox(
// //                 //               height: 50,
// //                 //               width: 300,
// //                 //               child: TextFormField(
// //                 //                 decoration: InputDecoration(
// //                 //                     border: UnderlineInputBorder(),
// //                 //                     hintText: 'Name ',
// //                 //                     hintStyle: const TextStyle(color: Colors.black,)),
// //                 //                 //keyboardType: TextInputType.emailAddress,
// //                 //                 validator: (value) {
// //                 //                   if(value!.isEmpty) {
// //                 //                     return 'Name';
// //                 //                   }
// //                 //                   return null;
// //                 //                 },
// //                 //                 onSaved: (value){
// //                 //                   FileName = value!;
// //                 //                 },
// //                 //               ),
// //                 //             ),
// //                 //           ],
// //                 //         ),
// //                 //
// //                 //         const SizedBox(height: 20),
// //                 //
// //                 //         Row( mainAxisAlignment: MainAxisAlignment.center,
// //                 //           children: [
// //                 //             SizedBox(
// //                 //               height: 50,
// //                 //               width: 300,
// //                 //               child: TextFormField(
// //                 //                 decoration: InputDecoration(
// //                 //                     border: UnderlineInputBorder(),
// //                 //                     hintText: 'Describtion',
// //                 //                     labelText: 'Describtion',
// //                 //                     hintStyle: const TextStyle(color: Colors.black
// //                 //                     )),
// //                 //                 //obscureText: true,
// //                 //                 onChanged: (value){
// //                 //                   Describtion=value;
// //                 //                 },
// //                 //                 validator: (value) {
// //                 //                   if(value!.isEmpty) {
// //                 //                     return 'Describtion';
// //                 //                   }
// //                 //                   return null;
// //                 //                 },
// //                 //                 onSaved: (value){
// //                 //                   Describtion = value!;
// //                 //                 },
// //                 //               ),
// //                 //             ),
// //                 //           ],
// //                 //         ),
// //                 //
// //                 //         ElevatedButton(onPressed: (){
// //                 //           // if(formController.currentState!.validate()){
// //                 //           //   formController.currentState!.save();
// //                 //             addFile();
// //                 //             //print('Name: $FileName, Describtion $Describtion');
// //                 //
// //                 //             // addFile();
// //                 //           },
// //                 //           //Navigator.push(context, MaterialPageRoute(builder: (context)=> const DirectoryPage()));
// //                 //             style: ElevatedButton.styleFrom(
// //                 //                 backgroundColor: const Color.fromRGBO(220, 205, 168, 1),
// //                 //                 fixedSize: const Size(300, 50),
// //                 //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
// //                 //             child: const Text('Submit')
// //                 //         ),
// //                 //
// //                 //         SizedBox(height: 100,)
// //                 //       ],
// //                 //     ),
// //                 // ),
// //
// //                 Form(
// //                   key: formKey,
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.stretch,
// //                     children: [
// //                       Text('Add Task'),
// //                       TextFormField(
// //                         controller: titleController,
// //                         validator: (currentText){
// //                           if(currentText==null||currentText.trim().isEmpty){
// //                             return 'please enter title';
// //                           }
// //                           return null;
// //                         },
// //                         decoration: InputDecoration(
// //                           labelText: 'Title',
// //                         ),
// //                       ),
// //                       TextFormField(
// //                         controller: descController,
// //                         validator: (text){
// //                           if(text==null||text.isEmpty){
// //                             return 'please enter details';
// //                           }
// //                           return null;
// //                         },
// //                         minLines: 4,
// //                         maxLines: 4,
// //                         decoration: InputDecoration(
// //                           labelText: 'Details',
// //                         ),
// //                       ),
// //                       InkWell(
// //                         onTap: (){
// //                           showDatePickerDialog();
// //                         },
// //                         child: Container(
// //                             padding: EdgeInsets.all(12),
// //                             // how to format datetime in dart -> intl
// //                             //"yyyy/MM/dd"
// //                             child: Text('${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
// //                               style: Theme.of(context).textTheme.bodyMedium,
// //                             )),
// //                       ),
// //                       ElevatedButton(
// //                           style:ButtonStyle(
// //                               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
// //                                   RoundedRectangleBorder(
// //                                       borderRadius: BorderRadius.circular(12.0),
// //                                       side: BorderSide(color: Theme.of(context).primaryColor)
// //                                   )
// //                               )
// //                           ),
// //                           onPressed: (){
// //                             validateForm();
// //                           }, child:Text('Add',style: TextStyle(
// //                           fontSize: 18
// //                       ),) )
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         )
// //
// //       ],
// //     );
// //   }
// //   // void addFile(){
// //   //   if(formController.currentState?.validate() == true){
// //   //     Uploadfiledata task = Uploadfiledata(name:  FileName,
// //   //         describtion: Describtion);
// //   //     addFileToFireBase(task);
// //   //
// //   //   }
// //   // }
// //   void validateForm()async{
// //     // var provider = Provider.of<TasksProvider>(context,listen: false);
// //
// //     if(formKey.currentState?.validate()==true){
// //       // title, desc,date
// //       String title = titleController.text;
// //       String desc = descController.text;
// //       var newTask = Task(title: title,
// //           dateTime: selectedDate,
// //           content: desc,
// //           isDone: false);
// //
// //       showLoading(context,'Loading...',isCancelable: false);
// //       MyDataBase.addTask(newTask)
// //           .then((value) {
// //         //provider.retrieveTasks();
// //         hideLoading(context);
// //         showMessage(context, 'task added successfully',
// //             posActionName: 'ok',posActionCallBack: (){
// //               Navigator.pop(context);
// //             });
// //
// // //        Navigator.pop(context);
// //       }).onError((error, stackTrace) {
// //         hideLoading(context);
// //         showMessage(context, error.toString());
// //       }).timeout(Duration(seconds: 3),onTimeout:() {
// //         hideLoading(context);
// //         //provider.retrieveTasks();
// //         showMessage(context, 'Error connecting to server,'
// //             'please try again',posActionName: 'ok');
// //       },).timeout(Duration(seconds: 5,),onTimeout: (){
// //         hideLoading(context);
// //         showMessage(context, 'task added locally',
// //             posActionName:'ok');
// //       });
// //     }
// //   }
// //   var titleController = TextEditingController();
// //   var descController = TextEditingController();
// //   DateTime selectedDate = DateTime.now();
// //   void showDatePickerDialog()async{
// //     DateTime? dateTime = await showDatePicker(context: context,
// //         initialDate: selectedDate,
// //         firstDate: DateTime.now(),
// //         lastDate: DateTime.now().add(Duration(days: 365)));
// //     if(dateTime!=null){
// //       selectedDate = dateTime;
// //       setState(() {});
// //     }
// //   }
// // }
// // // import 'package:c5_online_todo/firebase_utils.dart';
// // // import 'package:c5_online_todo/model/task.dart';
// // // import 'package:c5_online_todo/ui/ui_utils.dart';
// // import 'package:flutter/material.dart';
// // import 'package:untitled2/showloading.dart';
// // import 'package:untitled2/task.dart';
// //
// // import 'addtasktofirestore.dart';
// //
// // class AddTaskBottomSheet extends StatefulWidget {
// //   static const String routename = 'U';
// //   @override
// //   State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
// // }
// //
// // class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
// //   GlobalKey<FormState> formController = GlobalKey<FormState>();
// //
// //   String title='';
// //   String description = '';
// //   DateTime selectedDate = DateTime.now();
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body:
// //      Container(
// //         decoration: BoxDecoration(
// //             color: Colors.white,
// //             borderRadius: BorderRadius.only(topLeft:Radius.circular(12)
// //                 ,topRight: Radius.circular(12))
// //         ),
// //         padding: EdgeInsets.all(12),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             Text("Add Task",
// //               textAlign: TextAlign.center,
// //               style: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.black),),
// //             Form(
// //                 key: formController,
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.stretch,
// //                   children: [
// //                     TextFormField(controller: titleController,
// //                       decoration: InputDecoration(
// //                           labelText: 'Title'
// //                       ),
// //                       onChanged: (text){
// //                         title=text;
// //                       },
// //                       validator: (text){
// //                         if(text==null||text.isEmpty){
// //                           return 'please enter title';
// //                         }
// //                         return null;
// //                       },
// //                     ),
// //                     TextFormField(
// //                       minLines: 4,
// //                       maxLines: 4,
// //                       controller: descController,
// //                       decoration: InputDecoration(
// //                         labelText: 'description',
// //                       ),
// //                       onChanged: (text){
// //                         description =text;
// //                       },
// //                       validator: (text){
// //                         if(text==null||text.isEmpty){
// //                           return 'please enter task description';
// //                         }
// //                         return null;
// //                       },
// //                     ),
// //                     SizedBox(height: 12,),
// //                     Text('Task Date'),
// //                     SizedBox(height: 8,),
// //                     InkWell(
// //                         onTap: (){
// //                           chooseDate();
// //                         },
// //                         child: Text(
// //                           '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',textAlign: TextAlign.center,)),
// //                     SizedBox(height: 12,),
// //                   ],)),
// //             ElevatedButton(onPressed: (){
// //               addTask();
// //             }, child: Text('Add Task'))
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // // how to format date time
// //   void chooseDate()async{
// //     var chosenDate = await showDatePicker(context: context,
// //         initialDate: selectedDate,
// //         firstDate: DateTime.now(),
// //         lastDate: DateTime.now().add(Duration(days: 365)));
// //
// //     if(chosenDate!=null){
// //       selectedDate = chosenDate;
// //       setState(() {
// //       });
// //     }
// //   }
// //
// //   void addTask(){
// //     if(formController.currentState?.validate() == true){
// //       // insert task
// //       // title,desc
// //       String title = titleController.text;
// //       String desc = descController.text;
// //       Task task = Task(title: title,
// //           description: description,
// //           date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
// //       showLoading(context, 'loading...',isCancelable: false);
// //       addTaskToFirestore(task)
// //           .then((value){
// //         hideDialog(context);
// //         showMessage(context, 'Task was added successfully', 'ok', (){
// //           Navigator.pop(context);
// //           Navigator.pop(context);
// //         },isCancelable: false);
// //
// //       }).catchError((onError){
// //         hideDialog(context);
// //         showMessage(context, 'some thing went wrong. try again later', 'ok', (){
// //           Navigator.pop(context);
// //         });
// //       });
// //     }
// //   }
// //   var titleController = TextEditingController();
// //   var descController = TextEditingController();
// // }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
// //
// // import 'package:flutter/material.dart';
// // import 'package:untitled2/attributes.dart';
// // import 'package:untitled2/editfileDB.dart';
// // // import 'package:provider/provider.dart';
// // // import 'package:todo_c6_sat/dialoge_utils.dart';
// // // import 'package:todo_c6_sat/my_database.dart';
// // // import 'package:todo_c6_sat/provider/tasks_provider.dart';
// // // import 'package:todo_c6_sat/task.dart';
// // //import 'package:untitled2/showloading.dart';
// // //import 'package:untitled2/task.dart';
// //
// // //import 'addtasktofirestore.dart';
// // import 'loading.dart';
// //
// // class AddTaskBottomSheet extends StatefulWidget {
// //   static String routename='aa';
// //
// //   @override
// //   State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
// // }
// //
// // class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
// //   var formKey = GlobalKey<FormState>();
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(body:
// //     SingleChildScrollView(
// //       child: Container(
// //         padding: EdgeInsets.all(24),
// //         child:
// //         Form(
// //           key: formKey,
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.stretch,
// //             children: [
// //               Text('Add Task'),
// //               TextFormField(
// //                 controller: titleController,
// //                 validator: (currentText){
// //                   if(currentText==null||currentText.trim().isEmpty){
// //                     return 'please enter title';
// //                   }
// //                   return null;
// //                 },
// //                 decoration: InputDecoration(
// //                   labelText: 'Title',
// //                 ),
// //               ),
// //               TextFormField(
// //                 controller: descController,
// //                 validator: (text){
// //                   if(text==null||text.isEmpty){
// //                     return 'please enter details';
// //                   }
// //                   return null;
// //                 },
// //                 minLines: 4,
// //                 maxLines: 4,
// //                 decoration: InputDecoration(
// //                   labelText: 'Details',
// //                 ),
// //               ),
// //               InkWell(
// //                 onTap: (){
// //                   showDatePickerDialog();
// //                 },
// //                 child: Container(
// //                     padding: EdgeInsets.all(12),
// //                     // how to format datetime in dart -> intl
// //                     //"yyyy/MM/dd"
// //                     child: Text('${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
// //                       style: Theme.of(context).textTheme.bodyMedium,
// //                     )),
// //               ),
// //               ElevatedButton(
// //                   style:ButtonStyle(
// //                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
// //                           RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(12.0),
// //                               side: BorderSide(color: Theme.of(context).primaryColor)
// //                           )
// //                       )
// //                   ),
// //                   onPressed: (){
// //                     validateForm();
// //                   }, child:Text('Add',style: TextStyle(
// //                   fontSize: 18
// //               ),) )
// //             ],
// //           ),
// //         ),
// //       ),
// //     ),
// //     );
// //   }
// //   void validateForm()async{
// //     // var provider = Provider.of<TasksProvider>(context,listen: false);
// //
// //     if(formKey.currentState?.validate()==true){
// //       // title, desc,date
// //       String title = titleController.text;
// //       String desc = descController.text;
// //       var newTask = Task(title: title,
// //           dateTime: selectedDate,
// //           content: desc,
// //           isDone: false);
// //
// //       showLoading(context,'Loading...',isCancelable: false);
// //       MyDataBase.addTask(newTask)
// //           .then((value) {
// //         //provider.retrieveTasks();
// //         hideLoading(context);
// //         showMessage(context, 'task added successfully',
// //             posActionName: 'ok',posActionCallBack: (){
// //               Navigator.pop(context);
// //             });
// //
// // //        Navigator.pop(context);
// //       }).onError((error, stackTrace) {
// //         hideLoading(context);
// //         showMessage(context, error.toString());
// //       }).timeout(Duration(seconds: 3),onTimeout:() {
// //         hideLoading(context);
// //         //provider.retrieveTasks();
// //         showMessage(context, 'Error connecting to server,'
// //             'please try again',posActionName: 'ok');
// //       },).timeout(Duration(seconds: 5,),onTimeout: (){
// //         hideLoading(context);
// //         showMessage(context, 'task added locally',
// //             posActionName:'ok');
// //       });
// //     }
// //   }
// //   var titleController = TextEditingController();
// //   var descController = TextEditingController();
// //   DateTime selectedDate = DateTime.now();
// //   void showDatePickerDialog()async{
// //     DateTime? dateTime = await showDatePicker(context: context,
// //         initialDate: selectedDate,
// //         firstDate: DateTime.now(),
// //         lastDate: DateTime.now().add(Duration(days: 365)));
// //     if(dateTime!=null){
// //       selectedDate = dateTime;
// //       setState(() {});
// //     }
// //   }
// // }
//
//
// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ////****************************************Upload FileName and Describtion into dp in firecloud****************************************
//
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled2/storage_service.dart';
// import 'Departments.dart';
// import 'attributes.dart';
// import 'editfileDB.dart';
// import 'encrpt/decrept.dart';
// import 'loading.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'dart:io';
// import 'package:path/path.dart' as path;
//
// class UploadFile extends StatefulWidget {
//   static const String routename = 'UploadFile';
//
//   @override
//   State<UploadFile> createState() => _UploadFileState();
// }
//
// class _UploadFileState extends State<UploadFile> {
//   //List<String> items = ['Department 1', 'Departement 2', 'Department 3','Departement 4'];
//
//   // File? _file;
//   // String? _fileName;
//   // String? _fileDescription;
//
//   var formKey = GlobalKey<FormState>();
//
//   //const LoginPage({Key? key}) : super(key: key);
//
//
//   //String? selectedItem = 'Departement 1';
//
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     final Storage storage = Storage();
//
//     return Stack(
//       children: [
//         Image.asset('assets/images/bac.png',
//           width: double.infinity,
//           fit: BoxFit.fill,),
//
//         Scaffold(
//           resizeToAvoidBottomInset: false,
//           backgroundColor: Colors.transparent,
//
//           body: SingleChildScrollView(
//             child: Column(mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [Padding(padding: EdgeInsets.symmetric(vertical: 25)),
//
//                 Row(
//                   children: [Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
//                     FloatingActionButton(onPressed: (){
//                       Navigator.pop(context, MaterialPageRoute(builder: (context)=> Departments()));
//
//                     },
//                       child: Icon(Icons.arrow_back, color: Colors.black54,size: 35),
//                       backgroundColor: Colors.white,)
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Opacity(
//                   opacity: 0.5,
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Card(
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                           color: Color.fromRGBO(220,205, 151, 1),
//                           child:
//                           InkWell(
//                             onTap: () async{
//                             final result = await FilePicker.platform.pickFiles(
//                               allowMultiple: false,
//                               type: FileType.custom,
//                               allowedExtensions: ['png','jpg','pdf'],
//                             );
//                             if(result == null){
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content: Text('No file Selected')
//                                 ),
//                               );
//                               return null;
//                             }
//                             final path = result.files.single.path!;
//                             var fileName = result.files.single.name;
//                             // FileEncrpt.encryptFile(path);
//                             // FileEncrpt.encryptFile(fileName);
//
//
//
//
//                             storage.uploadFile(path,fileName )
//                                 .then((value) => print('Done'));
//
//
//
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                   content: Text('File Uploaded Successfully')
//                               ),
//                             );
//
//
//                             // print(path);
//                             // print(fileName);
//                             //validateForm();
//                             //Navigator.push(context, MaterialPageRoute(builder: (context)=> Departments()));
//                           },
//                             child: Container(
//                               child:
//                               Column( mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.cloud_upload_outlined, size: 100, color: Colors.black),
//                                   Text('Upload', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
//                                 ],
//                               ),
//                               width: 341,
//                               height: 341,
//
//                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
//                               ),
//
//                             ),
//
//                           ),
//
//                         )
//                       ],
//                     ),
//
//                   ),
//                 ),
//
//                 // Center(
//                 //   child: DropdownButton<String>(
//                 //     value: selectedItem,
//                 //     items : items
//                 //         .map((item) => DropdownMenuItem<String>(
//                 //       value: item,
//                 //       child: Text(item, style: TextStyle(fontSize: 24)),
//                 //     ))
//                 //         .toList(),
//                 //     onChanged: (item) => setState(() => selectedItem = item),
//                 //
//                 //   ),
//                 // ),
//
//                 // SizedBox(
//                 //   height: 20,
//                 // ),
//                 // DropDownButton(),
//
//                 // SizedBox(
//                 //   width: 312,
//                 //   child: Column(mainAxisAlignment: MainAxisAlignment.center,
//                 //     crossAxisAlignment: CrossAxisAlignment.center,
//                 //     children: [
//                 //       // Form(
//                 //       //     key: _formKey,
//                 //       //     child:
//                 //       //     Column(
//                 //       //       children: [
//                 //       //         Row( mainAxisAlignment: MainAxisAlignment.center,
//                 //       //           children: [
//                 //       //             SizedBox(
//                 //       //               height: 50,
//                 //       //               width: 300,
//                 //       //               child: TextFormField(
//                 //       //                 decoration: InputDecoration( filled: true, fillColor: Colors.white,
//                 //       //                     border: OutlineInputBorder(
//                 //       //                       borderRadius: BorderRadius.circular(18),
//                 //       //                       borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//                 //       //                     ),
//                 //       //                     hintText: 'Email',
//                 //       //                     hintStyle: TextStyle(color: Colors.black,)),
//                 //       //                 keyboardType: TextInputType.emailAddress,
//                 //       //                 validator: (value) {
//                 //       //                   if(value!.isEmpty) {
//                 //       //                     return 'Enter email';
//                 //       //                   }
//                 //       //                   if(!value.contains('@')){
//                 //       //                     return 'Please enter a valid email address';
//                 //       //                   }
//                 //       //                   return null;
//                 //       //                 },
//                 //       //                 onSaved: (value){
//                 //       //                   _email = value!;
//                 //       //                 },
//                 //       //               ),
//                 //       //             ),
//                 //       //           ],
//                 //       //         ),
//                 //       //
//                 //       //         SizedBox(height: 20),
//                 //       //
//                 //       //         Row( mainAxisAlignment: MainAxisAlignment.center,
//                 //       //           children: [
//                 //       //             SizedBox(
//                 //       //               height: 50,
//                 //       //               width: 300,
//                 //       //               child: TextFormField(
//                 //       //                 decoration: InputDecoration( filled: true, fillColor: Colors.white,
//                 //       //                     border: OutlineInputBorder(
//                 //       //                       borderRadius: BorderRadius.circular(18),
//                 //       //                       borderSide: BorderSide(width: 0, style: BorderStyle.none),
//                 //       //                     ),
//                 //       //                     hintText: 'Password',
//                 //       //                     hintStyle: TextStyle(color: Colors.black
//                 //       //                     )),
//                 //       //                 obscureText: true,
//                 //       //                 validator: (value) {
//                 //       //                   if(value!.isEmpty) {
//                 //       //                     return 'Enter password';
//                 //       //                   }
//                 //       //                   if(value.length < 6){
//                 //       //                     return 'Please enter a  password';
//                 //       //                   }
//                 //       //                   return null;
//                 //       //                 },
//                 //       //                 onSaved: (value){
//                 //       //                   _password = value!;
//                 //       //                 },
//                 //       //               ),
//                 //       //             ),
//                 //       //           ],
//                 //       //         ),
//                 //       //         TextButton(onPressed: (){}, child: Text('Forget your password?',
//                 //       //           style: TextStyle(color: Colors.black26),)),
//                 //       //         ElevatedButton(onPressed: (){
//                 //       //           if(_formKey.currentState!.validate()){
//                 //       //             _formKey.currentState!.save();
//                 //       //             print('Email: $_email, Password $_password');}
//                 //       //          // Navigator.push(context, MaterialPageRoute(builder: (context)=> DirectoryPage()));
//                 //       //         },
//                 //       //             style: ElevatedButton.styleFrom(
//                 //       //                 primary: Color.fromRGBO(220, 205, 168, 1),
//                 //       //                 fixedSize: Size(300, 50),
//                 //       //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
//                 //       //             child: Text('Login')
//                 //       //         ),
//                 //       //       ],
//                 //       //     )
//                 //       // ),
//                 //       // TextField(
//                 //       //   decoration:
//                 //       //   InputDecoration(
//                 //       //     border: UnderlineInputBorder(),
//                 //       //     labelText: 'Name',
//                 //       //   ),
//                 //       // ),
//                 //       //
//                 //       // TextField(
//                 //       //   decoration:
//                 //       //   InputDecoration(
//                 //       //     border: UnderlineInputBorder(),
//                 //       //     labelText: 'Describtion',
//                 //       //   ),
//                 //       // ),
//                 //       // Form(
//                 //       //   key: formKey,
//                 //       //   child: Column(
//                 //       //     crossAxisAlignment: CrossAxisAlignment.stretch,
//                 //       //     children: [
//                 //       //       TextFormField(
//                 //       //         // onChanged: (value) {
//                 //       //         //   setState(() {
//                 //       //         //     _fileName = value;
//                 //       //         //   });
//                 //       //         // },
//                 //       //         controller: titleController,
//                 //       //         validator: (currentText){
//                 //       //           if(currentText==null||currentText.trim().isEmpty){
//                 //       //             return 'please enter title';
//                 //       //           }
//                 //       //           return null;
//                 //       //         },
//                 //       //         decoration: InputDecoration(
//                 //       //           border: UnderlineInputBorder(),
//                 //       //           labelText: 'Name',
//                 //       //         ),
//                 //       //       ),
//                 //       //       TextFormField(
//                 //       //         // onChanged: (value) {
//                 //       //         //   setState(() {
//                 //       //         //     _fileDescription = value;
//                 //       //         //   });
//                 //       //         // },
//                 //       //         controller: descController,
//                 //       //         validator: (text){
//                 //       //           if(text==null||text.isEmpty){
//                 //       //             return 'please enter details';
//                 //       //           }
//                 //       //           return null;
//                 //       //         },
//                 //       //         minLines: 2,
//                 //       //         maxLines: 2,
//                 //       //         decoration: InputDecoration(
//                 //       //           border: UnderlineInputBorder(),
//                 //       //           labelText: 'Description',
//                 //       //         ),
//                 //       //       ),
//                 //       //       // InkWell(
//                 //       //       //   onTap: (){
//                 //       //       //     showDatePickerDialog();
//                 //       //       //   },
//                 //       //       //   child: Container(
//                 //       //       //       padding: EdgeInsets.all(12),
//                 //       //       //       // how to format datetime in dart -> intl
//                 //       //       //       //"yyyy/MM/dd"
//                 //       //       //       child: Text('${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
//                 //       //       //         style: Theme.of(context).textTheme.bodyMedium,
//                 //       //       //       )),
//                 //       //       // ),
//                 //       //       // ElevatedButton(   //// *****************************************pickfile from Mobile************************************
//                 //       //       //   style:ElevatedButton.styleFrom(fixedSize: Size(200,50),
//                 //       //       //       primary: Color.fromRGBO(220, 205, 168, 1),
//                 //       //       //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18),
//                 //       //       //       )),
//                 //       //       //   onPressed: () async{
//                 //       //       //     final result = await FilePicker.platform.pickFiles(
//                 //       //       //       allowMultiple: false,
//                 //       //       //       type: FileType.custom,
//                 //       //       //       allowedExtensions: ['png','jpg',],
//                 //       //       //     );
//                 //       //       //     if(result == null){
//                 //       //       //       ScaffoldMessenger.of(context).showSnackBar(
//                 //       //       //         const SnackBar(
//                 //       //       //             content: Text('No file Selected')
//                 //       //       //         ),
//                 //       //       //       );
//                 //       //       //       return null;
//                 //       //       //     }
//                 //       //       //     final path = result.files.single.path!;
//                 //       //       //     final fileName = result.files.single.name;
//                 //       //       //
//                 //       //       //     storage
//                 //       //       //         .uploadFile(path, fileName)
//                 //       //       //         .then((value) => print('Done'));
//                 //       //       //
//                 //       //       //
//                 //       //       //     // print(path);
//                 //       //       //     // print(fileName);
//                 //       //       //     //validateForm();
//                 //       //       //     //Navigator.push(context, MaterialPageRoute(builder: (context)=> Departments()));
//                 //       //       //   },
//                 //       //       //   child:Text('Upload File',style: TextStyle(
//                 //       //       //     fontSize: 18),),
//                 //       //       // ),
//                 //       //       // SizedBox(height: 50,),
//                 //       //
//                 //       //       // ElevatedButton(
//                 //       //       //   style:ElevatedButton.styleFrom(fixedSize: Size(200,50),
//                 //       //       //       primary: Color.fromRGBO(220, 205, 168, 1),
//                 //       //       //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18),
//                 //       //       //       )),
//                 //       //       //   onPressed: () {
//                 //       //       //
//                 //       //       //     validateForm();
//                 //       //       //     //Navigator.push(context, MaterialPageRoute(builder: (context)=> Departments()));
//                 //       //       //   },
//                 //       //       //   child:Text('Submit',style: TextStyle(
//                 //       //       //       fontSize: 18
//                 //       //       //   ),
//                 //       //       //   ),
//                 //       //       // )
//                 //       //
//                 //       //     ],
//                 //       //   ),
//                 //       // ),
//                 //
//                 //
//                 //     ],
//                 //   ),
//                 // ),
//
//
//                 // SizedBox(
//                 //   height: 20,
//                 // ),
//
//                 // FutureBuilder(
//                 //     future: storage.listFiles(),
//                 //     builder: (BuildContext context,
//                 //         AsyncSnapshot<firebase_storage.ListResult> snapshot) {
//                 //       if(snapshot.connectionState == ConnectionState.done &&
//                 //           snapshot.hasData){
//                 //         return Container(
//                 //           padding: EdgeInsets.symmetric(horizontal: 20),
//                 //           height: 50,
//                 //           child: ListView.builder(
//                 //             scrollDirection: Axis.horizontal,
//                 //             shrinkWrap: true,
//                 //             itemCount: snapshot.data!.items.length,
//                 //               itemBuilder: (BuildContext context, int index){
//                 //                return Padding(
//                 //                  padding: const EdgeInsets.all(8.0),
//                 //                  child: ElevatedButton(
//                 //                     onPressed: () {},
//                 //                     child: Text(snapshot.data!.items[index].name),
//                 //               ),
//                 //                );
//                 //               }),
//                 //         );
//                 //       }
//                 //       if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
//                 //         return CircularProgressIndicator();
//                 //       }
//                 //       return Container();
//                 //     }),
//
//
//
// ////////////////////////////////////////////////////////////***************************************File Upload with URLLL**************************************
//                 // FutureBuilder(
//                 //     future: storage.downloadURl('اسعار.pdf'),
//                 //     builder: (BuildContext context,
//                 //         AsyncSnapshot<String> snapshot) {
//                 //       if(snapshot.connectionState == ConnectionState.done &&
//                 //           snapshot.hasData){
//                 //         return Container(
//                 //           width: 300,
//                 //           height: 250,
//                 //           child: Image.network(
//                 //             snapshot.data!,
//                 //             fit: BoxFit.cover),
//                 //         );
//                 //
//                 //       }
//                 //       if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
//                 //         return CircularProgressIndicator();
//                 //       }
//                 //       return Container();
//                 //     }),
//
//
//               ],
//
//             ),
//
//           ),
//         ),
//
//       ],
//
//     );
//
//   }
//   void validateForm()async{
//     // var provider = Provider.of<TasksProvider>(context,listen: false);
//
//     if(formKey.currentState?.validate()==true){
//       // title, desc,date
//       String title = titleController.text;
//       String desc = descController.text;
//       var newTask = Tasks(title: title,
//           // dateTime: selectedDate,
//           content: desc,
//           //isDone: false
//           );
//
//       showLoading(context,'Loading...',isCancelable: false);
//       MyDataBase.addTask(newTask)
//           .then((value) {
//         //provider.retrieveTasks();
//         hideLoading(context);
//         showMessage(context, 'task added successfully',
//             posActionName: 'ok',posActionCallBack: (){
//               Navigator.pop(context);
//             });
//
//        // Navigator.pop(context);
//       }).onError((error, stackTrace) {
//         hideLoading(context);
//         showMessage(context, error.toString());
//       }).timeout(Duration(seconds: 3),onTimeout:() {
//         hideLoading(context);
//         //provider.retrieveTasks();
//         showMessage(context, 'Error connecting to server,'
//             'please try again',posActionName: 'ok');
//       },).timeout(Duration(seconds: 5,),onTimeout: (){
//         hideLoading(context);
//         showMessage(context, 'task added locally',
//             posActionName:'ok');
//       });
//     }
//   }
//   var titleController = TextEditingController();
//   var descController = TextEditingController();
//
//   /////////
//
//
//
//   // DateTime selectedDate = DateTime.now();
//   // void showDatePickerDialog()async{
//   //   DateTime? dateTime = await showDatePicker(context: context,
//   //       initialDate: selectedDate,
//   //       firstDate: DateTime.now(),
//   //       lastDate: DateTime.now().add(Duration(days: 365)));
//   //   if(dateTime!=null){
//   //     selectedDate = dateTime;
//   //     setState(() {});
//   //   }
//   // }
// }



/////////////////////////////////



/////////////////////////////////////////*************************
// import 'dart:io';
// import 'package:encrypt/encrypt.dart' as encrypt;
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
//
// class UploadFile extends StatefulWidget {
//   static String routename ='m';
//   const UploadFile({Key? key}) : super(key: key);
//
//   @override
//   _UploadFileState createState() => _UploadFileState();
// }
//
// class _UploadFileState extends State<UploadFile> {
//   Future<void> _uploadFile(String filePath, String fileName) async {
//     try {
//       await _uploadEncryptedFileToFirebaseStorageAndFirestore(filePath, fileName);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('File uploaded successfully'),
//         ),
//       );
//     } on Exception catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error uploading file: $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
//
//   Future<void> _uploadEncryptedFileToFirebaseStorageAndFirestore(
//       String filePath,
//       String fileName,
//       ) async {
//     // Read the contents of the file
//     final bytes = await File(filePath).readAsBytes();
//
//     // Generate a secret key and initialization vector (IV)
//     final key = encrypt.Key.fromLength(32);
//     final iv = encrypt.IV.fromLength(16);
//
//     // Encrypt the contents of the file using the secret key and IV
//     final encrypter = encrypt.Encrypter(encrypt.AES(key));
//     final encrypted = encrypter.encryptBytes(bytes, iv: iv);
//
//     // Upload the encrypted file to Firebase Storage
//     final storageRef = firebase_storage.FirebaseStorage.instance.ref('test/$fileName');
//     final uploadTask = storageRef.putData(encrypted.bytes);
//     final snapshot = await uploadTask.whenComplete(() => null);
//
//     // Get the download URL of the uploaded file
//     final downloadUrl = await snapshot.ref.getDownloadURL();
//
//     // Store the download URL in a document in Firestore
//     // firestore.FirebaseFirestore.instance
//     //     .collection('test')
//     //     .add({'url': downloadUrl});
//     firebase_storage.FirebaseStorage.instance.ref('test');
//
//     // Delete the encrypted file
//     await File(filePath).delete();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Upload File'),
//       ),
//       body: Center(
//         child: InkWell(
//           onTap: () async {
//             // Show the file picker dialog
//             final result = await FilePicker.platform.pickFiles(
//               allowMultiple: false,
//               type: FileType.custom,
//               allowedExtensions: ['png', 'jpg', 'pdf'],
//             );
//
//             // If no file is selected, show a snackbar and return
//             if (result == null) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text('No file selected'),
//                 ),
//               );
//               return null;
//             }
//
//             // Extract the file path and name from the result object
//             final path = result.files.single.path!;
//             var fileName = result.files.single.name;
//
//             // Call the _uploadFile function with the file path and name
//             await _uploadFile(path, fileName);
//           },
//           child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Icon(Icons.cloud_upload_outlined, size: 100, color: Colors.black),
//                 Text(
//                   'Upload',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//             width: 341,
//             height: 341,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//////////////////////////////////////////*****************************


// import 'dart:io';
// import 'package:encrypt/encrypt.dart' as encrypt;
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:http/http.dart' as http;
//
// class UploadFile extends StatefulWidget {
//   static String routename = 'm';
//   const UploadFile({Key? key}) : super(key: key);
//
//   @override
//   _UploadFileState createState() => _UploadFileState();
// }
//
// class _UploadFileState extends State<UploadFile> {
//   String? _downloadUrl;
//   String? _fileName;
//   encrypt.Key? _key;
//   encrypt.IV? _iv;
//
//   Future<void> _uploadFile(String filePath, String fileName) async {
//     try {
//       final result = await _uploadEncryptedFileToFirebaseStorageAndFirestore(filePath, fileName);
//       setState(() {
//         _downloadUrl = result['url'];
//         _fileName = fileName;
//         _key = result['key'];
//         _iv = result['iv'];
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('File uploaded successfully'),
//         ),
//       );
//     } on Exception catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error uploading file: $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
//
//   Future<Map<String, dynamic>> _uploadEncryptedFileToFirebaseStorageAndFirestore(
//       String filePath,
//       String fileName,
//       ) async {
//     // Read the contents of the file
//     final bytes = await File(filePath).readAsBytes();
//
//     // Generate a secret key and initialization vector (IV)
//     final key = encrypt.Key.fromLength(32);
//     final iv = encrypt.IV.fromLength(16);
//
//     // Encrypt the contents of the file using the secret key and IV
//     final encrypter = encrypt.Encrypter(encrypt.AES(key));
//     final encrypted = encrypter.encryptBytes(bytes, iv: iv);
//
//     // Upload the encrypted file to Firebase Storage
//     final storageRef = firebase_storage.FirebaseStorage.instance.ref('test/$fileName');
//     final uploadTask = storageRef.putData(encrypted.bytes);
//     final snapshot = await uploadTask.whenComplete(() => null);
//
//     // Get the download URL of the uploaded file
//     final downloadUrl = await snapshot.ref.getDownloadURL();
//
//     // Store the download URL and key/IV in a document in Firestore
//     final docRef = await firestore.FirebaseFirestore.instance
//         .collection('test')
//         .add({'url': downloadUrl, 'key': key.base64, 'iv': iv.base64});
//
//     // Delete the encrypted file
//     await File(filePath).delete();
//
//     // Return the key, IV, and download URL
//     return {'key': key, 'iv': iv, 'url': downloadUrl};
//   }
//
//   Future<void> _decryptFile() async {
//     try {
//       // Download the encrypted file from Firebase Storage
//       final http.Response response = await http.get(Uri.parse(_downloadUrl!));
//       final encryptedBytes = response.bodyBytes;
//
//       // Decrypt the contents of the file using the key and IV
//       final encrypter = encrypt.Encrypter(encrypt.AES(_key!));
//       final decrypted = encrypter.decryptBytes(encrypt.Encrypted(encryptedBytes), iv: _iv!);
//
//       // Write the decrypted contents to a new file
//       final directory = await getApplicationDocumentsDirectory();
//       final filePath = '${directory.path}/$_fileName';
//       await File(filePath).writeAsBytes(decrypted);
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('File decrypted successfully'),
//         ),
//       );
//
//       // Open the decrypted file
//       await OpenFile.open(filePath);
//     } on Exception catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error decrypting file: $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Upload File'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             InkWell(
//               onTap: () async {
//                 // Show the file picker dialog
//                 final result = await FilePicker.platform.pickFiles(
//                   allowMultiple: false,
//                   type: FileType.custom,
//                   allowedExtensions: ['png', 'jpg', 'pdf'],
//                 );
//
//                 // If no file is selected, show a snackbar and return
//                 if (result == null) {
//                   ScaffoldMessenger.of(context).
//                 showSnackBar(
//                   SnackBar(
//                 content: Text('No file selected'),
//                 ),
//                 );
//                 return null;
//                 }
//
//
//
//
//
//                 // Extract the file path and name from the result object
//                 final path = result.files.single.path!;
//                 final fileName = result.files.single.name!;
//
//                 // Call the _uploadFile function with the file path and name
//                 await _uploadFile(path, fileName);
//               },
//               child: Container(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Icon(Icons.cloud_upload_outlined, size: 100, color: Colors.black),
//                     const Text(
//                       'Upload',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 width: 341,
//                 height: 341,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),
//             if (_downloadUrl != null && _key != null && _iv != null)
//               ElevatedButton(
//                 onPressed: _decryptFile,
//                 child: const Text('Decrypt File'),
//               ),
//
//
//           ],
//         ),
//       ),
//
//
//     );
//   }
// }class FileListPage extends StatefulWidget {
//   const FileListPage({Key? key}) : super(key: key);
//
//   @override
//   _FileListPageState createState() => _FileListPageState();
// }
//
// class _FileListPageState extends State<FileListPage> {
//   List<Map<String, dynamic>> _fileList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _getFileList();
//   }
//
//   Future<void> _getFileList() async {
//     final snapshot = await firestore.FirebaseFirestore.instance.collection('test').get();
//     final files = snapshot.docs.map((doc) => doc.data()).toList();
//     setState(() {
//       _fileList = files;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('File List'),
//       ),
//       body: ListView.builder(
//         itemCount: _fileList.length,
//         itemBuilder: (context, index) {
//           final file = _fileList[index];
//           return ListTile(
//             title: Text(file['fileName']),
//             subtitle: Text(file['createdAt'].toString()),
//             trailing: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => DecryptPage(file['url'], file['key'], file['iv'], file['fileName']),
//                   ),
//                 );
//               },
//               child: const Text('Decrypt'),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class DecryptPage extends StatefulWidget {
//   final String url;
//   final String _key;
//   final String iv;
//   final String fileName;
//
//   const DecryptPage(this.url, this._key, this.iv, this.fileName, {Key? key}) : super(key: key);
//
//   @override
//   _DecryptPageState createState() => _DecryptPageState();
// }
//
// class _DecryptPageState extends State<DecryptPage> {
//   bool _isDecrypting = false;
//
//   Future<void> _decryptFile() async {
//     try {
//       setState(() {
//         _isDecrypting = true;
//       });
//
//       // Download the encrypted file from Firebase Storage
//       final http.Response response = await http.get(Uri.parse(widget.url));
//       final encryptedBytes = response.bodyBytes;
//
//       // Decrypt the contents of the file using the key and IV
//       final encrypter = encrypt.Encrypter(encrypt.AES(encrypt.Key.fromBase64(widget._key)));
//       final decrypted = encrypter.decryptBytes(encrypt.Encrypted(encryptedBytes), iv: encrypt.IV.fromBase64(widget.iv));
//
//       // Write the decrypted contents to a new file
//       final directory = await getApplicationDocumentsDirectory();
//       final filePath = '${directory.path}/${widget.fileName}';
//       await File(filePath).writeAsBytes(decrypted);
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('File decrypted successfully'),
//         ),
//       );
//
//       // Open the decrypted file
//       await OpenFile.open(filePath);
//     } on Exception catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error decrypting file: $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } finally {
//       setState(() {
//         _isDecrypting = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Decrypt File'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_isDecrypting)
//               const CircularProgressIndicator()
//             else
//               ElevatedButton(
//                 onPressed: _decryptFile,
//                 child: const Text('Decrypt File'),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }




/////////////////////////////==========================================


import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:aes_crypt_null_safe/aes_crypt_null_safe.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled2/backgrounds.dart';

import 'encrpt/other.dart';
import 'encrpt/test3.dart';

/*class EncryptionScreen extends StatefulWidget {
  const EncryptionScreen({Key? key}) : super(key: key);

  @override
  _IdentityPageState createState() => _IdentityPageState();
}

class _IdentityPageState extends State<EncryptionScreen> {
  String? _path;
  String? pat;
  String? encFilepath;
  String? filename;

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getExternalStorageDirectory();
    final newFile = File('${appStorage!.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  bool _validate = false;
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<File> saveFile(String file) async {
    Directory? appStorage = await getExternalStorageDirectory();
    var fileName = (file.split('/').last);
    final newfile = ('${appStorage!.path}/$fileName');

    return File(file).copy(newfile);
  }

  Future<File> saveFile1(String file) async {
    const appStorage = ('/storage/emulated/0/Download');
    var fileName = (file.split('/').last);
    final newfile = ('$appStorage/$fileName');

    return (File(file).copy(newfile));
  }

  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //requestStoragePermission();
    return Scaffold(
      backgroundColor: const Color(0xFF1D1D35),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 0),
              child: TextField(
                controller: _textController,
                // style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    errorText: _validate ? 'please enter password' : null,
                    hintText: 'Enter your pin or password',
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 4),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        )),
                    suffixIcon: IconButton(
                        onPressed: () {
                          _textController.clear();
                        },
                        icon: const Icon(Icons.clear))),
                obscureText: true,
                maxLength: 20,
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  PlatformFile? _platformFile;
                  final file = await FilePicker.platform.pickFiles();

                  if (file != null) {
                    //String? selectedDirectory =
                    // (await FilePicker.platform.getDirectoryPath());
                    _platformFile = file.files.first;

                    pat = _platformFile.name;
                    _path = _platformFile.path;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: const Color.fromARGB(255, 16, 240, 23),
                        content: Text(' File Selected\n File path:$_path')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Color.fromARGB(255, 224, 5, 5),
                        content: Text(' File not Selected.Abort')));
                    print("abort");
                  }
                },
                child: const Text('add file',
                    style: TextStyle(fontSize: 22, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffee122a),
                  shape: const StadiumBorder(),
                )),
            ElevatedButton(
                child: const Text('Encrypt',
                    style: TextStyle(fontSize: 22, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: const StadiumBorder(),
                ),
                onPressed: () async {
                  setState(() {
                    _textController.text.isEmpty
                        ? _validate = true
                        : _validate = false;
                  });
                  if (_path != null && _textController.text != null) {
                    print(_path);

                    // Creates an instance of AesCrypt class.
                    AesCrypt crypt = AesCrypt();

                    // Sets encryption password.
                    // Optionally you can specify the password when creating an instance
                    // of AesCrypt class like:
                    crypt.aesSetMode(AesMode.cbc);
                    crypt.setPassword(_textController.text);

                    // Sets overwrite mode.
                    // It's optional. By default the mode is 'AesCryptOwMode.warn'.
                    crypt.setOverwriteMode(AesCryptOwMode.rename);

                    try {
                      // Encrypts  file and save encrypted file to a file with
                      // '.aes' extension added. In this case it will be '$_path.aes'.
                      // It returns a path to encrypted file.

                      encFilepath = crypt.encryptFileSync(_path!);

                      print('The encryption has been completed successfully.');
                      print('Encrypted file: $encFilepath');
                      final newFile = await saveFile(encFilepath!);
                      //final newfile1 = await saveFile1(encFilepath!);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Color.fromARGB(255, 16, 240, 23),
                          content: Text(' File Encryption Success')));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Color.fromARGB(255, 16, 240, 23),
                          content: Text(' File Saved')));
                      print(newFile);
                      // print(newfile1);
                    } on AesCryptException catch (e) {
                      // It goes here if overwrite mode set as 'AesCryptFnMode.warn'
                      // and encrypted file already exists.
                      if (e.type == AesCryptExceptionType.destFileExists) {
                        print(
                            'The encryption has been completed unsuccessfully.');
                        print(e.message);
                      }
                    }
                  }
                  if (_path == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Please select file')));
                  }
                }),
          ],
        ),
      ),
    );
  }
}*/

class EncryptionPage extends StatefulWidget {
  const EncryptionPage({Key? key}) : super(key: key);
  static const String routeName ='e2';


  @override
  State<EncryptionPage> createState() => _EncryptionPageState();
}

class _EncryptionPageState extends State<EncryptionPage> {
  String? _path;
  String? pat;
  String? encFilepath;
  String? filename;
    //late String _uploadedFileUrl='';

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getExternalStorageDirectory();
    final newFile = File('${appStorage!.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  bool _validate = false;
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<File> saveFile(String file) async {
    Directory? appStorage = await getExternalStorageDirectory();
    var fileName = (file.split('/').last);
    final newfile = ('${appStorage!.path}/$fileName');

    return File(file).copy(newfile);
  }



  final _textController = TextEditingController();


  Widget _buildAddFileButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Opacity(
          opacity: 0.5,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: Color.fromRGBO(220,205, 151, 1),
                  child:
                  InkWell(
                    onTap: () async
                    {
                      PlatformFile? _platformFile;
                      final file = await FilePicker.platform.pickFiles();

                      if (file != null) {
                        _platformFile = file.files.first;

                        pat = _platformFile.name;
                        _path = _platformFile.path;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: const Color(0xff006aff),
                            content: Text(
                              ' File Selected\n File path:$_path',
                              textAlign: TextAlign.center,
                            )));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            backgroundColor: Color(0xffee122a),
                            content: Text(
                              ' File not Selected.Abort',
                              textAlign: TextAlign.center,
                            )));
                        print("abort");
                      }
                    },


                    child: Container(
                      child:
                      Column( mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.cloud_upload_outlined, size: 100, color: Colors.black),
                          Text('Upload', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
                        ],
                      ),
                      width: 300,
                      height: 300,

                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                      ),

                    ),

                  ),

                ),
              ],
            ),
          ),
        ),


      ],
    );
  }

  Widget _buildEncryptButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: const EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffDCCDA8),
              shape: const StadiumBorder(),
            ),
            onPressed: () async
            {
              FocusScope.of(context).unfocus();
              setState(() {
                _textController.text.isEmpty
                    ? _validate = true
                    : _validate = false;
              });
              if (_path != null && _textController.text != null) {
                print(_path);

                // Creates an instance of AesCrypt class.
                AesCrypt crypt = AesCrypt();

                // Sets encryption password.
                // Optionally you can specify the password when creating an instance
                // of AesCrypt class like:
                crypt.aesSetMode(AesMode.cbc);
                crypt.setPassword(_textController.text);

                // Sets overwrite mode.
                // It's optional. By default the mode is 'AesCryptOwMode.warn'.
                crypt.setOverwriteMode(AesCryptOwMode.rename);

                try {
                  // Encrypts  file and save encrypted file to a file with
                  // '.aes' extension added. In this case it will be '$_path.aes'.
                  // It returns a path to encrypted file.

                  encFilepath = crypt.encryptFileSync(_path!);

                  print('The encryption has been completed successfully.');
                  print('Encrypted file: $encFilepath');

                  final encryptedFile = await saveFile(encFilepath!);
                  final fileName = encryptedFile.path.split('/').last;
                  final fileBytes = await encryptedFile.readAsBytes();
                  final storageRef = FirebaseStorage.instance.ref('test/$fileName');
                  final uploadTask = storageRef.putData(fileBytes);

                  await uploadTask.whenComplete(()  =>{print('File upload success.  ')}


                  );


                  //final newfile1 = await saveFile1(encFilepath!);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Color(0xff006aff),
                      content: Text(
                        ' File Encryption Success',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Color(0xff006aff),
                      content: Text(
                        ' File Saved',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )));
                  // print(newFile);
                  // print(newfile1);
                } on AesCryptException catch (e) {
                  // It goes here if overwrite mode set as 'AesCryptFnMode.warn'
                  // and encrypted file already exists.
                  if (e.type == AesCryptExceptionType.destFileExists) {
                    print('The encryption has been completed unsuccessfully.');
                    print(e.message);
                  }
                }
              }
              if (_path == null) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Color(0xffee122a),
                    content: Text(
                      'Please select file',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )));
              }
              setState(() {
                _textController.clear();
              });
            },
            child: Text(
              "Encrypt",
              style: TextStyle(color: Colors.white,fontSize: 17),

            ),
          ),
        )
      ],
    );
  }


  Widget _buildPasswordRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: TextField(
        controller: _textController,
        //textAlign: TextAlign.center,
        decoration: InputDecoration(
          errorText: _validate ? 'please enter password' : null,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffDCCDA8), width: 2.0),
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffDCCDA8), width: 1.5)),
          hintText: "Enter password",
        ),
        obscureText: true,
      ),
    );
  }

  Widget _buildContainer() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Container(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildAddFileButton(),
                _buildPasswordRow(),
                _buildEncryptButton()
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //return SafeArea(
    //child:
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Stack(
          children: [
            Background('assets/images/bac.png'),
            Scaffold(
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset: false,
              body: Stack(

                children: <Widget>[

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      _buildContainer(),

                    ],
                  )
                ],
              ),
            ),
          ],)

      // ),
    );
  }
}

