defmodule Rtex.Renderer do
  @moduledoc """
  Base module for all renderers
  """

  def render(scene) do
    scene
      |> render_pixels
      |> List.flatten
  end

  def render_pixels(scene) do
    nx = scene.viewplane.columns
    ny = scene.viewplane.rows
    for row <- (ny - 1)..0 do
      for col <- 0..(nx - 1) do
        render_pixel(row, col, scene)
      end
    end
  end

  def render_pixel(row, col, scene) do
    nx = scene.viewplane.columns
    ny = scene.viewplane.rows
    {col, row, {col / nx, row / ny, 0.2}}
  end
end