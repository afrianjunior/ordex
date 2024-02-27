module Notif = {
  @react.component
  let make = (~title, ~description) => {
    <div className="bg-slate-100 rounded-lg p-4 mb-5">
      <h4 className="font-bold">
        {title->React.string}
      </h4>
      <p className="leading-6 [&:not(:first-child)]:mt-2 text-sm">
        {description->React.string}
      </p>
    </div>
  }
}

let categories = ["All", "Food", "Drink", "Snack", "Dessert", "Beverage", "Asian", "Western", "Vegan", "Other"];

module Categories = {
  @react.component
  let make = (~selected, ~categories) => {
    <div className="my-5">
      <div className="flex w-full space-x-4 overflow-x-auto snap-x snap-mandatory scroll-px-2">
        {Belt.Array.map(categories, (category) => {
          let aditionalClassName = switch selected {
            | Some(n) => n == category ? " bg-primary text-primary-foreground" : ""
            | None => ""
          }
          <li key={category} className="inline-block snap-always snap-start pb-2"> 
            <UI.Button variant={UI.Button.Outline} className={"text-xs border p-0 px-4 leading-1" ++ aditionalClassName}>
              {category->React.string}
            </UI.Button>
          </li>
        })->React.array}
      </div>
    </div>
  }
}

@react.component
let make = () => {
  <div className="absolute shadow-xl w-full h-screen">
    <div className="font-plus-jakarta max-w-[450px] m-auto overflow-x-hidden">
      <UI.Meteors number={28} />
      <div className="text-center my-8">
        <span className="text-3xl font-bold block mb-1">
          {"Imperial Kitchen"->React.string}
        </span>
        <span className="block text-xs">
          {"Dimsum masters"->React.string}
        </span>
      </div>

      <Notif title="Welcome" description="Hi there! How are you? I hope you're doing great. Just to let you know, we offer a variety of foods and drinks from different regions. Hope you enjoy them! 🥰" />
      
      <UI.Input placeholder="Macarroni" />

      <Categories categories={categories} selected={Some("All")} />
    </div>
  </div>

}
