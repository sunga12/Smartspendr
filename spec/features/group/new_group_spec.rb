require 'rails_helper'

RSpec.describe 'New Category Page', type: :system do
  describe 'Viewing the New Category Page' do
    before(:each) do
      @user = User.create(name: 'Jake', email: 'jakes@gmail.com', password: '123456')
      @user.skip_confirmation!
      @user.save
      login_as(@user, scope: :user)

      visit new_group_path
    end

    it 'shows the right fields' do
      expect(page).to have_field('Name')
      expect(page).to have_field('Icon')
    end

    it 'has a button to have a Category' do
      expect(page).to have_button('Save Category')
    end

    it 'Redirects back to the home page when the Save Category button is clicked' do
      fill_in 'Name',	with: 'Sports'
      attach_file('Icon', "#{Rails.root}spec/fixtures/test_icon.png")
      click_button 'Save Category'
      expect(page).to have_current_path(groups_path)
    end
  end
end
