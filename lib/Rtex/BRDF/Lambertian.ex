defmodule Rtex.BRDF.Lambertian do
          
    def rho(kd, colour) do
        colour |> Rtex.Math.Vec3.scale(kd)    
    end
    
    def f(kd, colour) do
        colour |> Rtex.Math.Vec3.scale(kd) |> Rtex.Math.Vec3.scale(1 / :math.pi)
    end
end