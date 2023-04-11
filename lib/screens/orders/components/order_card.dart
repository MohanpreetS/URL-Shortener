import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/order_item_model.dart';
import '../../../models/order_model.dart';
import '../../packages/components/label_text.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
  });

  final OrderModel order;

  String dateMaker(String dateTime) {
    return dateTime.substring(0, 8);
  }

  String timeMaker(String dateTime) {
    return dateTime.substring(0, 8);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: medPadding,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: largePadding,
        vertical: medPadding,
      ),
      //height: 300,
      width: 600,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: smallPadding),
            child: LabelText(
              label: "Customer Name: ",
              text: "${order.customerName}",
              isCenter: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: smallPadding),
            child: LabelText(
              label: "Customer Number: ",
              text: "${order.customerPhone}",
              isCenter: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: smallPadding),
            child: LabelText(
              label: "Date: ",
              text: dateMaker(order.dateTime),
              isCenter: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: smallPadding),
            child: LabelText(
              label: "Time: ",
              text: timeMaker(order.dateTime),
              isCenter: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: smallPadding),
            child: LabelText(
              label: "Employee ID: ",
              text: order.employeeId,
              isCenter: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: smallPadding),
            child: LabelText(
              label: "Status: ",
              text: order.status,
              isCenter: true,
            ),
          ),
          ...List.generate(
            order.listOfItems!.length,
            (index) => OrderItemCard(orderItem: order.listOfItems![index]),
          ),
          // OrderItemCard(
          //   orderItem: order.listOfItems![0],
          // ),
          const Divider(),
          SubGrandTax(orderItems: order.listOfItems!),
        ],
      ),
    );
  }
}

class SubGrandTax extends StatelessWidget {
  const SubGrandTax({
    super.key,
    required this.orderItems,
  });

  final List<OrderItemModel> orderItems;

  int subTotalCalc() {
    int subTotal = 0;
    for (int i = 0; i < orderItems.length; i++) {
      final dPrice = orderItems[i].discountPrice;
      final rPrice = orderItems[i].retailPrice;
      if (dPrice != "") {
        subTotal += int.parse(dPrice);
      } else {
        subTotal += int.parse(rPrice);
      }
    }
    return subTotal;
  }

  @override
  Widget build(BuildContext context) {
    int tax = (subTotalCalc() * 0.13).round();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: smallPadding),
          child: LabelTextSpaced(
            label: "Subtotal",
            text: "${subTotalCalc()}",
            isCenter: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: smallPadding),
          child: LabelTextSpaced(
            label: "Tax (13%)",
            text: "$tax",
            isCenter: true,
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: smallPadding),
          child: LabelTextSpaced(
            label: "Grand Total",
            text: "${subTotalCalc() + tax}",
            isCenter: true,
          ),
        ),
      ],
    );
  }
}

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({
    super.key,
    required this.orderItem,
  });

  final OrderItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    int intDiscountPrice = 1000000;
    if (orderItem.discountPrice != "") {
      intDiscountPrice = int.parse(orderItem.discountPrice);
    }
    final intRetailPrice = int.parse(orderItem.retailPrice);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: smallPadding),
          child: LabelTextSpaced(
            label: orderItem.testName,
            text: orderItem.retailPrice,
          ),
        ),
        if (intRetailPrice > intDiscountPrice)
          Padding(
            padding: const EdgeInsets.only(bottom: smallPadding),
            child: LabelTextSpaced(
              label: "   Discount - ${orderItem.testName}",
              text: "${intDiscountPrice - intRetailPrice}",
            ),
          ),
      ],
    );
  }
}
