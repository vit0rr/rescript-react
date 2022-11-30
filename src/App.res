module HtmlVideoElement = {
  @send external play: Dom.element => unit = "play"
  @send external pause: Dom.element => unit = "pause"
}

@react.component
let make = () => {
  let ref = React.useRef(Js.Nullable.null)
  let (isPlaying, setIsPlaying) = React.useState(_ => false)

  React.useEffect0(() => {
    switch ref.current->Js.Nullable.toOption {
    | None => ()
    | Some(el) => Js.log(el->HtmlVideoElement.play)
    }
    None
  })
  {Js.log(isPlaying)}
  <div>
    <button onClick={_event => setIsPlaying(_ => !isPlaying)}> {React.string("Click me")} </button>
    <video
      ref={ref->ReactDOM.Ref.domRef}
      src="https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"
    />
  </div>
}
