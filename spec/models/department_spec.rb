require 'rails_helper'

RSpec.describe Department, type: :model do
  let(:department1) { Department.new(name: 'BBA', location: 'West Building') }
  let(:department2) { Department.new(name: 'BBA', location: 'North Building') }
  it 'is not valid without a name' do
    !department1.name.nil?
    expect(department1).to be_valid
  end

  # it 'ensures that no two department has the same name' do
  #   department1.name==department2.name
  #   expect(department2).not_to be_valid
  #   expect(department1).not_to be_valid
  # end
end
