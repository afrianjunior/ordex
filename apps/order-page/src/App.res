module HeadContent = {
  @react.component
  let make = (~children: React.element, ~id, ~withSearch=?) => {
    <div className="sticky top-[-1px] pt-3 grid grid-cols-2">
      <h2 id={id} className=" leading-relaxed scroll-m-20 text-xl font-semibold tracking-tight">
        children
      </h2>
    </div>
  }
}

module Search = {
  @react.component
  let make = () => {
    <div className="sticky top-[-1px]">
      <div className="absolute right-0 left-0 py-3 bg-white flex justify-end cursor-pointer">
        <div className="flex items-center border border-gray-100 rounded w-28 p-1 px-3 text-xs">
          <Icon.MagnifyingGlassIcon className="w-4 h-4 mr-1" />
          <span>
            {"Search"->React.string}
          </span>
        </div>
      </div>
    </div>
  }
}

type cardOrientation = 
  | Vertical
  | Horizontal

type flag =
  | @as("recommended")Recommended
  | @as("spicy")Spicy
  | @as("new")New
  | @as("best-seller")BestSeller
  | @as("kids-friendly")KidsFriendly
  | @as("")None

type price = {
  value: float,
  currency: string
}
type item = {
  title: string,
  description: string,
  image: string,
  price: price,
  flag: array<flag>
}

module CardVertical = {
  @react.component
  let make = (~data) => {
    <div>
      <div className="rounded-md h-52 w-full bg-cover bg-center" style={{backgroundImage: "url(" ++ data.image ++ ")"}} />
      <h4 className="leading-10 font-bold">
        {data.title->React.string}
      </h4>
      <div className="leading-6 font-bold">
        <span>
          {data.price.value->React.float}
        </span>
        <span className="pl-1">
          {data.price.currency->React.string}
        </span>
      </div>
      <div className="mt-4">
        <UI.Button variant={UI.Button.Outline} className="w-full border border-gray-400">{"Add"->React.string}</UI.Button>
      </div>
    </div>
  }
}

module CardHorizontal = {
  @react.component
  let make = (~data) => {
    <div>
      <div className="grid grid-cols-3 gap-6">
        <div className="col-span-2">
          <h4 className="leading-10 font-bold">
            {data.title->React.string}
          </h4>
          <p className="leading-7 text-sm text-zinc-400">
            {data.description->React.string}
          </p>

        </div>
        <div>
          <div className="rounded-md h-32 w-full bg-cover bg-center" style={{backgroundImage: "url(" ++ data.image ++ ")"}} />

        </div>
      </div>
      <div className="grid grid-cols-3 gap-6">
        <div className="col-span-1">
          <div className="leading-6 font-bold mt-3">
            <span>
              {data.price.value->React.float}
            </span>
            <span className="pl-1">
              {data.price.currency->React.string}
            </span>
          </div>
        </div>

        <div className="col-span-1 col-start-3">
          <div className="mt-4">
            <UI.Button variant={UI.Button.Outline} className="w-full border border-gray-400">{"Add"->React.string}</UI.Button>
          </div>
        </div>
      </div>
    </div>
  }
}


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
      <UI.ScrollArea className="whitespace-nowrap">
        <div className="flex w-max space-x-4 snap-x snap-mandatory scroll-px-2">
          {Belt.Array.map(categories, (category) => {
            let aditionalClassName = switch selected {
              | Some(n) => n == category ? " bg-primary text-primary-foreground" : ""
              | None => ""
            }
            <li key={category} className="inline-block snap-always snap-start py-2"> 
              <UI.Button variant={UI.Button.Outline} className={"text-xs border p-0 px-4 leading-1" ++ aditionalClassName}>
                {category->React.string}
              </UI.Button>
            </li>
          })->React.array}
        </div>
        <UI.ScrollBar orientation="horizontal" />
      </UI.ScrollArea>
    </div>
  }
}

module Recommendation = {
  @react.component
  let make = (~withSearch=?) => {
    <div>
      <HeadContent id="recommendation" ?withSearch>
        {"Recommendation"->React.string}
      </HeadContent>
      <div className="grid grid-cols-2 gap-5 mt-3">
        <CardVertical data={{
          title: "Beef Rendang",
          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
          image: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
          flag: [Recommended],
          price: {
            value: 25000.0,
            currency: "IDR"
          }
        }} />
        <CardVertical data={{
          title: "Double Cheeseburger",
          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
          image: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
          flag: [],
          price: {
            value: 35000.0,
            currency: "IDR"
          }
        }} />       
      </div>
    </div>
  }
}

module Section = {
  @react.component
  let make = (~title, ~withSearch=?) => {
    <div className="my-5">
      <HeadContent id={title} ?withSearch>
        {title->React.string}
      </HeadContent>
      <div className="grid gap-7 mt-3">
        <CardHorizontal data={{
          title: "Beef Rendang",
          description: "Slow-cooked Indonesian beef in coconut milk, infused with aromatic spices, tender, rich, and flavorful.",
          image: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
          flag: [],
          price: {
            value: 35000.0,
            currency: "IDR"
          }
        }} />       
        <CardHorizontal data={{
          title: "Tandoori Chicken",
          description: "Indian dish of marinated chicken roasted in a clay oven, tender, smoky, flavorful.",
          image: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
          flag: [],
          price: {
            value: 35000.0,
            currency: "IDR"
          }
        }} />       

        <CardHorizontal data={{
          title: "Banh Xeo",
          description: "Vietnamese savory crepe filled with shrimp, pork, bean sprouts; crispy, flavorful, served with herbs.",
          image: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
          flag: [],
          price: {
            value: 35000.0,
            currency: "IDR"
          }
        }} />       
      </div>
   </div>
  }
}

@react.component
let make = () => {
  <div className="">
    <div className="relative font-plus-jakarta max-w-[450px] m-auto">
      <div className="text-center my-8">
        <span className="text-3xl font-bold block mb-1">
          {"Imperial Kitchen"->React.string}
        </span>
        <span className="block text-xs">
          {"Dimsum masters"->React.string}
        </span>
      </div>

      <Notif title="Welcome" description="Hi there! How are you? I hope you're doing great. Just to let you know, we offer a variety of foods and drinks from different regions. Hope you enjoy them! 🥰" />
      
      <Categories categories={categories} selected={Some("All")} />
      
      <Search />
      <Recommendation withSearch={true} />

      <Section title="Asian" />
      <Section title="Western" />

    </div>
  </div>

}
