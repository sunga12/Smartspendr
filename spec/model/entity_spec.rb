require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject do
    Entity.new(name: 'Lasagna',
               amount: 5.75,
               user_id: User.create(name: 'Harry').id)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be a number' do
    subject.amount = 'cheese'
    expect(subject).to_not be_valid
  end

end
