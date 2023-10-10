import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_template/routes/router.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chỉnh sửa'),
        actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () {},
        ),
      ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: 40),
              // -- IMAGE with ICON
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(image: AssetImage(''))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100), color: ThemeData().primaryColor),
                      child: const Icon(Icons.camera, color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
    
              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('Tên đầu đủ'), prefixIcon: Icon(Icons.person_outlined)),
                    ),
                    // const SizedBox(height: tFormHeight - 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('Email'), prefixIcon: Icon(Icons.email)),
                    ),
                    // const SizedBox(height: tFormHeight - 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('Số điện thoại'), prefixIcon: Icon(Icons.phone)),
                    ),
                    // const SizedBox(height: tFormHeight - 20),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: const Text('Mật khẩu'),
                        prefixIcon: const Icon(Icons.fingerprint),
                        suffixIcon:
                        IconButton(icon: const Icon(Icons.remove_red_eye), onPressed: () {}),
                      ),
                    ),
                    // const SizedBox(height: tFormHeight),
    
                    // -- Form Submit Button
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //     onPressed: () {},
                    //     style: ElevatedButton.styleFrom(
                    //         backgroundColor: ThemeData().primaryColor,
                    //         side: BorderSide.none,
                    //         shape: const StadiumBorder()),
                    //     child: Text('Chỉnh sửa', style: TextStyle(color: ThemeData().primaryColorLight)),
                    //   ),
                    // ),
                    // const SizedBox(height: tFormHeight),
    
                    // -- Created Date and Delete Button
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     const Text.rich(
                    //       TextSpan(
                    //         text: 'Đăng ký',
                    //         style: TextStyle(fontSize: 12),
                    //         children: [
                    //           TextSpan(
                    //               text: 'Đăng ký từ',
                    //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                    //         ],
                    //       ),
                    //     ),
                    //     ElevatedButton(
                    //       onPressed: () {},
                    //       style: ElevatedButton.styleFrom(
                    //           backgroundColor: Colors.redAccent.withOpacity(0.1),
                    //           elevation: 0,
                    //           foregroundColor: Colors.red,
                    //           shape: const StadiumBorder(),
                    //           side: BorderSide.none),
                    //       child: const Text('Xoá'),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}