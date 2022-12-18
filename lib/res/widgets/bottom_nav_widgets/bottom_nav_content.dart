import 'package:flutter/material.dart';




Widget bottomnavcontent({
  BuildContext? context,
  void Function()? passontap,
  IconData? passicondata,
  Color?  passiconcolor,
  String? passtext,
  
}) {
  return Container(
    padding: const EdgeInsets.only(top: 12),
    child: InkWell(
      onTap: passontap,
      child: Column(
        children: [
          
              Icon(
                passicondata,
                color: passiconcolor,
                size: 18,
              ),
          const SizedBox(
            height: 4,
          ),
          Text(
            passtext!,
            style: TextStyle(
              color: passiconcolor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    ),
  );
}