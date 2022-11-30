let root = ReactDOM.querySelector("#root")

switch root {
| None => Js.log("Root element not found! ;(")
| Some(element) => ReactDOM.render(<App />, element)
}
