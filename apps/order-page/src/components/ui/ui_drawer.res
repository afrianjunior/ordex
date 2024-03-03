module Drawer = {
  @module("./drawer")
  @react.component
  external make: (
    ~children: React.element=?,
    @as("open")~isOpen: bool=?,
    ~className: string=?,
  ) => React.element = "Drawer"
}

module DrawerContent = {
  @module("./drawer")
  @react.component
  external make: (
    ~children: React.element=?,
    ~className: string=?,
  ) => React.element = "DrawerContent"
}

module DrawerHeader = {
  @module("./drawer")
  @react.component
  external make: (
    ~children: React.element=?,
    ~className: string=?,
  ) => React.element = "DrawerHeader"
}

module DrawerTitle = {
  @module("./drawer")
  @react.component
  external make: (
    ~children: React.element=?,
    ~className: string=?,
  ) => React.element = "DrawerTitle"
}

module DrawerFooter = {
  @module("./drawer")
  @react.component
  external make: (
    ~children: React.element=?,
    ~className: string=?,
  ) => React.element = "DrawerFooter"
}
