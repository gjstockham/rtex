defmodule Rtex.GeometricObject.Sphere do

    alias Rtex.Math.Vec3, as: Vec3

    defstruct origin: nil, radius: 1

    defimpl Rtex.GeometricObject, for: Rtex.GeometricObject.Sphere  do
      def intersect(model, ray) do
          oc = Vec3.subtract(ray.origin, model.origin)
          #a = Vec3.dot(ray.direction, ray.direction)
          b = 2 * Vec3.dot(ray.direction, oc)
          c = Vec3.dot(oc,oc) - (model.radius*model.radius)
          discriminant = (b*b) - (4*c)
          IO.inspect discriminant
          if discriminant > 0 do
              1
          else
              1000000
          end
      end
    end
end