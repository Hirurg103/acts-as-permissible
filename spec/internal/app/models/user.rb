class User < ActiveRecord::Base

  include HasPermissions
  has_permission 'Manage articles'

end
