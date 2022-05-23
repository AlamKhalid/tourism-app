import 'package:flutter/material.dart';
import 'package:tourism_app/misc/colors.dart';
import 'package:tourism_app/pages/detail_pages.dart';
import 'package:tourism_app/widgets/common/app_large_text.dart';
import '../../constants.dart';

class Header extends StatelessWidget {
  final String heading;
  final bool back;
  const Header({Key? key, this.heading = 'Discover', this.back = false})
      : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 0),
      // It will cover 20% of our total height
      height: 200,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: back ? 10 : 25,
              top: 30,
            ),
            height: 180,
            decoration: BoxDecoration(
              color: AppColors.headingColor1,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                if (back)
                  IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () => Navigator.of(context).pop(),
                    color: Colors.white,
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                AppLargeText(text: heading, color: Colors.white, size: 36),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: AppColors.textColor2.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search Places",
                        hintStyle: TextStyle(
                          color: AppColors.textColor1,
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            // find city and place first then call this page
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage()))
                            // otherwise if not found, show not found page, build one
                          },
                          child: Icon(
                            Icons.search,
                            color: AppColors.textColor1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
