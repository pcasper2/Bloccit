describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        before do
          @vote1 = Vote.new(value: 1)
          @vote2 = Vote.new(value: 2)
          @vote3 = Vote.new(value: -1)
        end
        expect(@vote1.valid?).to eq(true)
        expect(@vote2.valid?).to eq(false)
        expect(@vote3.valid?).to eq(true)
      end
    end
  end
end