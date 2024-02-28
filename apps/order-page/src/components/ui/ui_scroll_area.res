module ScrollArea = {
  @module("./scroll-area")
  @react.component
  external make: (
    ~children: React.element=?,
    ~className: string=?,
    ~ref: React.element=?
  ) => React.element = "ScrollArea"
}

module ScrollBar = {
  @module("./scroll-area")
  @react.component
  external make: (
    ~children: React.element=?,
    ~className: string=?,
    ~orientation: string=?
  ) => React.element = "ScrollBar"
}

