class AddSubjectAndSelfDirectedToDevActivities < ActiveRecord::Migration
  def change
    add_column :dev_activities, :self_directed, :boolean
    add_column :dev_activities, :development_subject, :string
  end
end
