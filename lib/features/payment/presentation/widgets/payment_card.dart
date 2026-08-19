import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/payment/presentation/widgets/payment_card_footer.dart';
import 'package:e_commerce/features/payment/presentation/widgets/payment_card_header.dart';
import 'package:e_commerce/features/payment/presentation/widgets/payment_card_number.dart';
import 'package:e_commerce/features/payment/presentation/widgets/payment_methods_view_body.dart';
import 'package:flutter/material.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key, required this.paymentMethod});

  final PaymentCardModel paymentMethod;

  String _getCardLogo(String type) {
    switch (type.toLowerCase()) {
      case 'visa':
        return 'VISA';
      case 'mastercard':
        return 'MC';
      default:
        return 'CARD';
    }
  }

  Color _getCardColor(String type) {
    switch (type.toLowerCase()) {
      case 'visa':
        return const Color(0xFF1A1F71);
      case 'mastercard':
        return const Color(0xFF0A0E27);
      default:
        return const Color(0xFF1A1F71);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _getCardColor(paymentMethod.type).withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(20),
        border: paymentMethod.isDefault
            ? Border.all(
                color: const Color.fromARGB(
                  255,
                  130,
                  39,
                  210,
                ).withValues(alpha: 0.5),
                width: 2,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaymentCardHeader(
            type: paymentMethod.type,
            cardLogo: _getCardLogo(paymentMethod.type),
            isDefault: paymentMethod.isDefault,
          ),
          vGap(12),
          PaymentCardNumber(lastFour: paymentMethod.lastFour),
          vGap(20),
          PaymentCardFooter(
            cardHolderName: paymentMethod.cardHolderName,
            expiryDate: paymentMethod.expiryDate,
          ),
        ],
      ),
    );
  }
}
