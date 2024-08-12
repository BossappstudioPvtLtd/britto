import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_app/comen/common_methords.dart';
import 'package:restart_app/restart_app.dart';



class PaymentDialog extends StatefulWidget
{
  String fareAmount;

  PaymentDialog({super.key,  required this.fareAmount,});

  @override
  State<PaymentDialog> createState() => _PaymentDialogState();
}



class _PaymentDialogState extends State<PaymentDialog>
{
  CommonMethods cMethods = CommonMethods();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Colors.black54,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
               
            const SizedBox(height: 8,),
            Image.asset("assets/images/moneycurrency.png",height:100,width:100),

            const SizedBox(height: 21,),

             Text(
              "PAY CASH".tr(),
              style: const TextStyle(
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 21,),

            const Divider(
              height: 1.5,
              color: Colors.white70,
              thickness: 1.0,
            ),

            const SizedBox(height: 16,),

            Text(
              "₹${widget.fareAmount}",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16,),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text("This is fare amount".tr(), textAlign: TextAlign.center,style: const TextStyle(color: Colors.grey),),
                  Text("(₹ ${widget.fareAmount})", textAlign: TextAlign.center,style: const TextStyle(color: Colors.grey),),
                  Text("you have to pay to the driver.".tr(), textAlign: TextAlign.center,style: const TextStyle(color: Colors.grey),),
               
                ],
              ),
            ),
            const SizedBox(height: 31,),

            ElevatedButton(
              onPressed: ()
              {
                Navigator.pop(context, "paid");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child:  Text(
                "PAY CASH".tr(),
              ),
            ),

            const SizedBox(height: 41,)

          ],
        ),
      ),
    );
  }
}
