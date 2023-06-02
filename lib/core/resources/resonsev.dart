// // BaseWidget >

// import 'package:flutter/material.dart';

// class BaseWidget extends StatelessWidget {

//   final Widget Function(

//       BuildContext context, SizingInformation sizingInformation) builder;

//   const BaseWidget({Key? key, required this.builder}) : super(key: key);

//   @override

//   Widget build(BuildContext context) {

//     var mediaQuery = MediaQuery.of(context);

//     return LayoutBuilder(builder: (context, boxConstraints) {

//       var sizingInformation = SizingInformation(

//         orientation: mediaQuery.orientation,

//         deviceScreenType: getDeviceType(mediaQuery),

//         screenSize: mediaQuery.size,

//         localWidgetSize:

//         Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
//       );

//       return builder(context, sizingInformation);

//     });

//   }

// }

// ​

// // DeviceScreenType >

// enum DeviceScreenType { mobile, tablet, desktop }

// // Get DeviceType >

// DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {

//   var orientation = mediaQuery.orientation;

//   double deviceWidth = 0;

//   if (orientation == Orientation.landscape) {

//     deviceWidth = mediaQuery.size.height;

//   } else {

//     deviceWidth = mediaQuery.size.width;

//   }

// ​

//   if (deviceWidth > 950) {

//     return DeviceScreenType.desktop;

//   }

//   if (deviceWidth > 600) {

//     return DeviceScreenType.tablet;

//   }

//   return DeviceScreenType.mobile;

// // SizingInformation >

// class SizingInformation {

//   final Orientation? orientation;

//   final DeviceScreenType? deviceScreenType;

//   final Size? screenSize;

//   final Size? localWidgetSize;

// ​

//   SizingInformation(

//       {this.orientation,

//         this.deviceScreenType,

//         this.screenSize,

//         this.localWidgetSize});

//   @override

//   String toString() {

//     return 'Orientation:$orientation DeviceScreenType:$deviceScreenType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';

//   }

// }


// // How to use ?! >

//  // sizingInformation.toString() ( Print this for sizes )

//   // sizingInformation.screenSize!.height

//   // sizingInformation.screenSize!.width

//  // sizingInformation.localWidgetSize!.width (max width)

//  // sizingInformation.localWidgetSize!.height (max height)

//   // sizingInformation.orientation (for check if portrait or landscape)

//  // sizingInformation.deviceScreenType (for check if mobile or tablet or desktop)

// ​

//   class HomeViewTest extends StatelessWidget {

//   const HomeViewTest({Key? key}) : super(key: key);

//   @override

//   Widget build(BuildContext context.) {

// return BaseWidget(builder: (context, sizingInformation) =>

// Container(

//         width: sizingInformation.screenSize!.width)

// );

//   }    

               

//            : mediaQuery.size,

//         localWidgetSize:

//         Size(boxConstraints.maxWidth, boxConstraints.maxHeight),

//       );

//       return builder(context, sizingInformation);

//     });

//   }

// // DeviceScreenType >
// 99
// enum DeviceScreenType { mobile, tablet, desktop }
// 100
// ​
// 101
// ​
// 102
// // Get DeviceType >
// 103
// DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
// 104
//   var orientation = mediaQuery.orientation;
// 105
//   double deviceWidth = 0;
// 106
//   if (orientation == Orientation.landscape) {
// 107
//     deviceWidth = mediaQuery.size.height;
// 108
//   } else {
// 109
//     deviceWidth = mediaQuery.size.width;
// 110
//   }
// 111
// ​
// 112
//   if (deviceWidth > 950) {
// 113
//     return DeviceScreenType.desktop;
// 114
//   }
// 115
//   if (deviceWidth > 600) {
// 116
//     return DeviceScreenType.tablet;
// 117
//   }
// 118
// ​
// 119
//   return DeviceScreenType.mobile;
// 120
// }
// 121
// ​
// 122
// // SizingInformation >
// 123
// ​
// 124
// class SizingInformation {
// 125
// ​
// 126
//   final Orientation? orientation;
// 127
//   final DeviceScreenType? deviceScreenType;
// 128
//   final Size? screenSize;
// 129
//   final Size? localWidgetSize;
// 130
// ​
// 131
//   SizingInformation(
// 132
//       {this.orientation,
// 133
//         this.deviceScreenType,
// 134
//         this.screenSize,
// 135
//         this.localWidgetSize});
// 136
// ​
// 137
//   @override
// 138
//   String toString() {
// 139
//     return 'Orientation:$orientation DeviceScreenType:$deviceScreenType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
// 140
//   }
// 141
// }
// 142
// ​
// 143
// // How to use ?! >
// 144
//  -> // sizingInformation.toString() ( Print this for sizes )
// 145
//  -> // sizingInformation.screenSize!.height
// 146
//  -> // sizingInformation.screenSize!.width
// 147
//  -> // sizingInformation.localWidgetSize!.width (max width)
// 148
//  -> // sizingInformation.localWidgetSize!.height (max height)
// 149
//  -> // sizingInformation.orientation (for check if portrait or landscape)
// 150
//  -> // sizingInformation.deviceScreenType (for check if mobile or tablet or desktop)
// 151
// ​
// 152
//   class HomeViewTest extends StatelessWidget {
// 153
//   const HomeViewTest({Key? key}) : super(key: key);
// 154
// ​
// 155
//   @override
// 156
//   Widget build(BuildContext context) {
// 157
// return BaseWidget(builder: (context, sizingInformation) =>
// 158
// Containeclass BaseWidget extends StatelessWidget {
// 159
//   final Widget Function(
// 160
//       BuildContext context, SizingInformation sizingInformation) builder;
// 161
// ​
// 162
//   const BaseWidget({Key? key, required this.builder}) : super(key: key);
// 163
// ​
// 164
//   @override
// 165
//   Widget build(BuildContext context) {
// 166
//     var mediaQuery = MediaQuery.of(context);
// 167
//     return LayoutBuilder(builder: (context, boxConstraints) {
// 168
//       var sizingInformation = SizingInformation(
// 169
//         orientation: mediaQuery.orientation,
// 170
//         deviceScreenType: getDeviceType(mediaQuery),
// 171
//         screenSize: mediaQuery.size,
// 172
//         localWidgetSize:
// 173
//         Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
// 174
//       );
// 175
//       return builder(context, sizingInformation);
// 176
//     });
// 177
//   }
// 178
// }
// 179
// ​
// 180
// // DeviceScreenType >
// 181
// enum DeviceScreenType { mobile, tablet, desktop }
// 182
// ​
// 183
// ​
// 184
// // Get DeviceType >
// 185
// DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
// 186
//   var orientation = mediaQuery.orientation;
// 187
//   double deviceWidth = 0;
// 188
//   if (orientation== Orientation.landscape) {
// 189
//     deviceWidth = mediaQuery.size.height;
// 190
//   } else {
// 191
//     deviceWidth = mediaQuery.size.width;
// 192
//   }
// 193
// ​
// 194
//   if (deviceWidth > 950) {
// 195
//     return DeviceScreenType.desktop;
// 196
//   }
// 197
//   if (deviceWidth > 600) {
// 198
//     return DeviceScreenType.tablet;
// 199
//   }
// 200
// ​
// 201
//   return DeviceScreenType.mobile;
// 202
// }
// 203
// ​
// 204
// // SizingInformation >
// 205
// ​
// 206
// class SizingInformation {
// 207
// ​
// 208
//   final Orientation? orientation;
// 209
//   final DeviceScreenType? deviceScreenType;
// 210
//   final Size? screenSize;
// 211
//   final Size? localWidgetSize;
// 212
// ​
// 213
//   SizingInformation(
// 214
//       {this.orientation,
// 215
//         this.deviceScreenType,
// 216
//         this.screenSize,
// 217
//         this.localWidgetSize});
// 218
// ​
// 219
//   @override
// 220
//   String toString() {
// 221
//     return 'Orientation:$orientation DeviceScreenType:$deviceScreenType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
// 222
//   }
// 223
// }
// 224
// ​
// 225
// // How to use ?! >
// 226
//  -> // sizingInformation.toString() ( Print this for sizes )
// 227
//  -> // sizingInformation.screenSize!.height
// 228
//  -> // sizingInformation.screenSize!.width
// 229
//  -> // sizingInformation.localWidgetSize!.width (max width)
// 230
//  -> // sizingInformation.localWidgetSize!.height (max height)
// 231
//  -> // sizingInformation.orientation (for check if portrait or landscape)
// 232
//  -> // sizingInformation.deviceScreenType (for check if mobile or tablet or desktop)
// 233
// ​
// 234
//   class HomeViewTest extends StatelessWidget {
// 235
//   const HomeViewTest({Key? key}) : super(key: key);
// 236
// ​
// 237
//   @override
// 238
//   Widget build(BuildContext context.) {
// 239
// return BaseWidget(builder: (context, sizingInformation) =>
// 240
// Container(
// 241
//         width: sizingInformation.screenSize!.width)
// 242
// );
// 243
//   }    
// 244
               
// 245
//            : mediaQuery.size,
// 246
//         localWidgetSize:
// 247
//         Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
// 248
//       );
// 249
//       return builder(context, sizingInformation);
// 250
//     });
// 251
//   }
// 252
// }
// 253
// ​
// 254
// // DeviceScreenType >
// 255
// enum DeviceScreenType { mobile, tablet, desktop }
// 256
// ​
// 257
// ​
// 258
// // Get DeviceType >
// 259
// DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
// 260
//   var orientation = mediaQuery.orientation;
// 261
//   double deviceWidth = 0;
// 262
//   if (orientation == Orientation.landscape) {
// 263
//     deviceWidth = mediaQuery.size.height;
// 264
//   } else {
// 265
//     deviceWidth = mediaQuery.size.width;
// 266
//   }
// 267
// ​
// 268
//   if (deviceWidth > 950) {
// 269
//     return DeviceScreenType.desktop;
// 270
//   }
// 271
//   if (deviceWidth > 600) {
// 272
//     return DeviceScreenType.tablet;
// 273
//   }
// 274
// ​
// 275
//   return DeviceScreenType.mobile;
// 276
// }
// 277
// ​
// 278
// // SizingInformation >
// 279
// ​
// 280
// class SizingInformation {
// 281
// ​
// 282
//   final Orientation? orientation;
// 283
//   final DeviceScreenType? deviceScreenType;
// 284
//   final Size? screenSize;
// 285
//   final Size? localWidgetSize;
// 286
// ​
// 287
//   SizingInformation(
// 288
//       {this.orientation,
// 289
//         this.deviceScreenType,
// 290
//         this.screenSize,
// 291
//         this.localWidgetSize});
// 292
// ​
// 293
//   @override
// 294
//   String toString() {
// 295
//     return 'Orientation:$orientation DeviceScreenType:$deviceScreenType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
// 296
//   }
// 297
// }
// 298
// ​
// 299
// // How to use ?! >
// 300
//  -> // sizingInformation.toString() ( Print this for sizes )
// 301
//  -> // sizingInformation.screenSize!.height
// 302
//  -> // sizingInformation.screenSize!.width
// 303
//  -> // sizingInformation.localWidgetSize!.width (max width)
// 304
//  -> // sizingInformation.localWidgetSize!.height (max height)
// 305
//  -> // sizingInformation.orientation (for check if portrait or landscape)
// 306
//  -> // sizingInformation.deviceScreenType (for check if mobile or tablet or desktop)
// 307
// ​
// 308
//   class HomeViewTest extends StatelessWidget {
// 309
//   const HomeViewTest({Key? key}) : super(key: key);
// 310
// ​
// 311
//   @override
// 312
//   Widget build(BuildContext context) {
// 313
// return BaseWidget(builder: (context, sizingInformation) =>
// 314
// Container(
// 315
//         width: sizingInformation.screenSize!.width)
// 316
// );
// 317
// }
// 318
 
// 319
// }
// 320
               
// 321
//            https://www.facebook.com/reel/1021256555936082?s=yWDuG2&fs=e&mibextid=Nif5oz