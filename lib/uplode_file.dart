// import 'package:flutter/material.dart';
// import 'package:untitled2/attributes.dart';
// import 'package:untitled2/classUploadFile.dart';
// import 'package:untitled2/editfileDB.dart';
// import 'package:untitled2/loading.dart';
// import 'Departments.dart';
// import 'drop_bottom.dart';
// import 'package:untitled2/firebase_utils.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
//
// class UploadFile extends StatefulWidget {
//   static const String routename = 'UploadFile';
//
//   const UploadFile({Key? key}) : super(key: key);
//
//   @override
//   State<UploadFile> createState() => _UploadFileState();
// }
//
// class _UploadFileState extends State<UploadFile> {
//   // GlobalKey<FormState> formController = GlobalKey<FormState>();
//   // //final _formKey = GlobalKey<FormState>();
//   var formKey = GlobalKey<FormState>();
//   List<String> items = ['Department 1', 'Departement 2', 'Department 3','Departement 4'];
//
// @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   FileName = '';
//   //   Describtion = '';
//   // }
//   // String FileName = '';
//   // String Describtion = '';
//
//
//   String? selectedItem = 'Departement 1';
//
//   @override
//   Widget build(BuildContext context) {
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
//             child: Column(
//               children: [const Padding(padding: EdgeInsets.symmetric(vertical: 25)),
//
//                 Row(
//                   children: [const Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
//                     FloatingActionButton(onPressed: (){
//                       Navigator.pop(context, MaterialPageRoute(builder: (context)=> const Departments()));
//
//                     },
//                       child: const Icon(Icons.arrow_back, color: Colors.black,size: 35),
//                       backgroundColor: Colors.white,)
//                   ],
//                 ),
//                 const SizedBox(
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
//                           child:
//                           InkWell(
//                             onTap: (){
//
//                             },
//                             child: Container(
//                               child:
//                               Column( mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: const [
//                                   Icon(Icons.cloud_upload_outlined, size: 100,),
//                                   Text('Upload')
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
//                 const SizedBox(
//                   height: 20,
//                 ),const DropDownButton(),
//
//                 SizedBox(
//                   width: 312,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children:
//                     [
//
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 20),
//                 // Form(
//                 //     key: formController,
//                 //     child:
//                 //     Column(
//                 //       children: [
//                 //         Row( mainAxisAlignment: MainAxisAlignment.center,
//                 //           children: [
//                 //             SizedBox(
//                 //               height: 50,
//                 //               width: 300,
//                 //               child: TextFormField(
//                 //                 decoration: InputDecoration(
//                 //                     border: UnderlineInputBorder(),
//                 //                     hintText: 'Name ',
//                 //                     hintStyle: const TextStyle(color: Colors.black,)),
//                 //                 //keyboardType: TextInputType.emailAddress,
//                 //                 validator: (value) {
//                 //                   if(value!.isEmpty) {
//                 //                     return 'Name';
//                 //                   }
//                 //                   return null;
//                 //                 },
//                 //                 onSaved: (value){
//                 //                   FileName = value!;
//                 //                 },
//                 //               ),
//                 //             ),
//                 //           ],
//                 //         ),
//                 //
//                 //         const SizedBox(height: 20),
//                 //
//                 //         Row( mainAxisAlignment: MainAxisAlignment.center,
//                 //           children: [
//                 //             SizedBox(
//                 //               height: 50,
//                 //               width: 300,
//                 //               child: TextFormField(
//                 //                 decoration: InputDecoration(
//                 //                     border: UnderlineInputBorder(),
//                 //                     hintText: 'Describtion',
//                 //                     labelText: 'Describtion',
//                 //                     hintStyle: const TextStyle(color: Colors.black
//                 //                     )),
//                 //                 //obscureText: true,
//                 //                 onChanged: (value){
//                 //                   Describtion=value;
//                 //                 },
//                 //                 validator: (value) {
//                 //                   if(value!.isEmpty) {
//                 //                     return 'Describtion';
//                 //                   }
//                 //                   return null;
//                 //                 },
//                 //                 onSaved: (value){
//                 //                   Describtion = value!;
//                 //                 },
//                 //               ),
//                 //             ),
//                 //           ],
//                 //         ),
//                 //
//                 //         ElevatedButton(onPressed: (){
//                 //           // if(formController.currentState!.validate()){
//                 //           //   formController.currentState!.save();
//                 //             addFile();
//                 //             //print('Name: $FileName, Describtion $Describtion');
//                 //
//                 //             // addFile();
//                 //           },
//                 //           //Navigator.push(context, MaterialPageRoute(builder: (context)=> const DirectoryPage()));
//                 //             style: ElevatedButton.styleFrom(
//                 //                 backgroundColor: const Color.fromRGBO(220, 205, 168, 1),
//                 //                 fixedSize: const Size(300, 50),
//                 //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
//                 //             child: const Text('Submit')
//                 //         ),
//                 //
//                 //         SizedBox(height: 100,)
//                 //       ],
//                 //     ),
//                 // ),
//
//                 Form(
//                   key: formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Text('Add Task'),
//                       TextFormField(
//                         controller: titleController,
//                         validator: (currentText){
//                           if(currentText==null||currentText.trim().isEmpty){
//                             return 'please enter title';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           labelText: 'Title',
//                         ),
//                       ),
//                       TextFormField(
//                         controller: descController,
//                         validator: (text){
//                           if(text==null||text.isEmpty){
//                             return 'please enter details';
//                           }
//                           return null;
//                         },
//                         minLines: 4,
//                         maxLines: 4,
//                         decoration: InputDecoration(
//                           labelText: 'Details',
//                         ),
//                       ),
//                       InkWell(
//                         onTap: (){
//                           showDatePickerDialog();
//                         },
//                         child: Container(
//                             padding: EdgeInsets.all(12),
//                             // how to format datetime in dart -> intl
//                             //"yyyy/MM/dd"
//                             child: Text('${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
//                               style: Theme.of(context).textTheme.bodyMedium,
//                             )),
//                       ),
//                       ElevatedButton(
//                           style:ButtonStyle(
//                               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(12.0),
//                                       side: BorderSide(color: Theme.of(context).primaryColor)
//                                   )
//                               )
//                           ),
//                           onPressed: (){
//                             validateForm();
//                           }, child:Text('Add',style: TextStyle(
//                           fontSize: 18
//                       ),) )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//
//       ],
//     );
//   }
//   // void addFile(){
//   //   if(formController.currentState?.validate() == true){
//   //     Uploadfiledata task = Uploadfiledata(name:  FileName,
//   //         describtion: Describtion);
//   //     addFileToFireBase(task);
//   //
//   //   }
//   // }
//   void validateForm()async{
//     // var provider = Provider.of<TasksProvider>(context,listen: false);
//
//     if(formKey.currentState?.validate()==true){
//       // title, desc,date
//       String title = titleController.text;
//       String desc = descController.text;
//       var newTask = Task(title: title,
//           dateTime: selectedDate,
//           content: desc,
//           isDone: false);
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
// //        Navigator.pop(context);
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
//   DateTime selectedDate = DateTime.now();
//   void showDatePickerDialog()async{
//     DateTime? dateTime = await showDatePicker(context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime.now(),
//         lastDate: DateTime.now().add(Duration(days: 365)));
//     if(dateTime!=null){
//       selectedDate = dateTime;
//       setState(() {});
//     }
//   }
// }
// // import 'package:c5_online_todo/firebase_utils.dart';
// // import 'package:c5_online_todo/model/task.dart';
// // import 'package:c5_online_todo/ui/ui_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled2/showloading.dart';
// import 'package:untitled2/task.dart';
//
// import 'addtasktofirestore.dart';
//
// class AddTaskBottomSheet extends StatefulWidget {
//   static const String routename = 'U';
//   @override
//   State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
// }
//
// class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
//   GlobalKey<FormState> formController = GlobalKey<FormState>();
//
//   String title='';
//   String description = '';
//   DateTime selectedDate = DateTime.now();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//      Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(topLeft:Radius.circular(12)
//                 ,topRight: Radius.circular(12))
//         ),
//         padding: EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text("Add Task",
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.black),),
//             Form(
//                 key: formController,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     TextFormField(controller: titleController,
//                       decoration: InputDecoration(
//                           labelText: 'Title'
//                       ),
//                       onChanged: (text){
//                         title=text;
//                       },
//                       validator: (text){
//                         if(text==null||text.isEmpty){
//                           return 'please enter title';
//                         }
//                         return null;
//                       },
//                     ),
//                     TextFormField(
//                       minLines: 4,
//                       maxLines: 4,
//                       controller: descController,
//                       decoration: InputDecoration(
//                         labelText: 'description',
//                       ),
//                       onChanged: (text){
//                         description =text;
//                       },
//                       validator: (text){
//                         if(text==null||text.isEmpty){
//                           return 'please enter task description';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 12,),
//                     Text('Task Date'),
//                     SizedBox(height: 8,),
//                     InkWell(
//                         onTap: (){
//                           chooseDate();
//                         },
//                         child: Text(
//                           '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',textAlign: TextAlign.center,)),
//                     SizedBox(height: 12,),
//                   ],)),
//             ElevatedButton(onPressed: (){
//               addTask();
//             }, child: Text('Add Task'))
//           ],
//         ),
//       ),
//     );
//   }
// // how to format date time
//   void chooseDate()async{
//     var chosenDate = await showDatePicker(context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime.now(),
//         lastDate: DateTime.now().add(Duration(days: 365)));
//
//     if(chosenDate!=null){
//       selectedDate = chosenDate;
//       setState(() {
//       });
//     }
//   }
//
//   void addTask(){
//     if(formController.currentState?.validate() == true){
//       // insert task
//       // title,desc
//       String title = titleController.text;
//       String desc = descController.text;
//       Task task = Task(title: title,
//           description: description,
//           date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
//       showLoading(context, 'loading...',isCancelable: false);
//       addTaskToFirestore(task)
//           .then((value){
//         hideDialog(context);
//         showMessage(context, 'Task was added successfully', 'ok', (){
//           Navigator.pop(context);
//           Navigator.pop(context);
//         },isCancelable: false);
//
//       }).catchError((onError){
//         hideDialog(context);
//         showMessage(context, 'some thing went wrong. try again later', 'ok', (){
//           Navigator.pop(context);
//         });
//       });
//     }
//   }
//   var titleController = TextEditingController();
//   var descController = TextEditingController();
// }














////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//
// import 'package:flutter/material.dart';
// import 'package:untitled2/attributes.dart';
// import 'package:untitled2/editfileDB.dart';
// // import 'package:provider/provider.dart';
// // import 'package:todo_c6_sat/dialoge_utils.dart';
// // import 'package:todo_c6_sat/my_database.dart';
// // import 'package:todo_c6_sat/provider/tasks_provider.dart';
// // import 'package:todo_c6_sat/task.dart';
// //import 'package:untitled2/showloading.dart';
// //import 'package:untitled2/task.dart';
//
// //import 'addtasktofirestore.dart';
// import 'loading.dart';
//
// class AddTaskBottomSheet extends StatefulWidget {
//   static String routename='aa';
//
//   @override
//   State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
// }
//
// class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
//   var formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body:
//     SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.all(24),
//         child:
//         Form(
//           key: formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text('Add Task'),
//               TextFormField(
//                 controller: titleController,
//                 validator: (currentText){
//                   if(currentText==null||currentText.trim().isEmpty){
//                     return 'please enter title';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Title',
//                 ),
//               ),
//               TextFormField(
//                 controller: descController,
//                 validator: (text){
//                   if(text==null||text.isEmpty){
//                     return 'please enter details';
//                   }
//                   return null;
//                 },
//                 minLines: 4,
//                 maxLines: 4,
//                 decoration: InputDecoration(
//                   labelText: 'Details',
//                 ),
//               ),
//               InkWell(
//                 onTap: (){
//                   showDatePickerDialog();
//                 },
//                 child: Container(
//                     padding: EdgeInsets.all(12),
//                     // how to format datetime in dart -> intl
//                     //"yyyy/MM/dd"
//                     child: Text('${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
//                       style: Theme.of(context).textTheme.bodyMedium,
//                     )),
//               ),
//               ElevatedButton(
//                   style:ButtonStyle(
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12.0),
//                               side: BorderSide(color: Theme.of(context).primaryColor)
//                           )
//                       )
//                   ),
//                   onPressed: (){
//                     validateForm();
//                   }, child:Text('Add',style: TextStyle(
//                   fontSize: 18
//               ),) )
//             ],
//           ),
//         ),
//       ),
//     ),
//     );
//   }
//   void validateForm()async{
//     // var provider = Provider.of<TasksProvider>(context,listen: false);
//
//     if(formKey.currentState?.validate()==true){
//       // title, desc,date
//       String title = titleController.text;
//       String desc = descController.text;
//       var newTask = Task(title: title,
//           dateTime: selectedDate,
//           content: desc,
//           isDone: false);
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
// //        Navigator.pop(context);
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
//   DateTime selectedDate = DateTime.now();
//   void showDatePickerDialog()async{
//     DateTime? dateTime = await showDatePicker(context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime.now(),
//         lastDate: DateTime.now().add(Duration(days: 365)));
//     if(dateTime!=null){
//       selectedDate = dateTime;
//       setState(() {});
//     }
//   }
// }


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////****************************************Upload FileName and Describtion into dp in firecloud****************************************


import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/storage_service.dart';
import 'Departments.dart';
import 'attributes.dart';
import 'editfileDB.dart';
import 'encrpt/decrept.dart';
import 'loading.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

class UploadFile extends StatefulWidget {
  static const String routename = 'UploadFile';

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  //List<String> items = ['Department 1', 'Departement 2', 'Department 3','Departement 4'];

  // File? _file;
  // String? _fileName;
  // String? _fileDescription;

  var formKey = GlobalKey<FormState>();

  //const LoginPage({Key? key}) : super(key: key);


  //String? selectedItem = 'Departement 1';



  



  @override
  Widget build(BuildContext context) {

    final Storage storage = Storage();

    return Stack(
      children: [
        Image.asset('assets/images/bac.png',
          width: double.infinity,
          fit: BoxFit.fill,),

        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,

          body: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Padding(padding: EdgeInsets.symmetric(vertical: 25)),

                Row(
                  children: [Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                    FloatingActionButton(onPressed: (){
                      Navigator.pop(context, MaterialPageRoute(builder: (context)=> Departments()));

                    },
                      child: Icon(Icons.arrow_back, color: Colors.black54,size: 35),
                      backgroundColor: Colors.white,)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
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
                            onTap: () async{
                              final result = await FilePicker.platform.pickFiles(
                                allowMultiple: false,
                                type: FileType.custom,
                                allowedExtensions: ['png','jpg','pdf'],
                              );
                              if(result == null){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('No file Selected')
                                  ),
                                );
                                return null;
                              }
                              final path = result.files.single.path!;
                              var fileName = result.files.single.name;
                              // FileEncrpt.encryptFile(path);
                              // FileEncrpt.encryptFile(fileName);




                              storage.uploadFile(path,fileName )
                                  .then((value) => print('Done'));



                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('File Uploaded Successfully')
                                ),
                              );


                              // print(path);
                              // print(fileName);
                              //validateForm();
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=> Departments()));
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
                              width: 341,
                              height: 341,

                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                              ),

                            ),

                          ),

                        )
                      ],
                    ),

                  ),
                ),

                // Center(
                //   child: DropdownButton<String>(
                //     value: selectedItem,
                //     items : items
                //         .map((item) => DropdownMenuItem<String>(
                //       value: item,
                //       child: Text(item, style: TextStyle(fontSize: 24)),
                //     ))
                //         .toList(),
                //     onChanged: (item) => setState(() => selectedItem = item),
                //
                //   ),
                // ),

                // SizedBox(
                //   height: 20,
                // ),
                // DropDownButton(),

                // SizedBox(
                //   width: 312,
                //   child: Column(mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       // Form(
                //       //     key: _formKey,
                //       //     child:
                //       //     Column(
                //       //       children: [
                //       //         Row( mainAxisAlignment: MainAxisAlignment.center,
                //       //           children: [
                //       //             SizedBox(
                //       //               height: 50,
                //       //               width: 300,
                //       //               child: TextFormField(
                //       //                 decoration: InputDecoration( filled: true, fillColor: Colors.white,
                //       //                     border: OutlineInputBorder(
                //       //                       borderRadius: BorderRadius.circular(18),
                //       //                       borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                //       //                     ),
                //       //                     hintText: 'Email',
                //       //                     hintStyle: TextStyle(color: Colors.black,)),
                //       //                 keyboardType: TextInputType.emailAddress,
                //       //                 validator: (value) {
                //       //                   if(value!.isEmpty) {
                //       //                     return 'Enter email';
                //       //                   }
                //       //                   if(!value.contains('@')){
                //       //                     return 'Please enter a valid email address';
                //       //                   }
                //       //                   return null;
                //       //                 },
                //       //                 onSaved: (value){
                //       //                   _email = value!;
                //       //                 },
                //       //               ),
                //       //             ),
                //       //           ],
                //       //         ),
                //       //
                //       //         SizedBox(height: 20),
                //       //
                //       //         Row( mainAxisAlignment: MainAxisAlignment.center,
                //       //           children: [
                //       //             SizedBox(
                //       //               height: 50,
                //       //               width: 300,
                //       //               child: TextFormField(
                //       //                 decoration: InputDecoration( filled: true, fillColor: Colors.white,
                //       //                     border: OutlineInputBorder(
                //       //                       borderRadius: BorderRadius.circular(18),
                //       //                       borderSide: BorderSide(width: 0, style: BorderStyle.none),
                //       //                     ),
                //       //                     hintText: 'Password',
                //       //                     hintStyle: TextStyle(color: Colors.black
                //       //                     )),
                //       //                 obscureText: true,
                //       //                 validator: (value) {
                //       //                   if(value!.isEmpty) {
                //       //                     return 'Enter password';
                //       //                   }
                //       //                   if(value.length < 6){
                //       //                     return 'Please enter a  password';
                //       //                   }
                //       //                   return null;
                //       //                 },
                //       //                 onSaved: (value){
                //       //                   _password = value!;
                //       //                 },
                //       //               ),
                //       //             ),
                //       //           ],
                //       //         ),
                //       //         TextButton(onPressed: (){}, child: Text('Forget your password?',
                //       //           style: TextStyle(color: Colors.black26),)),
                //       //         ElevatedButton(onPressed: (){
                //       //           if(_formKey.currentState!.validate()){
                //       //             _formKey.currentState!.save();
                //       //             print('Email: $_email, Password $_password');}
                //       //          // Navigator.push(context, MaterialPageRoute(builder: (context)=> DirectoryPage()));
                //       //         },
                //       //             style: ElevatedButton.styleFrom(
                //       //                 primary: Color.fromRGBO(220, 205, 168, 1),
                //       //                 fixedSize: Size(300, 50),
                //       //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                //       //             child: Text('Login')
                //       //         ),
                //       //       ],
                //       //     )
                //       // ),
                //       // TextField(
                //       //   decoration:
                //       //   InputDecoration(
                //       //     border: UnderlineInputBorder(),
                //       //     labelText: 'Name',
                //       //   ),
                //       // ),
                //       //
                //       // TextField(
                //       //   decoration:
                //       //   InputDecoration(
                //       //     border: UnderlineInputBorder(),
                //       //     labelText: 'Describtion',
                //       //   ),
                //       // ),
                //       // Form(
                //       //   key: formKey,
                //       //   child: Column(
                //       //     crossAxisAlignment: CrossAxisAlignment.stretch,
                //       //     children: [
                //       //       TextFormField(
                //       //         // onChanged: (value) {
                //       //         //   setState(() {
                //       //         //     _fileName = value;
                //       //         //   });
                //       //         // },
                //       //         controller: titleController,
                //       //         validator: (currentText){
                //       //           if(currentText==null||currentText.trim().isEmpty){
                //       //             return 'please enter title';
                //       //           }
                //       //           return null;
                //       //         },
                //       //         decoration: InputDecoration(
                //       //           border: UnderlineInputBorder(),
                //       //           labelText: 'Name',
                //       //         ),
                //       //       ),
                //       //       TextFormField(
                //       //         // onChanged: (value) {
                //       //         //   setState(() {
                //       //         //     _fileDescription = value;
                //       //         //   });
                //       //         // },
                //       //         controller: descController,
                //       //         validator: (text){
                //       //           if(text==null||text.isEmpty){
                //       //             return 'please enter details';
                //       //           }
                //       //           return null;
                //       //         },
                //       //         minLines: 2,
                //       //         maxLines: 2,
                //       //         decoration: InputDecoration(
                //       //           border: UnderlineInputBorder(),
                //       //           labelText: 'Description',
                //       //         ),
                //       //       ),
                //       //       // InkWell(
                //       //       //   onTap: (){
                //       //       //     showDatePickerDialog();
                //       //       //   },
                //       //       //   child: Container(
                //       //       //       padding: EdgeInsets.all(12),
                //       //       //       // how to format datetime in dart -> intl
                //       //       //       //"yyyy/MM/dd"
                //       //       //       child: Text('${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                //       //       //         style: Theme.of(context).textTheme.bodyMedium,
                //       //       //       )),
                //       //       // ),
                //       //       // ElevatedButton(   //// *****************************************pickfile from Mobile************************************
                //       //       //   style:ElevatedButton.styleFrom(fixedSize: Size(200,50),
                //       //       //       primary: Color.fromRGBO(220, 205, 168, 1),
                //       //       //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18),
                //       //       //       )),
                //       //       //   onPressed: () async{
                //       //       //     final result = await FilePicker.platform.pickFiles(
                //       //       //       allowMultiple: false,
                //       //       //       type: FileType.custom,
                //       //       //       allowedExtensions: ['png','jpg',],
                //       //       //     );
                //       //       //     if(result == null){
                //       //       //       ScaffoldMessenger.of(context).showSnackBar(
                //       //       //         const SnackBar(
                //       //       //             content: Text('No file Selected')
                //       //       //         ),
                //       //       //       );
                //       //       //       return null;
                //       //       //     }
                //       //       //     final path = result.files.single.path!;
                //       //       //     final fileName = result.files.single.name;
                //       //       //
                //       //       //     storage
                //       //       //         .uploadFile(path, fileName)
                //       //       //         .then((value) => print('Done'));
                //       //       //
                //       //       //
                //       //       //     // print(path);
                //       //       //     // print(fileName);
                //       //       //     //validateForm();
                //       //       //     //Navigator.push(context, MaterialPageRoute(builder: (context)=> Departments()));
                //       //       //   },
                //       //       //   child:Text('Upload File',style: TextStyle(
                //       //       //     fontSize: 18),),
                //       //       // ),
                //       //       // SizedBox(height: 50,),
                //       //
                //       //       // ElevatedButton(
                //       //       //   style:ElevatedButton.styleFrom(fixedSize: Size(200,50),
                //       //       //       primary: Color.fromRGBO(220, 205, 168, 1),
                //       //       //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18),
                //       //       //       )),
                //       //       //   onPressed: () {
                //       //       //
                //       //       //     validateForm();
                //       //       //     //Navigator.push(context, MaterialPageRoute(builder: (context)=> Departments()));
                //       //       //   },
                //       //       //   child:Text('Submit',style: TextStyle(
                //       //       //       fontSize: 18
                //       //       //   ),
                //       //       //   ),
                //       //       // )
                //       //
                //       //     ],
                //       //   ),
                //       // ),
                //
                //
                //     ],
                //   ),
                // ),


                // SizedBox(
                //   height: 20,
                // ),

                // FutureBuilder(
                //     future: storage.listFiles(),
                //     builder: (BuildContext context,
                //         AsyncSnapshot<firebase_storage.ListResult> snapshot) {
                //       if(snapshot.connectionState == ConnectionState.done &&
                //           snapshot.hasData){
                //         return Container(
                //           padding: EdgeInsets.symmetric(horizontal: 20),
                //           height: 50,
                //           child: ListView.builder(
                //             scrollDirection: Axis.horizontal,
                //             shrinkWrap: true,
                //             itemCount: snapshot.data!.items.length,
                //               itemBuilder: (BuildContext context, int index){
                //                return Padding(
                //                  padding: const EdgeInsets.all(8.0),
                //                  child: ElevatedButton(
                //                     onPressed: () {},
                //                     child: Text(snapshot.data!.items[index].name),
                //               ),
                //                );
                //               }),
                //         );
                //       }
                //       if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
                //         return CircularProgressIndicator();
                //       }
                //       return Container();
                //     }),



////////////////////////////////////////////////////////////***************************************File Upload with URLLL**************************************
                // FutureBuilder(
                //     future: storage.downloadURl('اسعار.pdf'),
                //     builder: (BuildContext context,
                //         AsyncSnapshot<String> snapshot) {
                //       if(snapshot.connectionState == ConnectionState.done &&
                //           snapshot.hasData){
                //         return Container(
                //           width: 300,
                //           height: 250,
                //           child: Image.network(
                //             snapshot.data!,
                //             fit: BoxFit.cover),
                //         );
                //
                //       }
                //       if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
                //         return CircularProgressIndicator();
                //       }
                //       return Container();
                //     }),


              ],

            ),

          ),
        ),

      ],

    );

  }
  void validateForm()async{
    // var provider = Provider.of<TasksProvider>(context,listen: false);

    if(formKey.currentState?.validate()==true){
      // title, desc,date
      String title = titleController.text;
      String desc = descController.text;
      var newTask = Tasks(title: title,
          // dateTime: selectedDate,
          content: desc,
          //isDone: false
          );

      showLoading(context,'Loading...',isCancelable: false);
      MyDataBase.addTask(newTask)
          .then((value) {
        //provider.retrieveTasks();
        hideLoading(context);
        showMessage(context, 'task added successfully',
            posActionName: 'ok',posActionCallBack: (){
              Navigator.pop(context);
            });

       // Navigator.pop(context);
      }).onError((error, stackTrace) {
        hideLoading(context);
        showMessage(context, error.toString());
      }).timeout(Duration(seconds: 3),onTimeout:() {
        hideLoading(context);
        //provider.retrieveTasks();
        showMessage(context, 'Error connecting to server,'
            'please try again',posActionName: 'ok');
      },).timeout(Duration(seconds: 5,),onTimeout: (){
        hideLoading(context);
        showMessage(context, 'task added locally',
            posActionName:'ok');
      });
    }
  }
  var titleController = TextEditingController();
  var descController = TextEditingController();

  /////////



  // DateTime selectedDate = DateTime.now();
  // void showDatePickerDialog()async{
  //   DateTime? dateTime = await showDatePicker(context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime.now(),
  //       lastDate: DateTime.now().add(Duration(days: 365)));
  //   if(dateTime!=null){
  //     selectedDate = dateTime;
  //     setState(() {});
  //   }
  // }
}