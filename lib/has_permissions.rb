module HasPermissions
  def self.included(base)
    base.extend ClassMethods

    base.class_eval do
      has_many :permittances,
        as: :permissible,
        class_name: '::ActsAsPermissible::Permittance'

      has_many :permissions, through: :permittances
    end
  end

  def add_permission(permission_name)
    permissions.create(name: permission_name)
  end

  def remove_permission(permission_name)
    permissions.where(name: permission_name).destroy_all
  end

  def has_permission?(permission_name)
    permissions.exists?(name: permission_name)
  end

  module ClassMethods
    def has_permission(permission_name)
    end
  end
end
