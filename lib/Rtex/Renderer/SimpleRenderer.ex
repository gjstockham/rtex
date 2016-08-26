defmodule Rtex.Renderer.SimpleRenderer do
    @moduledoc """
    Simple, seqential renderer
    """        

    def render(scene, sampler) do
        vp = scene.viewplane
        zw = 100
        n = round(:math.sqrt(vp.num_samples))

        for r <- 0..(vp.rows - 1),
            c <- 0..(vp.columns -  1) do

            base_colour = {0, 0, 0}

            samples = sampler.generate_samples(vp.num_samples)
            
            colour = trace_sampled_ray(samples, r, c, scene, vp, zw, base_colour)
            {r, c, colour}
        end
    end

    def trace_sampled_ray([head|tail], r, c, scene, vp, zw, colour) do
        
        {x, y} = head
        
        #IO.puts "Calculating #{p} and #{q} of #{max}"
        ppx = vp.pixel_size * (c - 0.5 * vp.columns + x)
        ppy = vp.pixel_size * (r - 0.5 * vp.rows + y)

        ray = %Rtex.Ray{direction: {0, 0, -1}, origin: {ppx, ppy, zw}}
        ray_colour = trace_ray(scene, ray)
        accumulated_colour = Rtex.Math.Vec3.add(ray_colour, colour)

        trace_sampled_ray(tail, r, c, scene, vp, zw, accumulated_colour)
    end

    def trace_sampled_ray([], r, c, scene, vp, zw, colour) do
        Rtex.Math.Vec3.scale(colour, vp.num_samples)
    end

    def trace_ray(scene, ray) do
        case Rtex.Scene.hit(scene, ray) do
            {true, shade_rec} -> Rtex.Material.shade(shade_rec.material, shade_rec, scene.ambient, scene.lights)
            {false, _} -> scene.background_colour
        end
    end

end