import 'package:flutter/material.dart';
import 'package:image_picker_example/utils/date_format.dart';

class BirthData extends StatefulWidget {
  const BirthData({super.key});

  @override
  State<BirthData> createState() => _BirthDataState();
}

class _BirthDataState extends State<BirthData> {
  String birthData = '';
  DateTime? taskDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data birt'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              width: 380,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Color(0xffEBEEF2),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      TimeUtils.formatToMyTime(
                        DateTime.parse(birthData),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        taskDay = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2300),
                        );
                        setState(
                          () {
                            birthData = taskDay.toString();
                          },
                        );
                      },
                      child: Icon(Icons.calendar_month),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
