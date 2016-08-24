defprotocol Rtex.GeometricObject do
  def intersect(model, ray)
end