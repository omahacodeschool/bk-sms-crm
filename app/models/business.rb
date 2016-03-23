class Business < ActiveRecord::Base
    has_many :users

    def do_something_to_each_user
      users.each do |u|
        u.something
        u.something_else
        if u.uh > u.are
          return u.foo
        else
          return u.bar
        end
      end
    end
end
