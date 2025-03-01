@Component
@Preview
export struct EmptyCompontent{

  outHeight?: number | string ="100%";
  build() {
    Flex({
      justifyContent:FlexAlign.Center,
      alignItems:ItemAlign.Center,
      direction:FlexDirection.Column
    }){
      Image($r("app.media.ic_empty"))
        .width($r("app.float.empty_image_size"))
        .height($r("app.float.empty_image_size"))
      Text($r("app.string.page_text"))
        .fontSize($r("app.float.micro_font_size"))
        .margin($r("app.float.micro_font_size"))
    }.width("50%")
    .height(this.outHeight! == undefined ? this.outHeight : "100%")
  }
}