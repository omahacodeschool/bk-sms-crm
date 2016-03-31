class Touch < ActiveRecord::Base
  belongs_to :client
  include PgSearch

  multisearchable :against => [:message]

  # Return either today's time, "yesterday", or a past date--depending on
  # when this Touch was created relative to today.
  def smart_time_date
    # if self.created_at is from today
    #   Just the time of self's created_at
    # elsif self.created_at is from yesterday
    #   Just "yesterday"
    # else
    #   The date (03/12/16) of self.created_at
    # end
  end
end
