import 'package:flutter/material.dart';
import 'package:food_ninja/core/components/buttons/green_button_widget.dart';
import 'package:food_ninja/core/components/productButton/components/inc_dec_btn_widget.dart';
import 'package:food_ninja/core/components/productButton/components/product_image_widget.dart';
import 'package:food_ninja/core/style/color_manager.dart';
import 'package:food_ninja/view/screens/infoScreen/productScreen/product_screen.dart';

class ProductButton extends StatelessWidget {
  const ProductButton({
    super.key,
    this.addButton = false,
    required this.image,
    required this.productName,
    required this.hintText,
    this.price = -20,
    required this.description,
    this.id,
    this.countButtons = true,
    this.buttonText = 'process',
  });

  final bool addButton, countButtons;
  final String image;
  final String productName, hintText, description, buttonText;
  final double price;
  final int? id;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProductButton && id == other.id && price == other.price);
  }

  @override
  int get hashcode => id.hashCode;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: FilledButton(
        onPressed: () {
          if (!addButton) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductScreen(
                  foodImage: image,
                  foodName: productName,
                  description: description,
                  productHinText: hintText,
                  price: price,
                  id: id,
                ),
              ),
            );
          }
        },
        style: FilledButton.styleFrom(
          overlayColor: !addButton ? Colors.white : Colors.transparent,
          splashFactory: !addButton ? null : NoSplash.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
        ),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            buttonText.contains('Reorder')
                ? Colors.grey.shade900
                : Colors.transparent,
            BlendMode.saturation,
          ),
          child: Container(
            constraints: const BoxConstraints(
              maxHeight: 100,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProductImageWidget(image: image, addButtons: addButton),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: screenWidth <= 390 ? 100 : 150,
                        ),
                        child: Text(
                          productName,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: screenWidth <= 390 ? 13 : 14,
                          ),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: screenWidth <= 390 ? 100 : 150,
                        ),
                        child: Text(
                          hintText,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: screenWidth <= 390 ? 13 : 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      if (addButton)
                        Text(
                          r'$' ' $price',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.blendedGreen,
                          ),
                        ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: addButton ? 8 : 16),
                  child: addButtons(screenWidth),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addButtons(double screenWidth) {
    if (addButton) {
      if (countButtons) {
        return IncAndDecBtnWidget(id: id, price: price);
      } else {
        return GreenButtonWidget(
          text: buttonText,
          height: 30,
          width: 80,
          fontSize: 14,
          onTap: () {},
        );
      }
    } else {
      return Text(
        r'$' '$price',
        style: TextStyle(
          fontSize: screenWidth <= 390 ? 20 : 24,
          fontWeight: FontWeight.bold,
          color: ColorManager.yellowTint,
        ),
      );
    }
  }
}
