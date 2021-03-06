import 'package:flutter_snapshot/data/video.dart';

class Test {
  static List<String> suggestionsData = [
    "兔子",
    "小小酱",
    "美其",
    "爱飞的风筝",
    "奇奇小姐姐",
    "你怕是要上天",
    "我是一枚美女",
    '穆奇小姐',
    '七哥',
    '户外打野三哥'
  ];

  static List<Video> builderData() {
    Video video = Video();
    video.type = 1;
    video.id = 1000;
    video.cover =
        "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3895098953,169501593&fm=26&gp=0.jpg";
    video.heat = BigInt.from(200033);
    video.name = suggestionsData[0];
    video.avatar =
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2217843293,4133116540&fm=26&gp=0.jpg";
    video.comment = BigInt.from(2366);

    Video video1 = Video();
    video1.type = 1;
    video1.id = 2356;
    video1.cover =
        "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2491108357,3281814100&fm=11&gp=0.jpg";
    video1.heat = BigInt.from(200000);
    video1.name = suggestionsData[1];
    video1.avatar =
        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=120885951,3066589203&fm=26&gp=0.jpg";
    video1.comment = BigInt.from(3333);

    Video video2 = Video();
    video2.type = 0;
    video2.id = 1569;
    video2.cover =
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=555812620,3831885113&fm=26&gp=0.jpg";
    video2.heat = BigInt.from(192223);
    video2.name = suggestionsData[2];
    video2.avatar =
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2172740405,434701835&fm=26&gp=0.jpg";
    video2.comment = BigInt.from(4569);

    Video video3 = Video();
    video3.type = 1;
    video3.id = 5679;
    video3.cover =
        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=776837126,2325534076&fm=26&gp=0.jpg";
    video3.heat = BigInt.from(180569);
    video3.name = suggestionsData[3];
    video3.avatar =
        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1324442355,682041861&fm=26&gp=0.jpg";
    video3.comment = BigInt.from(1984);

    Video video4 = Video();
    video4.type = 0;
    video4.id = 7874;
    video4.cover =
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2994923315,4174276526&fm=26&gp=0.jpg";
    video4.heat = BigInt.from(131548);
    video4.name = suggestionsData[4];
    video4.avatar =
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2538649493,2457745144&fm=26&gp=0.jpg";
    video4.comment = BigInt.from(2706);

    Video video5 = Video();
    video5.type = 1;
    video5.id = 3658;
    video5.cover =
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3138411912,3156137241&fm=11&gp=0.jpg";
    video5.heat = BigInt.from(120649);
    video5.name = suggestionsData[5];
    video5.avatar =
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1844792999,1346519358&fm=26&gp=0.jpgg";
    video5.comment = BigInt.from(1206);

    Video video6 = Video();
    video6.type = 0;
    video6.id = 4558;
    video6.cover =
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=899896845,1310437867&fm=26&gp=0.jpg";
    video6.heat = BigInt.from(113897);
    video6.name = suggestionsData[6];
    video6.avatar =
        "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=186288547,4076508751&fm=26&gp=0.jpg";
    video6.comment = BigInt.from(4512);

    Video video7 = Video();
    video7.type = 1;
    video7.id = 4558;
    video7.cover =
        "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4114377289,3880370176&fm=26&gp=0.jpg";
    video7.heat = BigInt.from(113897);
    video7.name = suggestionsData[7];
    video7.avatar =
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=962469142,280366429&fm=26&gp=0.jpg";
    video7.comment = BigInt.from(4512);

    Video video8 = Video();
    video8.type = 0;
    video8.id = 4558;
    video8.cover =
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3953222029,947888612&fm=26&gp=0.jpg";
    video8.heat = BigInt.from(113897);
    video8.name = suggestionsData[8];
    video8.avatar =
        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4166075336,1763852342&fm=26&gp=0.jpg";
    video8.comment = BigInt.from(4512);

    Video video9 = Video();
    video9.type = 1;
    video9.id = 4558;
    video9.cover =
        "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2932673674,561535137&fm=27&gp=0.jpg";
    video9.heat = BigInt.from(113897);
    video9.name = suggestionsData[9];
    video9.avatar =
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2172740405,434701835&fm=26&gp=0.jpg";
    video9.comment = BigInt.from(4512);

    return [
      video,
      video1,
      video2,
      video3,
      video4,
      video5,
      video6,
      video7,
      video8,
      video9,
      video,
      video1,
      video2,
      video3,
      video4,
      video5,
      video6,
      video7,
      video8,
      video9,
    ];
  }
}
