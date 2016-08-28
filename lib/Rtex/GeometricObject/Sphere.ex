defmodule Rtex.GeometricObject.Sphere do
    @moduledoc """
    Ray intersections for a sphere
    """

    @k_epsilon 0.1

    alias Rtex.Math.Vec3, as: Vec3

    defstruct centre: nil, radius: 1, material: {0, 0, 0}

    defimpl Rtex.GeometricObject, for: Rtex.GeometricObject.Sphere  do
      def hit(model, ray, t_min) do
          temp = Vec3.subtract(ray.origin, model.centre)
          a = Vec3.dot(ray.direction, ray.direction)
          b = 2.0 * Vec3.dot(temp, ray.direction)
          c = Vec3.dot(temp, temp) - (model.radius * model.radius)
          disc = (b * b) - (4 * a * c)

          if disc < 0.0 do
              {false, nil}
          else
              e = :math.sqrt(disc)
              denom = 2.0 * a
              t = (-b - e) / denom  # smaller root
              if t > 0.1 do
                  {true, t}
              else
                  t2 = (-b + e) / denom  # larger root
                  if t2 > 0.1 do
                      {true, t}     
                  else
                      {false, nil}                 
                  end
              end
          end
      end

      def normal(model, ray) do
          {true, t} = hit(model, ray, 0.001)
          Rtex.Ray.point_at_parameter(ray, t)
              |> Rtex.Math.Vec3.subtract(model.centre)
              |> Rtex.Math.Vec3.unit
      end
    end
end