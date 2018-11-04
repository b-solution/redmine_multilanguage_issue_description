
module RedmineMultipleIssuesLanguages
  module IssuePatch
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)

      base.class_eval do
       has_many :issue_descriptions
       accepts_nested_attributes_for :issue_descriptions, reject_if: :all_blank, allow_destroy: true

        safe_attributes issue_descriptions_attributes: [:id, :description, :language, :_destroy]


      end
    end

    module InstanceMethods
      def description?
        description.present?
      end
      def description
       @description ||= (issue_descriptions.where(language: User.current.language || 'en' ).first.try(:description) || issue_descriptions.first.try(:description) || read_attribute(:description))
     end
    end
  end
end


unless Issue.included_modules.include?(RedmineMultipleIssuesLanguages::IssuePatch)
  Issue.send(:include,RedmineMultipleIssuesLanguages::IssuePatch)
end