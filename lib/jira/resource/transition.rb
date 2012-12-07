module JIRA
  module Resource

    class TransitionFactory < JIRA::BaseFactory # :nodoc:
    end

    class Transition < JIRA::Base

      has_one :status, :class => JIRA::Resource::Status,  :nested_under => "to"
      # belongs_to :issue
      nested_collections true
    end

  end
end
