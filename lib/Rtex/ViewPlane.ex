defmodule Rtex.ViewPlane do
    @moduledoc """
    Details of the rendering plane
    """

    defstruct rows: 200, columns: 100, pixel_size: 1.0, gamma: 1.0, num_samples: 1
end