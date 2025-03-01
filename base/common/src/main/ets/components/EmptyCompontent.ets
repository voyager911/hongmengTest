@Component
@Preview
export struct EmptyCompontent{

  build() {
    Flex({
      justifyContent:FlexAlign.Center,
      alignItems:ItemAlign.Center,
      direction:FlexDirection.Column
    })
  }
}