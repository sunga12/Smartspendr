require 'rails_helper'

RSpec.describe User, type: :model do
  # subject { User.create(name: 'admin', email: 'mcjthiongo@gmail.com', password: '123456') }
  subject { User.create(name: 'Jack') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  
end
