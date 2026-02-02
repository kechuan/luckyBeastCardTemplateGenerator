import 'dart:io';

import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/internal/const.dart';
import 'package:lucky_beast_card_template_generator/models/providers/app_model.dart';
import 'package:lucky_beast_card_template_generator/widgets/fragments/general_number_input_box.dart';
import 'package:provider/provider.dart';

class FluentExportCardPictureDialog extends StatefulWidget {
  const FluentExportCardPictureDialog({
    super.key,
    this.confirmAction,
  });

  final Future<Uint8List>? Function(Size?)? confirmAction;

  @override
  State<FluentExportCardPictureDialog> createState() => _FluentExportCardPictureDialogState();
}

class _FluentExportCardPictureDialogState extends State<FluentExportCardPictureDialog> {

    
  final outputImageWidthController = TextEditingController(text: kCardDesignSize.width.round().toString());
  final outputImageHeightController = TextEditingController(text: kCardDesignSize.height.round().toString());

  @override
  void initState() {
    outputImageWidthController.addListener((){
      outputImageHeightController.text = ("${(double.tryParse(outputImageWidthController.text) ?? 0) * 1.4}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final outputDirectoryEditingController = TextEditingController(
      text: 
      context.read<AppModel>().importDirectoryPath ?? (Directory('').absolute.path).toString()
    );




    ValueNotifier<bool> customSizeNotifier = ValueNotifier(false);

    return ContentDialog(
      title: Text(t.outputPanel.name),
      content: SizedBox(
        height: 150,
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //Path
            Text(t.outputPanel.outputPath, style: TextStyle(color: FluentTheme.of(context).inactiveColor),),

            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: TextBox(
                    controller: outputDirectoryEditingController,
                    readOnly: true,

                  ),
                ),

                Button(
                  child: const Text('...'),
                  onPressed: () async {

                    final directoryPicker = DirectoryPicker().getDirectory();

                    if (directoryPicker != null) {
                      outputDirectoryEditingController.text = directoryPicker.path;
                      context.read<AppModel>().importDirectoryPath = directoryPicker.path;
                      debugPrint(outputDirectoryEditingController.text);
                    }

                  },
                )
              ],
            ),

            //Size
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(t.outputPanel.recommendImageScale, style: TextStyle(color: FluentTheme.of(context).inactiveColor),),

                Row(

                  children: [
                    SizedBox(
                      width: 70,
                      child: Center(child: Text('1x ${t.outputPanel.width}'))
                    ),
                    SizedBox(
                      width: 70,
                      child: Center(child: Text('1.4x ${t.outputPanel.height}'))
                    ),
                  ],
                )
              ],
            ),

            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    spacing: 6,
                    children: [
                      Text(t.outputPanel.customSize),

                      ValueListenableBuilder(
                        valueListenable: customSizeNotifier,
                        builder: (_, status, _) {
                          return ToggleSwitch(
                            checked: status,
                            onChanged: (value) => customSizeNotifier.value = value,
                          );
                        }
                      ),
                    ],
                  ),

                  ValueListenableBuilder(
                    valueListenable: customSizeNotifier,
                    builder: (_, status, _) {
                      return Row(
                        children: [

                          SizedBox(
                            width: 60,
                            child: GeneralNumberInputBox(
                              textEditingController: outputImageWidthController,
                              inputFormatter:[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              enabled: status,
                            ),
                          ),

                          const Text("X"),

                          SizedBox(
                            width: 60,
                            child: GeneralNumberInputBox(
                              textEditingController: outputImageHeightController,
                              inputFormatter:[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              enabled: status,
                            ),
                          ),

                        ],
                      );
                    }
                  ),

                ],
              ),
              
            ),

            
          ],
        ),
      ),
      actions: [
        Button(
          child: Text(t.outputPanel.cancel),
          onPressed: () => Navigator.of(context).pop(),
        ),

        FilledButton(
          onPressed: () {

            if (outputDirectoryEditingController.text.isEmpty) return;

            Navigator.of(context).pop(
              (
              widget.confirmAction?.call(
                customSizeNotifier.value ?
                  Size(
                    double.tryParse(outputImageWidthController.text) ?? 0,
                    double.tryParse(outputImageHeightController.text) ?? 0
                  ) : null
              ),
              outputDirectoryEditingController.text
              )

            );

          },
          child: Text(
        	    t.outputPanel.ok,
            	style: TextStyle(color: FluentTheme.of(context).accentColor.basedOnLuminance())
          ),
        ),
      ],
    );
  }
}
