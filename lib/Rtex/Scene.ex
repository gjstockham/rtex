defmodule Rtex.Scene do
    defstruct camera: nil, models: nil, lights: nil, background_colour: {0, 0, 0}, viewplane: nil

    def hit(scene, ray) do
        t_min = 1000000
        
        hit_any_object(scene.models, ray, t_min, nil)   
    
    end

    def hit_any_object([head | tail], ray, t_min, current_nearest) do
        case Rtex.GeometricObject.hit(head, ray, t_min) do
            {true, shade_rec} ->
                if shade_rec.t < t_min do
                    hit_any_object(tail, ray, shade_rec.t, shade_rec)
                end
            {false, _} -> 
                hit_any_object(tail, ray, t_min, current_nearest)
        end
    end

    def hit_any_object([], ray, t_min, current_nearest) do
        if is_nil(current_nearest) do
            {false, nil}
        else
            {true, current_nearest}
        end
    end

end