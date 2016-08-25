defmodule Rtex.GeometricObject.Plane do

    alias Rtex.Math.Vec3, as: Vec3

    defstruct position: {0,0,0}, normal: {0,1,0}, colour: {0, 0, 0}

    defimpl Rtex.GeometricObject, for: Rtex.GeometricObject.Plane  do
        def hit(model, ray, t_min) do
            t1 = Vec3.subtract(model.position, ray.origin) |> Vec3.dot(model.normal)
            t2 = Vec3.dot(ray.direction, model.normal)
            t = t1 / t2

            if(t > 0.1) do
                shade_rec = %Rtex.ShadeRec{
                    t: t_min,
                    normal: model.normal,
                    hit_point: Vec3.scale(t, ray.direction) |> Vec3.add(ray.origin),
                    colour: model.colour
                }
                {true, shade_rec}
            else
                {false, nil}
            end
        end
    end

end