defmodule Rtex.Light.AmbientLight do
    defstruct radiance: 1.0, colour: {1, 1, 1}

    defimpl Rtex.Light, for: Rtex.Light.AmbientLight do
        def get_direction(ambient, shade_rec) do
            {0, 0, 0}
        end

        def light(ambient, shade_rec) do
            Rtex.Math.Vec3.scale(ambient.colour, ambient.radiance)
        end
    end
end