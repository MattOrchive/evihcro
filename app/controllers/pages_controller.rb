class PagesController < ApplicationController
	before_filter :authenticate_user!

  def About
    @title = "About Us"
  end

  def Contact
    @title = "Contact Us"
		
		@name = 'Default'
		@email = 'example@example.com'
		@content = 'Orchive is great!'
  end

  def Privacy
    @title = "Privacy Agreement"
  end

  def Terms
    @title = "Terms of Use"
  end
	
end