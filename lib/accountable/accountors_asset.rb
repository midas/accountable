module Accountable
  module AccountorsAsset
    def self.included( base )
      unless included_modules.include? InstanceMethods
        base.extend ClassMethods
        base.class_eval { include InstanceMethods }
      end
    end

    module ClassMethods
      def accountors_asset_options
        @accountors_asset_options ||= { :of => :account }
      end
    end
    
    module InstanceMethods
      
    end
  end
end