require 'spec_helper'

module Codebreaker
  describe Code do
    describe "#generate" do
      it "generates 4 letters from 0 to 9" do
        Code.generate.should match(/\d{4}/)
      end

      it "generates different codes" do
        code1 = Code.generate
        code2 = Code.generate
        code1.should_not eq(code2)
      end
    end
  end
end