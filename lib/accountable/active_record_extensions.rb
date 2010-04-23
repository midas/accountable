module Accountable
  module ActiveRecordExtensions
    
    def self.included( base )
      base.extend( ActsMethods ) unless base.included_modules.include? ActsMethods
    end
        
    module ActsMethods
      # Placed in the model desired to be the accountor (usually Account).
      #
      def acts_as_accountor( *args )
        unless included_modules.include? Accountable::Accountor
          include Accountable::Accountor
          options = args.extract_options!
          self.accountor_options.merge!( options.reject { |k,v| v.blank? } )
        
          self.class_eval do 
            has_many self.accountor_options[:of], :dependent => accountor_options[:dependent]
            unless accountor_options[:name] == false
              validates_presence_of accountor_options[:name].to_sym
              validates_length_of accountor_options[:name].to_sym, :maximum => 150, 
                :allow_nil => true, :allow_blank => true
              attr_accessible accountor_options[:name].to_sym
            end
            assets = self.accountor_options[:assets].is_a?( Array ) ? 
                       self.accountor_options[:assets] : 
                       [self.accountor_options[:assets]]
            assets.each { |asset| has_many asset.to_sym, :dependent => accountor_options[:dependent] }
            include Accountor::States::StateMachineInstanceMethods unless accountor_options[:with_state] == false
            include Accountor::States::AasmTraits if accountor_options[:with_state] == :aasm
            include Accountor::States::StateMachineTraits if accountor_options[:with_state] == :state_machine
          end
        end
      end
    
      # Placed in the model desired to be the accountee (usually User).
      #
      def acts_as_accountee( *args )
        unless included_modules.include? Accountable::Accountee
          include Accountable::Accountee
          options = args.extract_options!
          self.accountee_options.merge!( options.reject { |k,v| v.blank? } )
        
          self.class_eval do 
            belongs_to self.accountee_options[:of].to_sym
            validates_presence_of self.accountee_options[:of].to_sym
          end
        end
      end
      
      # Placed in the model(s) desired to be owned by the accountor.
      #
      def acts_as_accountors_asset( *args )
        unless included_modules.include? Accountable::AccountorsAsset
          include Accountable::AccountorsAsset

          self.class_eval do 
            belongs_to self.accountors_asset_options[:of]
            validates_presence_of self.accountors_asset_options[:of]
          end
        end
      end
    end
    
  end
end