require_relative "./sdf_utils"

module HelloWorld
    module SDFAssertions
        def self.assert_link_in_model(link_name, model)
            if !SDFUtils::is_link_in_model?(link_name, model)
                raise ArgumentError,
                "link name '#{link_name}' is not a link of the robot model.
                model is '#{model}'
                Existing links: #{model.each_link.map(&:full_name).sort.join(", ")}"
            end
        end
            
    end
end