class Movie < ActiveRecord::Base

  def self.types
    %w(Title Genre Actor)
  end

end
