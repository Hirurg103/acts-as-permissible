require "spec_helper"

module ActsAsPermissible

  RSpec.describe "Define permissions" do
    let(:user) { User.create! }

    it "should add permission" do
      expect(user.has_permission? 'Manage articles').to be_falsey

      user.add_permission 'Manage articles'

      expect(user.has_permission? 'Manage articles').to be_truthy
    end

    it "should remove permission" do
      permission = Permission.create(name: 'Manage articles')
      Permittance.create(permission: permission, permissible: user)

      expect(user.has_permission? 'Manage articles').to be_truthy

      user.remove_permission 'Manage articles'

      expect(user.has_permission? 'Manage articles').to be_falsey
    end

  end

end
