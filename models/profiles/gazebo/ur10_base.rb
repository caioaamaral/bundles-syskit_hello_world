# frozen_string_literal: true

module HelloWorld
    module Profiles
        module Gazebo #:nodoc:
            profile "UR10Base" do
                use_gazebo_model('model://ur10', prefix_device_with_name: true)
                use_sdf_world
            end
        end
    end
end
