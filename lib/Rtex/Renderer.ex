defmodule Rtex.Renderer do

  def render(scene, opts \\ []) do
    {renderer, opts} = Keyword.pop(opts, :renderer, nil)
    renderer.render(scene)
  end
end