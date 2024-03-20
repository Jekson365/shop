require 'rails_helper'

RSpec.describe User,type: :model do
  describe 'when user is created' do
    context "validates username" do
      let(:status) { create(:status) }
      let!(:user) { described_class.new(username: "testnam", password: 'testpas$',status: status) }
      it "should have fixed length" do
        expect(user).to be_valid
      end

      it "should not be valid with blank username" do
        user = described_class.new(username: "", password: 'testpas$')
        expect(user).to_not be_valid
      end

      it "should not be valid with blank password" do
        user = described_class.new(username: "testname", password: '')
        expect(user).to_not be_valid
      end


      it "password should have dollar sign" do
        user = described_class.new(username: "testname", password: 'testpas')
        expect(user).to_not be_valid
      end
    end
  end
end