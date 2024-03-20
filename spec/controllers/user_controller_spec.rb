require 'rails_helper'

RSpec.describe UsersController,type: :controller do
  describe "user controller" do
    let(:user) { create(:user) }
    context "when user is created" do
      it "should add user in database" do
        expect{ user }.to change(User,:count).by(1)
      end
    end

    context 'when user is update' do
      subject(:call) { patch :update, params: { id:user.id, username: 'foo213' } }
      it "should update user" do
        call
        result = response.parsed_body
        expect(result['username']).to eq('foo213')
      end
    end

    context "when user is deleted" do
      subject(:call) { delete :destroy, params: { id: user.id } }
      subject(:change_to_deleted) { post :change_deleted, params: { id: user.id } }
      it "should deleted user" do
        call
        expect(User.find_by(id: user.id)).to be_nil
      end
      it "should change column to deleted" do
        change_to_deleted
        result = response.parsed_body
        expect(result['deleted']).to be !user.deleted
      end
    end

    context "change admin status" do
      subject(:call) { post :admin_status, params: { id: user.id }  }
      let(:is_admin) { user.is_admin }
      it "should change admin to false" do
        call
        result = response.parsed_body
        expect(result['user']['is_admin']).to be !is_admin
      end
    end
  end
end