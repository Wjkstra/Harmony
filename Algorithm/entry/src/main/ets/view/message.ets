import { util } from '@kit.ArkTS'

class Contact{
  key:string = util.generateRandomUUID(true);
  messages:string;
  icon:Resource;

  constructor(messages:string,icon:Resource) {
    this.messages = messages;
    this.icon = icon;
  }
}
class DividerTmp{
  strokeWidth:Length = 1;
  startMargin:Length = 60;
  endMargin: Length = 10
  color: ResourceColor = '#ffe9f0f0'

  constructor(strokeWidth: Length, startMargin: Length, endMargin: Length, color: ResourceColor) {
    this.strokeWidth = strokeWidth
    this.startMargin = startMargin
    this.endMargin = endMargin
    this.color = color
  }
}

@Entry
@Component
export struct  message{
  @State egDivider: DividerTmp = new DividerTmp(1, 60, 10, '#ffe9f0f0')

  private contacts:Array<object> = [
    new Contact('1',$r('app.media.app_icon')),
    new Contact('2',$r('app.media.startIcon')),
  ]
  build() {
    List({space:10}){
      ForEach(this.contacts,(item:Contact) =>{
        ListItem(){
          Row() {
            Image(item.icon)
              .width(40)
              .height(40)
              .margin(10)
            Text(item.messages)
              .fontSize(20)
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
        }
      },(item:Contact) => JSON.stringify(item))
    }
    .width('100%')
    .backgroundColor('#FFF1F3F5')
    .alignListItem(ListItemAlign.Center)
    .divider(this.egDivider)
    .scrollBar(BarState.Auto)

  }
}