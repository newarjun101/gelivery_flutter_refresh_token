
import 'package:flutter/material.dart';


import '../../utils/color_constants.dart';

void showLoadingDialog(BuildContext context, {bool? isDismissible}) {
  showDialog(
      context: context,
      barrierDismissible: isDismissible ?? false,
      builder: (context) {
        return Dialog(
          child: Container(
            height: 80,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                CircularProgressIndicator(
                  color: primaryColor,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Loading...",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
        );
      });
}

showConfirmDialog(
    {required BuildContext context,
      VoidCallback? onConfirm,
      VoidCallback? onCancel,
      required String title,
      required String cancel,
      required String confirm,
      required String subtitle,
      IconData? icon,
      Color? confirmColor,}) {
  AlertDialog alert = AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0))),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //   Center(child: CircularProgressIndicator()),
        //   SizedBox(width: 12,),
        //  Lottie.asset("assets/lottie/exit.json",width: 50,height: 50),
        Icon(icon??Icons.logout,size: 40,),
        const SizedBox(
          height: 8,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            )),

        const SizedBox(
          height: 8,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 36,
              child: OutlinedButton(
                style:OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    )
                ),
                onPressed: onCancel ?? () => Navigator.pop(context),
                child: Text(
                  cancel,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            SizedBox(
              width: 100,
              height: 36,
              child: ElevatedButton(
                onPressed: onConfirm,
                style: ElevatedButton.styleFrom(
                    backgroundColor:confirmColor?? Colors.red,
                    side: BorderSide(color: Colors.transparent, width: 0)
                ),
                child: Text(confirm,
                    style: const TextStyle(color: Colors.white, fontSize: 14)),
              ),
            ),
/*              ElevatedButton(onPressed: onCancel, child: Text(confirm),
           //   color: Theme.of(context).primaryColor,
            )*/
          ],
        )
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

