module Carousel = {
  @module("./carousel")
  @react.component
  external make: (
    ~children: React.element=?,
    ~className: string=?,
  ) => React.element = "Carousel"
}

module CarouselContent = {
  @module("./carousel")
  @react.component
  external make: (
    ~children: React.element=?,
    ~className: string=?,
  ) => React.element = "CarouselContent"
}

module CarouselItem = {
  @module("./carousel")
  @react.component
  external make: (
    ~children: React.element=?,
    ~className: string=?,
  ) => React.element = "CarouselItem"
}

