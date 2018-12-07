describe Directions do
  describe "#from_s" do
    it "gives North when given N" do
      expect(Directions::from_s("N")).eql?(Directions::North)
    end

    it "gives South when given S" do
      expect(Directions::from_s("S")).eql?(Directions::South)
    end

    it "gives East when given E" do
      expect(Directions::from_s("E")).eql?(Directions::East)
    end

    it "gives West when given W" do
      expect(Directions::from_s("W")).eql?(Directions::West)
    end

    it "returns nil when given any other value" do
      expect(Directions::from_s("")).eql?(nil)
    end
  end
end