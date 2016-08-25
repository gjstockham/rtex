defmodule Rtex.ShadeRec do
    defstruct(
        hit_point: nil, 
        normal: nil, 
        material: nil, 
        ray: nil,
        depth: 0,
        t: 0.0)
    
end