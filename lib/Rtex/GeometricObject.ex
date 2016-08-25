defprotocol Rtex.GeometricObject do
  def hit(model, ray, t_min) 
end