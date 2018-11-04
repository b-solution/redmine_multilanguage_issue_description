class IssueDescription < ActiveRecord::Base
  belongs_to :issue

  validates_presence_of :language, :description
  validates_uniqueness_of :language, scope: [:issue_id]

  EURO_LANGUAGES=[]
end
