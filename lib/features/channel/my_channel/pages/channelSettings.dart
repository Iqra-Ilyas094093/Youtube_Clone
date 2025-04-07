import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/provider/userDataProvider.dart';
import 'package:youtube_clone/features/channel/my_channel/repositories/updateSettings.dart';
import 'package:youtube_clone/features/channel/my_channel/widgets/edit_setting_dialog.dart';
import 'package:youtube_clone/features/channel/my_channel/widgets/setting_field_item.dart';
import 'package:youtube_clone/utilities/colors.dart';

class ChannelSettingUi extends ConsumerStatefulWidget {
  const ChannelSettingUi({super.key});

  @override
  ConsumerState<ChannelSettingUi> createState() => _ChannelSettingUiState();
}

class _ChannelSettingUiState extends ConsumerState<ChannelSettingUi> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return ref
        .watch(currentUserData)
        .when(
          data: (currentuser) {
            return Scaffold(
              body: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/flutter background.png',
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 145,
                        left: 350,
                        child: SizedBox(
                          height: 30,
                          child: Image.asset(
                            'assets/icons/camera.png',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 160,
                        top: 65,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey,
                          backgroundImage: CachedNetworkImageProvider(currentuser.profilePic),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        SettingsItem(
                          identifier: 'DisplayName',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return SettingsDialog(
                                  identifier: 'DisplayName',
                                  onSave: (name) {
                                    ref
                                        .watch(updateDataProvider)
                                        .editDisplayName(name);
                                  },
                                );
                              },
                            );
                          },
                          value: currentuser.displayName,
                        ),
                        SizedBox(height: 20,),
                        SettingsItem(
                          identifier: 'Email',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return SettingsDialog(
                                  identifier: 'Email',
                                  onSave: (email) {
                                    ref
                                        .watch(updateDataProvider)
                                        .editDisplayName(email);
                                  },
                                );
                              },
                            );
                          },
                          value: currentuser.email,
                        ),SizedBox(height: 20,),
                        SettingsItem(
                          identifier: 'Description',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return SettingsDialog(
                                  identifier: 'Description',
                                  onSave: (description) {
                                    ref
                                        .watch(updateDataProvider)
                                        .editDisplayName(description);
                                  },
                                );
                              },
                            );
                          },
                          value: currentuser.description,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Keep All my Subscriptions Private',
                                style: TextStyle(fontSize: 16),
                              ),
                              Switch(
                                activeTrackColor: Colors.orange.shade900,
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Changings you made to your name and email are only visible to youtube but not other google services',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          error: (error, stacktrace) {
            return Text(error.toString());
          },
          loading: () => Center(child: CircularProgressIndicator()),
        );
  }
}
