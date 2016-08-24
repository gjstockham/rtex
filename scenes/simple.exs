alias Rtex.Viewport, as: Viewport
alias Rtex.Scene, as: Scene
alias Rtex.Camera.PinholeCamera, as: PinholeCamera
alias Rtex.Light.AreaLight, as: AreaLight
alias Rtex.GeometricObject.Sphere, as: Sphere

scene = %Scene{
#    camera: PinholeCamera.create({0, 0, 5}, {0, 0, 0}, 200, 100),
    camera: %PinholeCamera{
        lower_left: {-2, -1, -1},
        horizontal: {4, 0, 0},
        vertical: {0, 2, 0},
        origin: {0, 0, 1}
    },
#    lights: [
#        %AreaLight{
#            position: {1000, 1000, 1000}
#        }
#    ],
    models: [
        %Sphere{
            origin: {0, 0, -1},
            radius: 0.5
        }
    ]
}

IO.inspect scene

scene
    |> Rtex.Renderer.render(renderer: Rtex.Renderer.SimpleRenderer)
    |> Rtex.Image.save("scenes/simple.ppm", 200, 100, format: Rtex.Image.Ppm)
