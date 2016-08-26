defmodule Rtex.Material.Matte do
    defstruct colour: {0, 0, 0}, ka: 0.0, kd: 0.0 

    alias Rtex.Material.Matte, as: Matte
    alias Rtex.Math.Vec3, as: Vec3

    defimpl Rtex.Material, for: Rtex.Material.Matte do
        def shade(matte, shade_rec, ambient, lights) do
            wo = Vec3.scale(-1, shade_rec.ray.direction)

            l = Matte.calculate_ambient_light(ambient, matte, shade_rec)
            
            IO.inspect l
            Matte.calculate_directional_lights(lights, matte, shade_rec, l)
            
            
        end
    end

    def calculate_ambient_light(light, matte, shade_rec) do
        Rtex.BRDF.Lambertian.rho(matte.kd, matte.colour)
            |> Vec3.scale(Rtex.Light.light(light, shade_rec))       
    end

    def calculate_directional_lights([head|tail], matte, shade_rec, l) do
        ndotwi = shade_rec.normal
                    |> Vec3.dot(Rtex.Light.get_direction(head, shade_rec))

        if ndotwi > 0.0 do
            f = Rtex.BRDF.Lambertian.f(matte.kd, matte.colour)
            l2 = Rtex.Light.light(head, shade_rec)
            final = f |> Vec3.dot(l2) |> Vec3.scale(ndotwi)
            new_l = l |> Vec3.add(final)
            calculate_directional_lights(tail, matte, shade_rec, new_l)
        else
            calculate_directional_lights(tail, matte, shade_rec, l)
        end
    end

    def calculate_directional_lights([], matte, shade_rec, l) do
        l
    end

end