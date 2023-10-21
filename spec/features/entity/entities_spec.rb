require 'rails_helper'

RSpec.describe 'Entities Page', type: :system do
  describe 'Viewing the index page with no Transactions' do
    before(:each) do
      @user = User.create(name: 'Jake', email: 'jakes@gmail.com', password: '123456')
      @group = Group.create(name: 'Food', author_id: @user.id)
      @group.icon.attach(io: File.open('spec/fixtures/test_icon.png'), filename: 'test_icon.png',
                         content_type: 'image/png')
      @group.save
      @user.skip_confirmation!
      @user.save
      login_as(@user, scope: :user)

      visit group_entities_path(@group.id)
    end

    it 'shows the right content' do
      expect(page).to have_content('Transactions')
    end

    it 'have the total expenditure for the chosen category' do
      expect(page).to have_content('Total Spent')
    end

    it 'has a button to add a transaction' do
      expect(page).to have_link('New Transaction')
    end

    it 'directs to the New Category form when the button to add a category is clicked' do
      click_link 'New Transaction'
      expect(page).to have_current_path(new_group_entity_path(@group.id))
    end
  end

  describe 'Viewing the index page after adding a Transaction' do
    before(:each) do
      @user = User.create(name: 'Jake', email: 'jakes@gmail.com', password: '123456')
      @group = Group.create(name: 'Food', author_id: @user.id)
      @group.icon.attach(io: File.open('spec/fixtures/test_icon.png'), filename: 'test_icon.png',
                         content_type: 'image/png')
      @group.save
      @entity = Entity.create(name: 'KFC', amount: 125, author_id: @user.id, group_ids: [@group.id])
      @user.skip_confirmation!
      @user.save
      login_as(@user, scope: :user)

      visit group_entities_path(@group.id)
    end

    it 'shows the Transaction' do
      expect(page).to have_content('KFC')
    end

    it 'have the amount of the Transaction' do
      expect(page).to have_content('125')
    end
  end
end
