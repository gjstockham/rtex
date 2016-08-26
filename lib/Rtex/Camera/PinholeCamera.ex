defmodule Rtex.Camera.PinholeCamera do
    @moduledoc """
    Basic camera
    """
    alias Rtex.Math.Vec3, as: Vec3
   
    defstruct position: {0, 0, 0}, look_at: {0, 0, 1}, up: {0, 1, 0}, u: nil, v: nil, w: nil

    def create(position, look_at, up, distance) do
        w = position |> Vec3.subtract(look_at) |> Vec3.unit
        u = up |> Vec3.cross(w) |> Vec3.unit
        v = w |> Vec3.cross(u)

        %Rtex.Camera.PinholeCamera{
            position: position,
            look_at: look_at,
            up: up,
            u: u,
            v: v,
            w: w
        }
    end

    defimpl Rtex.Camera, for: Rtex.Camera.PinholeCamera  do
        def get_ray(camera, u , v) do
            direction = camera.lower_left
                |> Vec3.add(Vec3.scale(u, camera.horizontal))
                |> Vec3.add(Vec3.scale(v, camera.vertical))
                |> Vec3.subtract(camera.origin)
            %Rtex.Ray{
                origin: camera.origin,
                direction: direction
            }
        end
    end
 end