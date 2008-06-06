module MassAssignmentMurderer
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def has_mass_assignment_murderer
      to_protect = self.instance_methods.select { |m| m =~ /_ids$/ }
      to_protect.each do |dangerous_method| 
        self.class_eval %Q{
          attr_protected :#{dangerous_method} 
        }
      end
    end
  end
end
