class Run < ActiveRecord::Base
  belongs_to :user
  
  def time_minutes
    return nil if time_in_seconds.nil?
    (time_in_seconds / 1.minute) % 1.minute
  end
  
  def time_hours
    return nil if time_in_seconds.nil?
    (time_in_seconds / 1.hour)
  end
  
  def time_minutes=(minutes)
    self.time_in_seconds ||= 0
    self.time_in_seconds += minutes.to_i.minutes
  end
  
  def time_hours=(hours)
    self.time_in_seconds ||= 0
    self.time_in_seconds += hours.to_i.hours
  end
  
  def self.find_for_friends(friends_facebook_ids)
     Run.find(:all,
              :conditions=>["users.facebook_id in (?)",friends_facebook_ids],
              :include=>[:user],
              :limit=>20,
              :order=>"ran_on desc")
   end
  
end
