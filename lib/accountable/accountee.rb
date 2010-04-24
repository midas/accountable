module Accountable
  module Accountee
    def self.included( base )
      unless included_modules.include? InstanceMethods
        base.extend ClassMethods
        base.extend CurrentMethods
        base.class_eval { include InstanceMethods }
      end
    end

    module ClassMethods
      def accountee_options
        @accountee_options ||= { :of => :account }
      end
    end
    
    module InstanceMethods
      
    end
  end
end