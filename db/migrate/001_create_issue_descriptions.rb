class CreateIssueDescriptions < ActiveRecord::Migration
  def change
    create_table :issue_descriptions do |t|
      t.string :language
      t.text :description
      t.integer :issue_id
    end
    add_index :issue_descriptions, :issue_id
  end
end
