module HtmlVideoElement = {
  @send external play: Dom.element => unit = "play"
  @send external pause: Dom.element => unit = "pause"
}

@react.component
let make = () => {
  let ref = React.useRef(Js.Nullable.null)
  let (isPlaying, setIsPlaying) = React.useState(_ => false)

  React.useEffect1(() => {
    switch ref.current->Js.Nullable.toOption {
    | Some(el) =>
      if isPlaying {
        HtmlVideoElement.play(el)
      } else {
        HtmlVideoElement.pause(el)
      }
    | None => ()
    }
    None
  }, [isPlaying])
  <div>
    <button onClick={_event => setIsPlaying(_ => !isPlaying)}>
      {React.string(isPlaying ? "Pause" : "Play")}
    </button>
    <video
      ref={ref->ReactDOM.Ref.domRef}
      src="../public/vinas.mp4"
    />
  </div>
}
