require 'rspec'
require 'selenium-webdriver'
describe "Test a feature" do
  before(:each) do
    FieldWebApp.launch
  end
  it "can do a sample test" do
    pending # TODO:
  end
  after(:each) do
    FieldWebApp.quit
  end
end