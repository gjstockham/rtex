defmodule Rtex.Scene do
    defstruct camera: nil, models: nil, lights: nil, background_colour: {0, 0, 0}

    defimpl Rtex.Hit, for: Rtex.Scene  do
       def hit(scene, ray) do
           case Rtex.Scene.closest_hit(scene, ray) do
               {_, nil} -> 
                   IO.puts "Miss"
                   scene.background_colour
               {tmin, model} -> 
                   IO.puts "Hit"
                   Rtex.Scene.colour(scene, ray, tmin, model, 50)
           end
       end
    end

    def closest_hit(scene, ray) do
        Enum.reduce(scene.models, {1000000, nil}, fn (model, current_closest = {tmin, _}) ->
            dist = Rtex.GeometricObject.intersect(model, ray)
            if dist < tmin do
                {dist, model}
            else
                current_closest
            end
        end)
    end

    def colour(scene, ray, tmin, object, depth) do
        {1, 0, 0}
    end
end