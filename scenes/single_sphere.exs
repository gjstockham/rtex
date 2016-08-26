alias Rtex.ViewPlane, as: ViewPlane
alias Rtex.Scene, as: Scene
alias Rtex.Camera.PinholeCamera, as: PinholeCamera
alias Rtex.Light.AmbientLight, as: AmbientLight
alias Rtex.Light.DirectionalLight, as: DirectionalLight
alias Rtex.GeometricObject.Sphere, as: Sphere
alias Rtex.Material.Matte, as: Matte
alias Rtex.Renderer.SimpleRenderer, as: SimpleRenderer

camera = PinholeCamera.create({0, 0, 500}, {0, 0, 0}, {0, 1, 0}, 600)


scene = %Scene{
    viewplane: %ViewPlane{rows: 400, columns: 400 },
    camera: camera,
    ambient: %AmbientLight{
            radiance: 1.0
        },
    lights: [
        %DirectionalLight{
            direction: {100, 100, 100},
            radiance: 3.0
        }
    ],
    models: [
        %Sphere{
            centre: {0, 30, 0},
            radius: 85,
            material: %Matte{
                colour: {1, 1, 0},
                ka: 0.25,
                kd: 0.75
            }
        }
    ]
}

scene
    |> Rtex.Renderer.render(renderer: SimpleRenderer)
    |> Rtex.Image.save("scenes/single_sphere.ppm", format: Rtex.Image.Ppm)
