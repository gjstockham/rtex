defmodule Rtex.Renderer.SimpleRenderer do
            
    def render(scene) do
        vp = scene.viewplane

        for r <- 0..(vp.rows-1),
            c <- 0..(vp.columns-1) do

            x = vp.pixel_size * (c - 0.5 * (vp.columns - 1))
            y = vp.pixel_size * (r - 0.5 * (vp.rows - 1))

            ray = %Rtex.Ray{ direction: {0, 0, -1}, origin: {x, y, 100}}

            colour = trace_ray(scene, ray)
            {r, c, colour}
        end
    end

    def trace_ray(scene, ray) do
        case Rtex.Scene.hit(scene, ray) do
            {true, shade_rec} -> shade_rec.colour
            {false, _} -> scene.background_colour
        end
    end

end