class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates_presence_of :username
  validates_uniqueness_of :username
  
  has_many :friendships , dependent: :destroy
  has_many :inverse_friendships , class_name: "Friendship" , foreign_key: "friend_id", dependent: :destroy
  has_many :posts , dependent: :destroy
  
  def request_friendship(u2)
    self.friendships.create(friend: u2)
  end  
  
  def pending_request_from #we haven't confirmed this friendship
    self.inverse_friendships.where(state: "pending")
  end  
  
  def pending_request_to
    self.friendships.where(state: "pending")
  end
  
  def active_friends
    self.friendships.where(state: "active").map(&:friend) + self.inverse_friendships.where(state: "active").map(&:user)
  end 
  
  def friendship_status(u2)
    
    friendship = Friendship.where(user_id: [self.id,u2.id] , friend_id: [self.id,u2.id])
    
    unless friendship.any?
      return "not_friends"
    else
      if friendship.first.state == "active"
        return "friends"
      else
      if friendship.first.user == self
        return "pending"
      else
        return "requested"
      end 
      end
      
    end    
    
  end  
  
  def friendship_relation(u2)
    Friendship.where(user_id: [self.id,u2.id] , friend_id: [self.id,u2.id]).first
  end  
  
  
end
