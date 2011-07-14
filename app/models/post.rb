class Post < ActiveRecord::Base
	belongs_to :user
	
	has_many :comments, :dependent => :destroy
	has_one :tag
	
	accepts_nested_attributes_for :tag, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
	
	title_regex = /\A[a-zA-Z ,.-\/\[\]\{\}\'\"]+\z/

	validates :name, :presence => true
	
	validates :title, :presence => true,
										:length => {:within => 15..50},
									  :format => {:with => title_regex }
	
	validates :content, :presence => true,
											:length => {:within => 50..600}
	
end