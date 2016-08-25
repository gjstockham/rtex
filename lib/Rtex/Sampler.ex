defmodule Rtex.Sampler do

  def generate_samples(scene, opts \\ []) do
    {renderer, opts} = Keyword.pop(opts, :renderer, nil)
    renderer.render(scene)
  end
end