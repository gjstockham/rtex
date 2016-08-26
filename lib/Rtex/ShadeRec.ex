defmodule Rtex.ShadeRec do
    @moduledoc """
    Details of a ray that hits an object
    """

    defstruct(
        hit_point: nil, 
        normal: nil, 
        material: nil, 
        ray: nil,
        depth: 0,
        t: 0.0
        )
    
end