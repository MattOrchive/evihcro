class PagesController < ApplicationController
  def About
    @title = "About Us"
  end

  def Contact
    @title = "Contact Us"
  end

  def Privacy
    @title = "Privacy Agreement"
  end

  def Terms
    @title = "Terms of Use"
  end

end
