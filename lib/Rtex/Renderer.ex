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
    case hit_object(ray, scene) do
      {true, model} -> {col, row, get_colour(ray, model, scene)}
      {false, _} -> {col, row, get_background_colour(ray, scene)}
    end
   end

  def hit_object(ray, scene) do
    hit_any_object(scene.models, ray, 0.1, 1_000_000, nil)
  end

  def hit_any_object([head|tail], ray, t_min, t_max, current_nearest) do
    case Rtex.GeometricObject.hit(head, ray, t_min) do
      {true, t} -> 
        if t < t_max do
          hit_any_object(tail, ray, t_min, t, head)
        else 
          hit_any_object(tail, ray, t_min, t_max, current_nearest)
        end
      {false, _} -> 
        hit_any_object(tail, ray, t_min, t_max, current_nearest)
    end
  end

  def hit_any_object([], ray, t_min, t_max, current_nearest) do
    case current_nearest do
      nil -> {false, nil}
      _ -> {true, current_nearest}
    end
  end
  
  def get_background_colour(ray, scene) do
    {x, y, z} = Rtex.Math.Vec3.unit(ray.direction)
    t = 0.5 * (y + 1)
    {1.0, 1.0, 1.0}
      |> Rtex.Math.Vec3.scale(1.0 - t)
      |> Rtex.Math.Vec3.add(Rtex.Math.Vec3.scale({0.5, 0.7, 1.0}, t))
  end
end