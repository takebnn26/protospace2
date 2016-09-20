class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|

      t.integer       :user_id
      t.text          :concept
      t.string        :catch_copy
      t.string        :title
      t.timestamps
    end
  end
end
