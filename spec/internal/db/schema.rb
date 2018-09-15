ActiveRecord::Schema.define version: 0 do
  create_table :permissions, force: true do |t|
    t.string :name
  end
  add_index 'permissions', ['name'], name: 'index_permissions_on_name', unique: true

  create_table :permittances, force: true do |t|
    t.integer :permission_id

    # You should make sure that the column created is
    # long enough to store the required class names.
    t.string :permissible_type
    t.integer :permissible_id

    t.datetime :created_at
  end

  create_table :users, force: true do |t|
    t.column :name, :string
  end
end
