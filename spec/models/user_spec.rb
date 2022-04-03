require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(
      name:"Sarah",
      email:"sarah@gmail.com",
      address:"Uttara",
      password:"1234",
      role:"admin"
    )
  }
  it "user can't exist without name" do
    subject.name=nil
    expect(subject).not_to be_valid
  end
  it "user can't exist without email" do
    subject.email=nil
    expect(subject).not_to be_valid
  end
  it "user can't exist without role" do
    subject.role=nil
    expect(subject).not_to be_valid
  end
  it "user with valid attributes" do

    expect(subject).to be_valid
  end

  it "user can't exist without password" do
    subject.password=nil
    expect(subject).not_to be_valid
  end

end
