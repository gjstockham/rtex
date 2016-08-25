defmodule Rtex.GeometricObject.Sphere do
    @k_epsilon 0.1

    alias Rtex.Math.Vec3, as: Vec3

    defstruct centre: nil, radius: 1

    defimpl Rtex.GeometricObject, for: Rtex.GeometricObject.Sphere  do
      def hit(model, ray, t_min) do
          temp = Vec3.subtract(ray.origin, model.centre)
          a = Vec3.dot(ray.direction, ray.direction)
          b = 2.0 * Vec3.dot(temp, ray.direction)
          c = Vec3.dot(temp, temp) - (model.radius*model.radius)
          disc = (b*b) - (4*a*c)

          if disc < 0.0 do
              {false, nil}
          else
              e = :math.sqrt(disc)
              denom = 2.0 * a
              t = (-b - e) / denom  # smaller root
              if t > 0.1 do
                  shade_rec = %Rtex.ShadeRec{
                      t: t,
                      normal: Vec3.scale(ray.direction, t)
                                |> Vec3.add(temp)
                                |> Vec3.scale(1/model.radius),
                      hit_point: Vec3.scale(ray.direction, t)
                                |> Vec3.add(ray.origin),
                      colour: {1.0, 0, 0}
                  }
                  {true, shade_rec}
              else
                  t2 = (-b + e) / denom  # larger root
                  if t2 > 0.1 do
                      shade_rec = %Rtex.ShadeRec{
                        t: t2,
                        normal: Vec3.scale(ray.direction, t2)
                                |> Vec3.add(temp)
                                |> Vec3.scale(1/model.radius),
                        hit_point: Vec3.scale(ray.direction, t2)
                                |> Vec3.add(ray.origin),
                        colour: {1.0, 0, 0}
                      }
                      {true, shade_rec}     
                  else
                      {false, nil}                 
                  end
              end
          end
      end
    end
end