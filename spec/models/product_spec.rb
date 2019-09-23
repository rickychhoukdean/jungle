require "rails_helper"

RSpec.describe Product, type: :model do
  subject { described_class.new }

  describe "Validations" do
    it "validates with all four fields" do
      @category = Category.new
      subject.name = "hi"
      subject.price = 100
      subject.quantity = 1
      subject.category = @category
      expect(subject).to be_valid
    end
    it "validates :name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it "validates :price" do
      subject.price = nil
      expect(subject).to_not be_valid
    end
    it "validates :quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
    it "validates :category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end
  end
end
