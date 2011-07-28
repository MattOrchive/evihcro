 class Post < ActiveRecord::Base
	before_save :setFilters
	acts_as_taggable_on
	acts_as_taggable_on :tags

	belongs_to :user

	has_many :comments, :dependent => :destroy

#	attr_accessor :filter1, :filter2, :filter3, :filter4, :filter5, :filter6, :filter7, :filter8, :filter9, :filter10
	attr_accessor :politics, :tech, :entertainment, :sports, :science, :crime, :business, :social, :nature, :other
	attr_accessible :name, :title, :content, :user_location, :post_location, :user_id




	title_regex = /\A[a-zA-Z ,.-\/\[\]\{\}\'\"]+\z/

	validates :name, :presence => true

	validates :title, :presence => true,
										:length => {:within => 15..50},
									  :format => {:with => title_regex }

	validates :content, :presence => true,
											:length => {:within => 50..600}

	
	belongs_to :user
	
	has_many :comments, :dependent => :destroy
	
#	attr_accessor :filter1, :filter2, :filter3, :filter4, :filter5, :filter6, :filter7, :filter8, :filter9, :filter10
	attr_accessor :politics, :tech, :entertainment, :sports, :science, :crime, :business, :social, :nature, :other
	attr_accessible :name, :title, :content, :user_location, :post_location, :user_id,
    :post_id, :karma, :trending_value, :pageviews, :accuracy, :inaccuracy,   # <-- Jon's super code
    :total_votes, :time_effective, :accuracy_ratio, :accuracy_percent 
	
	
	title_regex = /\A[a-zA-Z ,.-\/\[\]\{\}\'\"]+\z/

	validates :name, :presence => true
	
	validates :title, :presence => true,
										:length => {:within => 15..50},
									  :format => {:with => title_regex }
	
	validates :content, :presence => true,
											:length => {:within => 50..600}
                    
def vote_up
    #simplified for testing
    @post = Post.find(params[:id])
    @post.accuracy+=1
    #render :text => @post.accuracy
    
    #redirect_to(:action=>'index')

  end

def vote_down
    @post = Post.find(params[:id])    
    @post.inaccuracy += 1
    #render :text => @post.inaccuracy
    #redirect_to(:action=>'index')

  end
   
	private
		def setFilters
			self.tag_list.clear
			self.tag_list << 'politics' if politics
			self.tag_list << 'tech' if tech
			self.tag_list << 'entertainment' if entertainment
			self.tag_list << 'sports' if sports
			self.tag_list << 'science' if science
			self.tag_list << 'crime' if crime
			self.tag_list << 'business' if business
			self.tag_list << 'social' if social
			self.tag_list << 'nature' if nature
			self.tag_list << 'other' if other
		end

   users_who_voted_up_array = []
   users_who_voted_down_array = []
	
end