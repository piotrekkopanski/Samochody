class AddAttachmentInageToAzzets < ActiveRecord::Migration
 def self.up
    add_column :azzets, :inage_file_name, :string
    add_column :azzets, :inage_content_type, :string
    add_column :azzets, :inage_file_size, :integer
    add_column :azzets, :inage_updated_at, :datetime
    end
  

  def self.down
    remove_column :azzets, :inage_file_name
    remove_column :azzets, :inage_content_type
    remove_column :azzets, :inage_file_size
    remove_column :azzets, :inage_updated_at
  end
end
