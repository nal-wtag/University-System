require 'rails_helper'

RSpec.describe "Departments", type: :request do
  before(:each) do
    @d1=Department.create(name:"CSE",location:"Tower-1")
  end
  it "checks a department has been created" do
    expect(@d1).to be_valid

  end
  it "checks if a department can be updated"do
    @d1.update(:location=> "Tower-3")
    expect(Department.find_by_location("Tower-3")).to eq(@d1)
  end
  it 'checks that a department can be destroyed' do
    @d1.destroy
    expect(Department.count).to eq(0)
  end

  it "assigns all departments to @departments" do
    expect(Department.all.count).to eq(1)
  end

end
