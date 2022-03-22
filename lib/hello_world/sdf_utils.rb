module HelloWorld
    module SDFUtils
        def self.is_link_in_model?(link_name, model)
            model.each_link.any? { | link | link.full_name == link_name }
        end
    
    end
end