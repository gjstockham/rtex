alias Rtex.ViewPlane, as: ViewPlane
alias Rtex.Scene, as: Scene
alias Rtex.Camera.PinholeCamera, as: PinholeCamera
alias Rtex.Light.AreaLight, as: AreaLight
alias Rtex.GeometricObject.Sphere, as: Sphere

scene = %Scene{
    viewplane: %ViewPlane{ rows: 200, columns: 200 },
    models: [
        %Sphere{
            centre: {0, 0, 0},
            radius: 85,
            colour: {1, 0, 0}
        }
    ]
}

IO.inspect scene

scene
    |> Rtex.Renderer.render(renderer: Rtex.Renderer.SimpleRenderer)
    |> Rtex.Image.save("scenes/single_sphere.ppm", format: Rtex.Image.Ppm)
