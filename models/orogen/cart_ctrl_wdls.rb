# frozen_string_literal: true

Syskit.extend_model OroGen.cart_ctrl_wdls.WDLSSolver do
    argument :robot

    def configure
        super

        properties.robot_model = robot.sdf_model.make_root.to_xml_string
        properties.robot_model_format = :ROBOT_MODEL_SDF
    end
end

Syskit.extend_model OroGen.cart_ctrl_wdls.AdaptiveWDLSSolver do
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

