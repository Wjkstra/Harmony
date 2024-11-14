@Component
struct mine{
  @State uid:Number = 0;
  build(){
    Row(){
      Image($rawfile('bar/user.svg')).width('30%');
      Column(){
        Text('name');
        Text(`uid:${this.uid}`);
      }
      .width('70%')
    }
    .margin(5)
  }
}

@Entry
@Component
export struct user{

  build() {
    Column(){
      mine().height('30%');

      Button('退出登录')
    }
    .width('100%')
    .height('100%')
    .margin(10)
  }
}