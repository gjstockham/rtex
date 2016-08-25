defmodule Rtex.GeometricObject.Plane do
    @k_epsilon 1.0

    defstruct position: {0,0,0}, normal: {0,1,0}

    defimpl Rtex.GeometricObject, for: Rtex.GeometricObject.Plane  do
        def hit(model, ray, t_min) do
            
        end
    end

end