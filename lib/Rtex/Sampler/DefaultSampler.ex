defmodule Rtex.Sampler.DefaultSampler do
    @moduledoc """
    Generates samples based on a simple grid

    ## Examples
    iex> Rtex.Sampler.DefaultSampler.generate_samples(4)
    [{-0.25, -0.25}, {-0.25, 0.25}, {0.25, -0.25}, {0.25, 0.25}]
    
    iex> Rtex.Sampler.DefaultSampler.generate_samples(1)
    [{0.0, 0.0}]

    """
    def generate_samples(n) do
        size = round(:math.sqrt(n))
        for p <- 0..(size - 1),
            q <- 0..(size - 1) do

            x = ((p + 0.5) / size) - 0.5
            y = ((q + 0.5) / size) - 0.5    

            {x, y}
        end

    end
end