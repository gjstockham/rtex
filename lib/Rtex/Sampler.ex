defmodule Rtex.Sampler do
  @moduledoc """
  Base module for sampling rays
  """

  def generate_samples(scene, opts \\ []) do
    {renderer, opts} = Keyword.pop(opts, :renderer, nil)
    renderer.render(scene)
  end
end