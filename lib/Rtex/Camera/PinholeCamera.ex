defmodule Rtex.Camera.PinholeCamera do
    @moduledoc """
    Basic camera
    """
    alias Rtex.Math.Vec3, as: Vec3
   
    defstruct origin: {0, 0, 0}, lower_left: {-1, -1, 1}, horizontal: {1, 0, 0}, vertical: {0, 1, 0}, width: 200, height: 100

    def create(position, look_at, x, y) do
        up = {0, 1, 0}
        aspect = x / y
        theta = 20 * (:math.pi / 180)
        half_height = :math.tan(theta / 2)
        half_width = aspect * half_height
        w = position |> Vec3.subtract(look_at) |> Vec3.unit
        u = up |> Vec3.cross(w) |> Vec3.unit
        v = Vec3.cross(w, u)
        ll = position 
                |> Vec3.subtract(Vec3.scale(half_width, u))
                |> Vec3.subtract(Vec3.scale(half_height, v))
                |> Vec3.subtract(w)
        %Rtex.Camera.PinholeCamera{
            origin: position,
            lower_left: ll,
            horizontal: Vec3.scale(2 * half_width, u),
            vertical: Vec3.scale(2 * half_height, v)
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