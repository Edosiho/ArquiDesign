Shoes.app do
  @o = oval :top => 0, :left => 0,
            :radius => 40
  motion do |x, y|
    @o.move width - x, height - y
  end
end