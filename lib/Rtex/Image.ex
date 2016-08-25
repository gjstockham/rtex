defmodule Rtex.Image do
  @moduledoc """
  Image saving
  """

  def save(data, filename, opts \\ []) do
    {format, opts} = Keyword.pop(opts, :format, nil)
    format.save(data, filename)
  end
end