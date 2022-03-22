# frozen_string_literal: true

require_relative "../../lib/hello_world/sdf_assertions"

Syskit.extend_model OroGen.cart_ctrl_wdls.WDLSSolver do
    argument :robot

    def update_properties
        super

        root_element = robot.sdf_model.make_root

        model = root_element.each_model.first
        HelloWorld::SDFAssertions::assert_link_in_model(properties.root, model)
        HelloWorld::SDFAssertions::assert_link_in_model(properties.tip, model)

        properties.robot_model = root_element.to_xml_string
        properties.robot_model_format = :ROBOT_MODEL_SDF
    end
end

Syskit.extend_model OroGen.cart_ctrl_wdls.AdaptiveWDLSSolver do
    # AdaptiveWDLSSolver inherits the 'update_properties' from WDLSSolver
end

Syskit.extend_model OroGen.cart_ctrl_wdls.CartCtrl do
    # Customizes the configuration step.
    #
    # The orocos task is available from orocos_task
    #
    # The call to super here applies the configuration on the orocos task. If
    # you need to override properties, do it afterwards
    #
    # def configure
    #     super
    # end
end

Syskit.extend_model OroGen.cart_ctrl_wdls.ToPosConverter do
    # Customizes the configuration step.
    #
    # The orocos task is available from orocos_task
    #
    # The call to super here applies the configuration on the orocos task. If
    # you need to override properties, do it afterwards
    #
    # def configure
    #     super
    # end
end
