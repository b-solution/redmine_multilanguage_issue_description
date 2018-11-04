
module RedmineMultipleIssuesLanguages
  module IssuesControllerPatch
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)

      base.class_eval do
        alias_method_chain :update_issue_from_params, :nested
        # alias_method_chain :build_new_issue_from_params, :nested
      end
    end

    module InstanceMethods
      def update_issue_from_params_with_nested
        @issue.attributes = params.require(:issue).permit(:issue_descriptions_attributes=> [:id, :description, :language, :_destroy]) if params.dig(:issue, :issue_descriptions_attributes)
        update_issue_from_params_without_nested
      end
    # def build_new_issue_from_params_with_nested
    #   build_new_issue_from_params_without_nested
    #     @issue.attributes = params.require(:issue).permit(:issue_descriptions_attributes=> [:id, :description, :language, :_destroy]) if params.dig(:issue, :issue_descriptions_attributes)
    #
    #   end
    end
  end
end


unless IssuesController.included_modules.include?(RedmineMultipleIssuesLanguages::IssuesControllerPatch)
  IssuesController.send(:include, RedmineMultipleIssuesLanguages::IssuesControllerPatch)
end