@module("./scroll-area") @scope("ScrollArea")

external make: React.component<((
  ~children: React.element=?,
  ~className: string=?
) => (
  ~children: React.element=?,
  ~className: string=?
) => React.element)> = "ScrollArea"

