import 'package:flutter/material.dart';


import '../../utils/color_constants.dart';

class CustomTextField extends StatelessWidget {

  final String? label;
  final String? hint;
   final TextEditingController? textController;
   final TextInputType? textInputType;
   final Function(String?)? onChange;
   final String? initialTexxt;
   final int? maxLine;
   final double? size;
   final double? width;
   final double? prefixIconSize;
   final bool? isEnable;
   final Widget? suffixIcon;
 final IconData? prefixIcon;
  const CustomTextField({Key? key, this.label, this.hint, this.textController, this.textInputType, this.onChange, this.initialTexxt, this.maxLine, this.size=48, this.suffixIcon, this.isEnable,this.prefixIcon, this.width, this.prefixIconSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       if(prefixIcon != null) Icon(prefixIcon,size: prefixIconSize,),
        SizedBox(width: 8,),
        Expanded(
          child: SizedBox(
            height: size,
               width: width,
               child: TextFormField(
              maxLines: maxLine,
              autofocus: false,
              enabled: isEnable ,
              readOnly: isEnable??false,
              initialValue: initialTexxt,
              onChanged: onChange,
              controller: textController,
              keyboardType: textInputType,
              cursorColor: primaryColor,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: hint??"",
                contentPadding:  EdgeInsets.only(top: size==200?24:8,left: 8,right: 8),
                hintStyle: TextStyle(color: hintColor),
             //   label: Text(label??"",style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 16),),
                border:  UnderlineInputBorder(
                 borderSide:const BorderSide(color:hintColor,width: 1,),
                  borderRadius: BorderRadius.circular(12)
                ),
                suffixIcon: suffixIcon,
                focusedBorder:  UnderlineInputBorder(
                 borderSide: BorderSide(color: hintColor,width: 1),
                    borderRadius: BorderRadius.circular(12)
                ),
                disabledBorder:   UnderlineInputBorder(
              borderSide: BorderSide(color: hintColor,width: 1),
                   borderRadius: BorderRadius.circular(12)
               ),
                enabledBorder:  UnderlineInputBorder(
                 borderSide: BorderSide(color: hintColor,width: 1),
                    borderRadius: BorderRadius.circular(12)
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}