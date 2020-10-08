import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:init_project/providers/theme_provider.dart';
import 'package:init_project/ui/common_widgets/text_demo.dart';
import 'package:init_project/ui/profile/child_widgets/general_info_page.dart';
import 'package:init_project/ui/profile/child_widgets/profile_details.dart';
import 'package:init_project/ui/profile/child_widgets/profile_orders.dart';
import 'package:init_project/ui/profile/child_widgets/profile_settings.dart';
import 'package:init_project/ui/profile/widgets/general_info.dart';
import 'package:init_project/ui/profile/widgets/logout_btn.dart';
import 'package:init_project/ui/profile/widgets/personal_details.dart';
import 'package:init_project/ui/profile/widgets/pic_builder.dart';
import 'package:init_project/utils/constants.dart';
import 'package:init_project/utils/size_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
/* 
class ProfileRoot extends StatefulWidget {
  @override
  _ProfileRootState createState() => _ProfileRootState();
}

class _ProfileRootState extends State<ProfileRoot> {
  static bool _switchOn = false;
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Switch(
            value: themeChange.darkTheme,
            onChanged: (val) {
              setState(() {
                themeChange.darkTheme = val;
                _switchOn = !_switchOn;
              });
            }),
      ),
      body: Container(
        child: TextDemo(),
      ),
    );
  }
} */

class ProfileRoot extends StatefulWidget {
  @override
  _ProfileRootState createState() => _ProfileRootState();
}

class _ProfileRootState extends State<ProfileRoot> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile', style: Theme.of(context).textTheme.subtitle1),
          centerTitle: true,
        ),
        body: Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PicBuilder(
                  mUser: 'sd',
                ),
                PersonDetailsBuilder(
                  icon: MdiIcons.mapMarker,
                  title: 'Orders',
                  subTitle: 'check your order status',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProfileOrders(),
                      ),
                    );
                  },
                ),
                PersonDetailsBuilder(
                  icon: MdiIcons.fileDocumentEditOutline,
                  title: 'Profile details',
                  subTitle: 'Change your profile details & password',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProfileDetails(),
                      ),
                    );
                  },
                ),
                PersonDetailsBuilder(
                  icon: MdiIcons.accountCogOutline,
                  title: 'Settings',
                  subTitle: 'Manage notifications & app settings',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProfileSettings(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                GeneralInfo(
                    title: 'FAQ',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GeneralInfoPage(
                            title: 'FAQ',
                            contents: 'FAQ',
                          ),
                        ),
                      );
                    }),
                GeneralInfo(
                    title: 'ABOUT US',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GeneralInfoPage(
                            title: 'ABOUT US',
                            contents: 'ABOUT US',
                          ),
                        ),
                      );
                    }),
                GeneralInfo(
                    title: 'TERMS OF USE',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GeneralInfoPage(
                            title: 'TERMS OF USE',
                            contents: 'TERMS OF USE',
                          ),
                        ),
                      );
                    }),
                GeneralInfo(
                    title: 'PRIVACY POLICY',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GeneralInfoPage(
                            title: 'PRIVACY POLICY',
                            contents: 'PRIVACY POLICY',
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: 25,
                ),
                LogoutBtn(),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _personalDetails(IconData icon, String title, String subTitle) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 25,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    subTitle,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
