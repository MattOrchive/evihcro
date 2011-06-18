require 'spec_helper'

describe PagesController do

  describe "GET 'About'" do
    it "should be successful" do
      get 'About'
      response.should be_success
    end
  end

  describe "GET 'Contact'" do
    it "should be successful" do
      get 'Contact'
      response.should be_success
    end
  end

  describe "GET 'Privacy'" do
    it "should be successful" do
      get 'Privacy'
      response.should be_success
    end
  end

  describe "GET 'Terms'" do
    it "should be successful" do
      get 'Terms'
      response.should be_success
    end
  end

end
