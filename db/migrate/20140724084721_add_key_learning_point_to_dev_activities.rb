class AddKeyLearningPointToDevActivities < ActiveRecord::Migration
  def change
  	add_column :dev_activities, :key_learning_point, :string
  end
end
