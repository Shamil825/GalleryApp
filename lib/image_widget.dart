// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ImageWidget extends StatelessWidget {
//   final File image;
//   final ValueChanged<ImageSource> onClicked;

//   const ImageWidget({
//     Key? key,
//     required this.image,
//     required this.onClicked,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final Color = Theme.of(context).colorScheme.primary;

//     return Center(
//       child: Stack(
//         children: [
//           buildImage(context),
//           Positioned(
//             bottom: 0,
//             right: 4,
//             child: buildEditIcon(Color),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildImage(BuildContext context) {
//     final imagepath = this.image.path;
//     final image = imagepath.contains('htps://')
//         ? NetworkImage(imagepath)
//         : FileImage(File(imagepath));
//         return ClipOval(
//           child: Material(color: Colors.transparent,
//           child: Ink.image(image: image as ImageProvider,fit: BoxFit.cover,width: 160,height: 160,
//           child: InkWell(onTap: ()async{
// final source=await ShowImageSource(context);
// if(source==null)return;
// onClicked(source);
//           },),
//           ),),
//         );
//   }
// }
