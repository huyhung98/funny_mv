require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    let!(:user) { create(:user) }

    it 'is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without an password' do
      user.password_digest = nil
      expect(user).to_not be_valid
    end

    it 'is invalid with a duplicate email' do
      user2 = User.new(
        email: user.email,
        password: '123456'
      )
      expect(user2).to_not be_valid
    end

    it 'is valid with a name regex' do
      user.email = 'valid_email@mail.com'
      expect(user).to be_valid
    end

    it 'is not valid without a name regex' do
      user.email = 'invalid_ email@mail.com'
      expect(user).to_not be_valid
    end
  end
end
