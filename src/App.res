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
  {Js.log(isPlaying)}
  <div>
    <button onClick={_event => setIsPlaying(_ => !isPlaying)}>
      {React.string(isPlaying ? "Pause" : "Play")}
    </button>
    <video
      ref={ref->ReactDOM.Ref.domRef}
      src="https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"
    />
  </div>
}
