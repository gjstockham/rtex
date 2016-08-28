defmodule Rtex.Renderer do
  @moduledoc """
  Base module for all renderers
  """

  def render(scene) do
    scene
      |> generate_pixels
      |> generate_colour
  end

  def generate_pixels(scene) do
    nx = scene.viewplane.columns
    ny = scene.viewplane.rows
    Enum.map(0..(nx-1), fn(x) -> Enum.map(0..(ny-1), fn(y) -> {x, y} end) end)
  end

  def generate_colour([head|tail]) do
    trace_ray(head)
    generate_colour(tail)
  end

  def generate_colour([]) do
    IO.puts "Finished generating colours"
  end

  def trace_ray({x, y}) do
    {x, y, {0.1, 0.2, 0.3}}
  end
end