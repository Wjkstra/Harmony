import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';

@Component
struct swip{
  build() {
    Swiper(){
      Text('0')
        .width('90%')
        .height('95%')
        .backgroundColor(Color.Red)
        .textAlign(TextAlign.Center)
        .fontSize(30)

      Text('1')
        .width('90%')
        .height('95%')
        .backgroundColor(Color.Green)
        .textAlign(TextAlign.Center)
        .fontSize(30)

      Text('2')
        .width('90%')
        .height('95%')
        .backgroundColor(Color.Yellow)
        .textAlign(TextAlign.Center)
        .fontSize(30)

      Text('3')
        .width('90%')
        .height('95%')
        .backgroundColor(Color.Blue)
        .textAlign(TextAlign.Center)
        .fontSize(30)
    }
    .loop(true)
    .autoPlay(true)
    .interval(1000)
  }
}



@Entry
@Component
export struct Home{
  build() {
    Column(){
      swip().height('30%');
      Text('this.message')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          hilog.info(0x0000, 'testTag', 'Test NAPI 2 + 3 = %{public}d', testNapi.add(2, 3));
        })
      List(){

      }
    }
    .width('100%')
    .height('100%')
  }
}