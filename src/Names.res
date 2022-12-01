module Array = Js.Array2
let names = ["Vitor", "Jesse"]

let s = React.string
let map = (items, fn) =>
  items->Array.mapi((item, index) => fn(item, index->Js.Int.toString))->React.array

@react.component
let make = () => {
  <ul> {names->map((name, key) => <li key> {name->s} </li>)} </ul>
}
