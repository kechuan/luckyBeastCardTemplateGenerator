// 1. 定义一个统一的 Body 包装器
import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:lucky_beast_card_template_generator/widgets/views/fluent_card_prop_view.dart';
import 'package:lucky_beast_card_template_generator/widgets/views/picture_preview_view.dart';
import 'package:provider/provider.dart';


class MainThreeColumnBody extends StatelessWidget {

  const MainThreeColumnBody({
    super.key,
    required this.currentItem,
  });

  final NavItem currentItem;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CardModel(),
      
      child: ColoredBox(
        color: Colors.orange.lighter,
        child: Row(
          children: [
            // --- 中间预览区：它在 Row 里是静态的，不会因为 currentItem 改变而触发页面动画 ---
            Flexible(
              flex: 3,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 200,
                  minHeight: 200
                ),
                child: const PicturePreviewView()
              )  
            ),
        
            // --- 右侧调整区：我们在这里局部处理动画 ---
            SizedBox(
              width: 350,
              child: SlideInEntry(
                child: buildAdjustPanel(currentItem)
              ),
            ),
          ],
        ),
      ),
    );
  }


}


// 把这个组件包裹在你的 adjustmentPanel 外面
class SlideInEntry extends StatefulWidget {
  final Widget child;
  const SlideInEntry({super.key, required this.child});

  @override
  State<SlideInEntry> createState() => _SlideInEntryState();
}

class _SlideInEntryState extends State<SlideInEntry> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350), // 动画时长
      vsync: this,
    );

    // 设置从右侧一点点滑入的效果
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.1, 0.0), 
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutQuad));

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.forward(); // 只要组件一创建，自动播放动画
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _offsetAnimation,
        child: widget.child,
      ),
    );
  }
}


Widget buildAdjustPanel(NavItem item) {
  return switch (item) {
    NavItem.picture => Container(color: Colors.blue),
    NavItem.palette => FluentCardPropView()
  };
}