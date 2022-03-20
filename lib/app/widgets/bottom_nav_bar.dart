import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/others/defauls.dart';

class BottomNavBar extends StatelessWidget {
  static RxInt index = 0.obs;
  static RxBool hide = false.obs;

  final IntCallback? onChanged;
  const BottomNavBar ({Key? key, this.onChanged}) : super(key: key);

  void onTap(int tapIndex){
    if(BottomNavBar.index.value != tapIndex) {
      index(tapIndex);
      onChanged?.call(tapIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Obx(()=>AnimatedCrossFade(
          firstChild: SizedBox(),
          secondChild: Container(
            width: Get.width * .4,
            height: 55,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _BottomNavButton(
                    icon: BottomNavBar.index.value == 0 ? CupertinoIcons.house_fill : CupertinoIcons.house,
                    selected: BottomNavBar.index.value == 0,
                    onTap: () => onTap(0)
                ),
                _BottomNavButton(
                    icon: BottomNavBar.index.value == 1 ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                    selected: BottomNavBar.index.value == 1,
                    onTap: () => onTap(1)
                ),
                _BottomNavButton(
                    icon: BottomNavBar.index.value == 2 ? CupertinoIcons.person_alt : CupertinoIcons.person,
                    selected: BottomNavBar.index.value == 2,
                    onTap: () => onTap(2)
                ),
              ],
            ),
          ),
          crossFadeState: hide.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Duration(milliseconds: 300)
        )),
      ),
    );
  }
}


class _BottomNavButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final bool selected;
  const _BottomNavButton({
    required this.icon,
    required this.onTap,
    required this.selected,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 200
        ),
        height: 42,
        width: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: selected ? const Color(0xff861E3F) : Colors.transparent
        ),
        child: Center(
          child: Icon(
            icon,
            color: selected ? Colors.white : const Color(0xff861E3F),
          )
        )
      ),
    );
  }
}