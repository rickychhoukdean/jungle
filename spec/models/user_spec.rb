require "rails_helper"

RSpec.describe User, type: :model do
  subject { described_class.new(name: "hi", password: "1234567", password_confirmation: "1234567", email: "test@test.com") }

  describe "Validations" do
    it "passes all data attributes" do
      expect(subject).to be_valid
    end

    describe "Password validation" do
      it "must have a regular password to pass" do
        subject.password = nil
        expect(subject).to_not be_valid
      end
      it "must have a regular password to pass" do
        subject.password_confirmation = nil
        expect(subject).to_not be_valid
      end

      it "if it has different password it will fail have same password to pass" do
        subject.password = "hisaaaa"
        subject.password_confirmation = "hiaaaa"
        expect(subject).to_not be_valid
      end
    end
    describe "Email validation" do
      it "email must be unique (not case sensitive)" do
        user = User.create(email: "test@test.com", password: "haaaaaaa", password_confirmation: "haaaaaaa", name: "hi")
        expect(subject).to_not be_valid
      end
      it "Email, name are required" do
        subject.email = nil
        subject.name = nil
        expect(subject).to_not be_valid
      end
      it "if name is not given it fails" do
        subject.name = nil
        expect(subject).to_not be_valid
      end
      it "if email is not given it fails" do
        subject.email = nil
        expect(subject).to_not be_valid
      end
    end
    it "Minimum password length is required" do
      subject.password = "a"
      expect(subject).to_not be_valid
    end
  end
  describe ".authenticate_with_credentials" do
    it "Should pass if email and password are entered correctly" do
      user = User.create(email: "bobo@bob.com", password: "haaaaaaa", password_confirmation: "haaaaaaa", name: "hi")

      @res = User.authenticate_with_credentials("bobo@bob.com", "haaaaaaa")
      expect(@res).to_not be_nil
    end
    it "Should pass if email and password are entered correctly with white spaces and upper cases" do
      user = User.create(email: "bobo@bob.com", password: "haaaaaaa", password_confirmation: "haaaaaaa", name: "hi")

      @res = User.authenticate_with_credentials("  Bobo@bob.com", "haaaaaaa")
      expect(@res).to_not be_nil
    end
  end
end
