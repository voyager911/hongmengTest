import { common } from '@kit.AbilityKit';
import { buffer } from '@kit.ArkTS';
import { fileIo, ReadOptions } from '@kit.CoreFileKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { EmptyCompontent,FileWrite } from 'common';

const TAG: string = '[Page_Context]';
const DOMAIN_NUMBER: number = 0xFF00;

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  private context = getContext(this) as common.UIAbilityContext;

  build() {
    Column() {
      // EmptyCompontent();
      FileWrite();
      Text(this.message)
        .id('HelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          this.message = 'Welcome';
        })
    }
    .height('100%')
    .width('100%')
  }
}