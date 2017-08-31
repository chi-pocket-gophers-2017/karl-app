require 'rails_helper'

describe 'User' do
  let(:user) { User.create(first_name: "Karl", last_name: "N/A", email: "karl@comcast.hotmail", mentor: true, password: "hello" )}

  it 'has an readable first_name' do
    expect(user.first_name).to eq("Karl")
  end

  it 'has a readable last_name' do
    expect(user.last_name).to eq("N/A")
  end

  it 'has a writable first_name' do
    user.first_name = "KARRRRRLLLLL"
    expect(user.first_name).to eq ("KARRRRRLLLLL")
  end

  it 'has a writable last_name' do
    user.last_name = "Helper"
    expect(user.last_name).to eq("Helper")
  end

  it 'has a password' do
    expect(user.password).to_not be nil
  end

  it 'has a readable email' do
     expect(user.email).to_not be nil
  end

  it 'has a writable email' do
    user.email = "karl@yahoo.bing"
    expect(user.email).to eq("karl@yahoo.bing")
  end

end

describe 'Student' do
  let(:student) { User.create(first_name: "Dan", last_name: "D", email: "Dan@comcast.hotmail", mentor: false, password: "hellothere" )}

  it 'is not a mentor' do
    expect(student.mentor).to be false
  end

  it 'can create a new request' do
    student.requests.create
    expect(student.requests.count).to eq(1)
  end

  it 'has only one request at a time' do
    student.requests.create
    student.requests.create
    expect(student.requests.count).to eq(1)
  end

  it 'can delete a request' do
    student.requests.create
    request = student.requests.first
    request.destroy
  end

end

describe 'mentor' do
  let(:student) { User.create(first_name: "Dan", last_name: "D", email: "Dan@comcast.hotmail", mentor: false, password: "hellothere" )}
  let(:karl) { User.create(first_name: "Karl", last_name: "N/A", email: "karl@comcast.hotmail", mentor: true, password: "hello" )}

  it 'is not a student' do
    expect(karl.mentor).to be true
  end

  it 'can be added to a request' do
    student_request = student.requests.create
    student_request.mentor = karl
    expect(student_request.mentor).to be(karl)
  end
end