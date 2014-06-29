class User < ActiveRecord::Base
  include TwitterRestMethods
  include Authorization
end
