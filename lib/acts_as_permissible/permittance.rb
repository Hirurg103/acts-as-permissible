module ActsAsPermissible
  class Permittance < ::ActiveRecord::Base
    belongs_to :permission, class_name: '::ActsAsPermissible::Permission'

    belongs_to :permissible, polymorphic: true
  end
end
