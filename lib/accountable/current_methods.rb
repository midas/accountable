module Accountable
  module CurrentMethods
    def current
      Thread.current[self.class.name.tableize.singularize.to_sym]
    end

    def current=( something )
      unless something.nil? || something.is_a?( self )
        raise( ArgumentError,
          "Exception occurred while trying to set #{self.name}.current. Expected an object of type '#{self.name}', got an object of type ''#{something.class.name}'")
      end
      Thread.current[self.class.name.tableize.singularize.to_sym] = something
    end
  end
end