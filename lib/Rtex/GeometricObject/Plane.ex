defmodule Rtex.GeometricObject.Plane do
    @moduledoc """
    Ray intersections for a plane

    """
    
    alias Rtex.Math.Vec3, as: Vec3

    defstruct position: {0,0,0}, normal: {0,1,0}, material: {0, 0, 0}

    defimpl Rtex.GeometricObject, for: Rtex.GeometricObject.Plane  do
        def hit(model, ray, t_min) do
            t1 = model.position |> Vec3.subtract(ray.origin) |> Vec3.dot(model.normal)
            t2 = Vec3.dot(ray.direction, model.normal)
            t = t1 / t2

            if t > 0.1  do
                shade_rec = %Rtex.ShadeRec{
                    t: t_min,
                    normal: model.normal,
                    hit_point: ray.direction |> Vec3.scale(t) |> Vec3.add(ray.origin),
                    material: model.material
                }
                {true, shade_rec}
            else
                {false, nil}
            end
        end
    end

end