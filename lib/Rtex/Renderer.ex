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
    u = col / nx
    v = row / ny
    direction = scene.camera.lower_left_corner
        |> Rtex.Math.Vec3.add(Rtex.Math.Vec3.scale(u, scene.camera.horizontal))
        |> Rtex.Math.Vec3.add(Rtex.Math.Vec3.scale(v, scene.camera.vertical))
    ray = Rtex.Ray.create(scene.camera.position, direction)
    colour = get_colour(scene, ray)
    {col, row, colour}
  end

  def get_colour(scene, ray) do
    {x, y, z} = Rtex.Math.Vec3.unit(ray.direction)
    t = 0.5 * (y + 1)
    {1.0, 1.0, 1.0}
      |> Rtex.Math.Vec3.scale(1.0 - t)
      |> Rtex.Math.Vec3.add(Rtex.Math.Vec3.scale({0.5, 0.7, 1.0}, t))
  end
end