defmodule Rtex.Image do
  def save(data, filename, width, height, opts \\ []) do
    {format, opts} = Keyword.pop(opts, :format, nil)
    format.save(data, filename, width, height)
  end
end