alias Rtex.ViewPlane, as: ViewPlane
alias Rtex.Scene, as: Scene
alias Rtex.Camera.PinholeCamera, as: PinholeCamera
alias Rtex.Light.AreaLight, as: AreaLight
alias Rtex.GeometricObject.Sphere, as: Sphere
alias Rtex.GeometricObject.Plane, as: Plane

scene = %Scene{
    viewplane: %ViewPlane{ rows: 200, columns: 200 },
    models: [
        %Sphere{
            centre: {0, -25, 0},
            radius: 80,
            colour: {1, 0, 0}
        },
        %Sphere{
            centre: {0, 30, 0},
            radius: 60,
            colour: {1, 1, 0}
        },
        %Plane{
            position: {0, 0, 0},
            normal: {0, 1, 1},
            colour: {0, 0.3, 0}
        }
    ]
}

IO.inspect scene

scene
    |> Rtex.Renderer.render(renderer: Rtex.Renderer.SimpleRenderer)
    |> Rtex.Image.save("scenes/two_spheres_and_plane.ppm", format: Rtex.Image.Ppm)
