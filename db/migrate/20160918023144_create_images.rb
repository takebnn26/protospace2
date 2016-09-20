class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|

      t.string      :content
      t.string      :content_type
      t.integer     :prototype_id
      t.timestamps
    end
  end
end
