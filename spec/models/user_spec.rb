require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:tweets).dependent(:destroy) }
  it { should validate_uniqueness_of(:username).case_insensitive.allow_blank }

  describe '#set_display_name' do
    context 'when display_name is set' do
      it "doesn't change the display_name" do
        user = create(:user, username: 'AimaneYsr', display_name: 'aim.eyez')
        expect do
          user.save
        end.not_to change { user.reload.display_name }
      end
    end

    context 'when display_name is not set' do
      it 'humanizes the previously set username' do
        user = build(:user, username: 'AimaneYsr', display_name: nil)
        user.save
        expect(user.reload.display_name).to eq('Aimaneysr')
      end
    end
  end
end
