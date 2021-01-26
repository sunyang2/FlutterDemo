import 'package:flutter/material.dart';
import 'package:myapp/widget/myIcons.dart';

/*
图片
Flutter通过Image组件来加载并显示图片，Image的数据源可以是asset、文件、内存以及网络。

ImageProvider
ImageProvider 是一个抽象类，主要定义了图片数据获取的接口load()，从不同的数据源获取图片需要实现不同的ImageProvider ，
如AssetImage是实现了从Asset中加载图片的ImageProvider，而NetworkImage实现了从网络加载图片的ImageProvider。

Image
Image widget有一个必选的image参数，它对应一个ImageProvider。下面我们分别演示一下如何从asset和网络加载图片。

fit：该属性用于在图片的显示空间和图片本身大小不同时指定图片的适应模式。适应模式是在BoxFit中定义，它是一个枚举类型，有如下值：

fill：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。
cover：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。
contain：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。
fitWidth：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
fitHeight：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
none：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。

color和 colorBlendMode：在图片绘制时可以对每一个像素进行颜色混合处理，color指定混合色，而colorBlendMode指定混合模式
repeat：当图片本身大小小于显示空间时，指定图片的重复规则
*/
class ImgPage extends StatefulWidget {
  @override
  _ImgPageState createState() => _ImgPageState();
}

class _ImgPageState extends State<ImgPage> {
  @override
  Widget build(BuildContext context) {
    String icons = "";
    // accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
    // error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
    // fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";

    return Column(
      children: [
        Image(
          image: AssetImage('assets/images/2.jpeg'),
          //fit: BoxFit.fill, //用于在图片的显示空间和图片本身大小不同时指定图片的适应模式
          width: 100.0,
          height: 200.0,
          //color: Colors.blue,// color和 colorBlendMode：在图片绘制时可以对每一个像素进行颜色混合处理，color指定混合色，而colorBlendMode指定混合模式
          //colorBlendMode: BlendMode.difference,
          repeat: ImageRepeat.repeatY, //当图片本身大小小于显示空间时，指定图片的重复规则
        ),
        Text('data'),
        Image.asset(
          'assets/images/2.jpeg',
          width: 200,
        ),
        Image.network(
          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
          width: 100.0,
        ),
        Text(
          icons,
          style: TextStyle(
            color: Colors.green,
            fontSize: 24.0,
            fontFamily: 'MaterialIcons',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.accessible,
              color: Colors.green,
            ),
            Icon(
              Icons.error,
              color: Colors.green,
            ),
            Icon(
              Icons.fingerprint,
              color: Colors.green,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              MyIcons.book,
              color: Colors.purple,
            ),
            Icon(
              MyIcons.wechat,
              color: Colors.green,
            ),
          ],
        )
      ],
    );
  }
}
