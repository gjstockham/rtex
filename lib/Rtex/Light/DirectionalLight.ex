defmodule Rtex.Light.DirectionalLight do
    defstruct radiance: 1.0, direction: {0, 0, 0}

    defimpl Rtex.Light, for: Rtex.Light.DirectionalLight do
        def get_direction(light, shade_rec) do
            light.direction
        end

        def light(light, shade_rec) do
            Rtex.Math.Vec3.scale(light.colour, light.radiance)
        end
    end
end