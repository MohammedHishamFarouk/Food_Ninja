import 'package:flutter/material.dart';
import 'package:food_ninja/core/style/color_manager.dart';
import 'package:food_ninja/view/screens/chat/call_screen.dart';
import 'package:food_ninja/view/screens/chat/chatingScreen/chating_screen.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({
    super.key,
    this.addButtons = false,
    required this.image,
    required this.name,
    this.status = 'Offline',
    required this.id,
  });

  final bool addButtons;
  final String image;
  final String name;
  final String status;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: FilledButton(
        onPressed: () {
          if (!addButtons) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ChatingScreen(
                    image: image,
                    name: name,
                    id: id,
                  );
                },
              ),
            );
          }
        },
        style: FilledButton.styleFrom(
          backgroundColor: addButtons
              ? Colors.white12
              : Colors.grey.shade900.withOpacity(0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
        ),
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 90,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        name,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    addButtons
                        ? Row(
                            children: [
                              status == 'Online'
                                  ? CircleAvatar(
                                      backgroundColor:
                                          ColorManager.blendedGreen,
                                      radius: 4,
                                    )
                                  : const CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius: 4,
                                    ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                status,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        : const Text(
                            'Your Order Just Arrived!',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                    const SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
              const Spacer(),
              addButtons
                  ? IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CallScreen(
                              image: image,
                              name: name,
                              id: id,
                            );
                          },
                        ),
                      ),
                      icon: const Icon(Icons.phone),
                    )
                  : const Padding(
                      padding: EdgeInsets.only(
                        bottom: 30.0,
                      ),
                      child: Text(
                        '20:00',
                        style: TextStyle(
                            color: Colors.white24,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
