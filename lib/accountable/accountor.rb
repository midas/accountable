module Accountable
  module Accountor
    autoload :States, 'accountable/accountor/states'
    
    def self.included( base )
      unless included_modules.include? InstanceMethods
        base.extend ClassMethods
        base.extend CurrentMethods
        base.class_eval { include InstanceMethods }
      end
    end

    module ClassMethods
      def accountor_options
        @accountor_options ||= {
          :of => :users,
          :name => :name,
          :with_state => false,
          :dependent => :nullify,
          :assets => []
        }
      end
    end
    
    module InstanceMethods
      
    end
  end
end