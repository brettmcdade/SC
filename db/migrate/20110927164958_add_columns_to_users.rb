class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :job_title, :string
    add_column :users, :location, :string
    add_column :users, :details, :text
    add_column :users, :photo_file_name, :string
    add_column :users, :photo_content_type, :string
    add_column :users, :photo_file_size, :integer
    add_column :users, :paypal_email, :string
  end
end
