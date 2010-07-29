class CreateStplThemes < ActiveRecord::Migration
  def self.up
    create_table :stpl_themes do |t|
      t.integer :themed_object_id
      t.string :themed_object_class_name
      t.integer :theme_id

      t.timestamps
    end
    add_index(:stpl_themes, :themed_object_id)
    add_index(:stpl_themes,:themed_object_class_name)
    add_index(:stpl_themes,:theme_id)
  end

  def self.down
    remove_index(:stpl_themes, [:themed_object_id,:themed_object_class_name,:theme_id])
    drop_table :stpl_themes
  end
end