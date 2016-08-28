defmodule Rtex.Ray do
    @moduledoc """
    Basic description of a ray
    """

    defstruct origin: {0, 0, 0}, direction: {0, 0, 1}

    def create(origin, direction) do
        %Rtex.Ray{
            origin: origin,
            direction: direction
        }
    end

    def point_at_parameter(ray, t) do
        ray.direction
            |> Rtex.Math.Vec3.scale(t)
            |> Rtex.Math.Vec3.add(ray.origin)
    end
end