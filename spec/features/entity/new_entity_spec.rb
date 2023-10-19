require 'rails_helper'

RSpec.describe 'Entities Page', type: :system do
  describe 'Viewing the New Transaction Page' do
    before(:each) do
      @user = User.create(name: 'Jake', email: 'jakes@gmail.com', password: '123456')
      @group = Group.create(name: 'Food', icon: 'phtolab.com/food', author_id: @user.id)
      @user.skip_confirmation!
      @user.save
      login_as(@user, scope: :user)

      visit new_group_entity_path(@group.id)
    end

    it 'shows the right fields' do
      expect(page).to have_field('Name')
      expect(page).to have_field('Amount')
    end

    it 'has a button to have a transaction' do
      expect(page).to have_button('Save Transaction')
    end

    it 'has a button to go back to the categories' do
      expect(page).to have_link('Back to Transactions')
    end

    it 'Redirects back to the transactions page when the Save Transaction button is clicked' do
      fill_in "Name",	with: "Burger King" 
      fill_in "Amount",	with: "32" 
      check "Food"
      click_button 'Save Transaction'
      expect(page).to have_current_path(group_entities_path(@group.id))
    end
  end

end