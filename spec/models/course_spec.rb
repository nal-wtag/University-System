require 'rails_helper'
Entry = Struct.new(:title, :code)
RSpec.describe Course, type: :model do
  it "has a title " do
    course=Course.new(title: nil)
    expect(course).to_not be_valid
  end
  it "has a code " do
    course=Course.new(code: nil)
    expect(course).to_not be_valid
  end

   it "has a unique title" do
     d1=Department.create!(name:"CSE",location:"1")
     course1=Course.new(title: "Database",code: "CSE-102")
     course1.department=d1
     course2=Course.new(title:"Database",code: "CSE-101")
     course2.department=d1

     expect(course1.save!).to be_truthy

     expect(course2.save).to be_falsey
  end
  it "has a unique code" do
    d1=Department.create!(name:"CSE",location:"1")
    course1=Course.new(title: "Data",code: "CSE-101")
    course1.department=d1
    course2=Course.new(title:"Database",code: "CSE-101")
    course2.department=d1

    expect(course1.save!).to be_truthy

    expect(course2.save).to be_falsey
  end

  it "course can't exist without department"  do
    course1=Course.new(title: "Data",code: "CSE-101")
    course2=Course.new(title:"Database",code: "CSE-101")

    expect(course1.save).not_to be_truthy
    expect(course2.save).not_to be_truthy
  end

end
