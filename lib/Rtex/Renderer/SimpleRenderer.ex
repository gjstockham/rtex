defmodule Rtex.Renderer.SimpleRenderer do
            
    def render(scene) do
        

        for j <- (scene.camera.height-1)..0,
            i <- 0..(scene.camera.width-1) do

            ray = Rtex.Camera.get_ray(scene.camera, i, j)        

            trace_ray(scene, ray)
        end
    end

    def trace_ray(scene, ray) do
        Rtex.Hit.hit(scene, ray)
    end

end