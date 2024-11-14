import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';
import {tab_index} from '../viewModel/ResponseData';
import { router } from '@kit.ArkUI';
import { Home } from '../view/home';
import { user } from '../view/user'
import { message } from '../view/message'
@Component
struct MyComponent2 {
  build() {
    Button(`Hello World`)
  }
}

@Entry
@Component
struct Index {
  @State isShow: boolean = false; //默认不显示
  @State curTabIndex: number =0;
  tab_index: tab_index = router.getParams() as tab_index;

  async aboutToAppear(){
    console.log(this.tab_index.id.toString())
    if(this.tab_index !== undefined) this.curTabIndex = this.tab_index.id
  }

  build() {
    Row() {
      Column() {

        Tabs({ barPosition: this.curTabIndex, index: this.curTabIndex }){

          TabContent(){
            Home();
          }.tabBar(this.barItem(0,"首页",$rawfile('bar/home.svg')));

          TabContent(){
            message()
          }.tabBar(this.barItem(1,"消息",$rawfile('bar/message.svg')));

          TabContent(){
            user();

          }.tabBar(this.barItem(2,"我的",$rawfile('bar/user.svg')));
        }.barPosition(BarPosition.End)
        .scrollable(false)
        .layoutWeight(1)
        .onChange((index) => this.curTabIndex = index)

      }
      .width('100%')
    }
    .height('100%')
  }


  @Builder
  barItem(index:number,title:string,icon:Resource){
    Column(){
      Image(icon)
        .width(23).fillColor(this.curTabIndex === index ? Color.Red : Color.Black)
      Text(title)
        .fontSize(13).width(40).textAlign(TextAlign.Center)
        .fontColor(this.curTabIndex === index ? Color.Red : Color.Black)
    }
  }
}
