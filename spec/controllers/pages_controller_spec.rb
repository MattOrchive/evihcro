require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = "Orchive"
  end

  describe "GET 'About'" do
    it "should be successful" do
      get 'About'
      response.should be_success
    end

    it "should have right title" do
      get 'About'
      response.should have_selector("title",
                                    :content => @base_title + " | About")
    end


  end

  describe "GET 'Contact'" do
    it "should be successful" do
      get 'Contact'
      response.should be_success
    end

    it "should have right title" do
      get 'Contact'
      response.should have_selector("title",
                                    :content => @base_title + " | Contact")
    end
  end

  describe "GET 'Privacy'" do
    it "should be successful" do
      get 'Privacy'
      response.should be_success
    end

    it "should have right title" do
      get 'Privacy'
      response.should have_selector("title",
                                    :content => @base_title + " | Privacy Agreement")
    end
  end

  describe "GET 'Terms'" do
    it "should be successful" do
      get 'Terms'
      response.should be_success
    end

    it "should have right title" do
      get 'Terms'
      response.should have_selector("title",
                                    :content => @base_title + " | Terms of Use")
    end
  end

end
