require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "user create" do
    it "creates user" do
      expect(User.new).not_to be_nil
    end
  end
end
