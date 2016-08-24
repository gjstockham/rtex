defmodule Rtex.Renderer do
  @callback render(Rtex.Scene, Rtex.Viewport) :: nil
end