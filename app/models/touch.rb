class Touch < ActiveRecord::Base
  belongs_to :client
  include PgSearch

  multisearchable :against => [:message]

  # Return either today's time, "yesterday", or a past date--depending on
  # when this Touch was created relative to today.
  def smart_time_date
    today = Time.now.strftime("%m/%d/%y")
    yesterday = Date.yesterday
    if self.created_at == today
      date_time_display = self.created_at.Time.now.strftime("%I:%M")
    elsif self.created_at == yesterday
      date_time_display = "Yesterday"
    else
      date_time_display = self.created_at.strftime("%m/%d/%y")
    end
    return date_time_display
  end
end

