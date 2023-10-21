require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    Group.create(name: 'Food')
  end

  before { 
  subject.icon.attach(io: File.open('spec/fixtures/test_icon.png'), filename: 'test_icon.png', content_type: 'image/png')
  subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be the right length' do
    subject.name = 'a'*260
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

end
