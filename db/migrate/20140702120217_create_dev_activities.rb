class CreateDevActivities < ActiveRecord::Migration
  def change
    create_table :dev_activities do |t|
      t.belongs_to :user
      t.string :dev_type, null: false
      t.datetime :activity_completed_at
      t.decimal :time_taken
      t.text :notes


      t.references :user, index: true
      t.timestamps
    end
  end
end
