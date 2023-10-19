require 'rails_helper'

RSpec.describe 'Categories Page', type: :system do
  describe 'Viewing the index page with no categories' do
    before(:each) do
      @user = User.create(name: 'Jake', email: 'jakes@gmail.com', password: '123456')
      @user.skip_confirmation!
      @user.save
      login_as(@user, scope: :user)

      visit root_path

    end

    it 'shows the right content' do
      expect(page).to have_content('Categories')
    end

    it 'has a button to add a category' do
      expect(page).to have_link('New Category')
    end

    it 'directs to the New Category form when the button to add a category is clicked' do
      click_link 'New Category'
      expect(page).to have_current_path(new_group_path)
    end
  end


  describe 'Viewing the index page after adding a category' do
    before(:each) do
      @user = User.create(name: 'Jake', email: 'jakes@gmail.com', password: '123456')
      @group = Group.create(name: 'Food', icon: 'phtolab.com/food', author_id: @user.id)
      @user.skip_confirmation!
      @user.save
      login_as(@user, scope: :user)

      visit root_path
    end

    it 'shows the Category' do
      expect(page).to have_content('Food')
    end

    it 'have the total expenditure for each category' do
      expect(page).to have_content('Total')
    end
  end

end