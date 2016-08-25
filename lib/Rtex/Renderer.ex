defmodule Rtex.Renderer do

  def render(scene, opts \\ []) do
    {renderer, opts} = Keyword.pop(opts, :renderer, nil)
    {sampler, opts} = Keyword.pop(opts, :sampler, Rtex.Sampler.DefaultSampler)
    renderer.render(scene, sampler)
  end
end