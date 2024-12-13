import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('صفحه احراز هویت'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'ورود'),
              Tab(text: 'ثبت‌نام'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoginScreen(),
            RegistrationScreen(),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'شماره موبایل',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'لطفاً شماره موبایل خود را وارد کنید';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'رمز عبور',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'لطفاً رمز عبور خود را وارد کنید';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('ورود موفق'),
                        content: Text('خوش آمدید!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('باشه'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('ورود'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isDriver = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// کنترلرهای فرم
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController carModelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'نوع کاربر خود را انتخاب کنید:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isDriver = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDriver ? Colors.grey : Colors.blue,
                ),
                child: Text('کاربر معمولی'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isDriver = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDriver ? Colors.blue : Colors.grey,
                ),
                child: Text('راننده'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'نام و نام خانوادگی',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفاً نام خود را وارد کنید';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: 'شماره موبایل',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفاً شماره موبایل خود را وارد کنید';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: nationalIdController,
                    decoration: InputDecoration(
                      labelText: 'کد ملی',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفاً کد ملی خود را وارد کنید';
                      }
                      if (value.length != 10) {
                        return 'کد ملی باید ۱۰ رقم باشد';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: birthDateController,
                    decoration: InputDecoration(
labelText: 'تاریخ تولد (مثال: 1370/01/01)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفاً تاریخ تولد خود را وارد کنید';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'رمز عبور',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفاً رمز عبور خود را وارد کنید';
                      }
                      if (value.length < 6) {
                        return 'رمز عبور باید حداقل ۶ کاراکتر باشد';
                      }
                      return null;
                    },
                  ),
                  if (isDriver) ...[
                    SizedBox(height: 16),
                    TextFormField(
                      controller: carModelController,
                      decoration: InputDecoration(
                        labelText: 'مدل خودرو',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'لطفاً مدل خودرو خود را وارد کنید';
                        }
                        return null;
                      },
                    ),
                  ],
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        String userType =
                            isDriver ? 'راننده' : 'کاربر معمولی';
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('ثبت‌نام موفق'),
                              content: Text(
                                  'شما به عنوان $userType ثبت‌نام شدید.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('باشه'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text('ثبت‌نام'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}