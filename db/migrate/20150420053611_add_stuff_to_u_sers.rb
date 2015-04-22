class AddStuffToUSers < ActiveRecord::Migration
  def change
    add_column :users, :last_name, :string
    add_column :users, :job, :string
    add_column :users, :areas_of_expertise, :string
    add_column :users, :hobbies, :string
  end
end
