require File.expand_path('../test_helper', __FILE__)

describe "AbnAmro::Internetkassa::Response, with a successful payment" do
  before do
    @response = AbnAmro::Internetkassa::Response.new(fixture(:succeeded))
  end
  
  it "should be successful" do
    @response.should.be.success
  end
  
  xit "should return the status as a symbol" do
    @response.status.should == :success
  end
  
  it "should return `nil' as the error code" do
    @response.error_code.should.be nil
  end
  
  it "should return `nil' as the error message" do
    @response.error_message.should.be nil
  end
end

describe "AbnAmro::Internetkassa::Response, with a failed payment" do
  before do
    @response = AbnAmro::Internetkassa::Response.new(fixture(:failed))
  end
  
  it "should not be successful" do
    @response.should.not.be.success
  end
  
  xit "should return the status as a symbol" do
    @response.status.should == :failed
  end
  
  it "should return the error code" do
    @response.error_code.should == "30001001"
  end
  
  it "should return the error message" do
    @response.error_message.should == "Payment refused by the acquirer"
  end
end

describe "AbnAmro::Internetkassa::Response, with a cancelled payment" do
  before do
    @response = AbnAmro::Internetkassa::Response.new(fixture(:cancelled))
  end
  
  it "should not be successful" do
    @response.should.not.be.success
  end
  
  xit "should return the status as a symbol" do
    @response.status.should == :cancelled
  end
  
  it "should return the error code" do
    @response.error_code.should == "30171001"
  end
  
  it "should return the error message" do
    @response.error_message.should == "Payment method cancelled by the buyer"
  end
end

describe "AbnAmro::Internetkassa::Response, when an exception occurred" do
  before do
    @response = AbnAmro::Internetkassa::Response.new(fixture(:exception))
  end
  
  it "should not be successful" do
    @response.should.not.be.success
  end
  
  xit "should return the status as a symbol" do
    @response.status.should == :exception
  end
  
  it "should return the error code" do
    @response.error_code.should == "20002001"
  end
  
  it "should return the error message" do
    @response.error_message.should == "Origin for the response of the bank can not be checked"
  end
end