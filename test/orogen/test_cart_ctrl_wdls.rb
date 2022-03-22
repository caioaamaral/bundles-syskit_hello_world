# frozen_string_literal: true

using_task_library 'cart_ctrl_wdls'

require 'hello_world/models/profiles/gazebo/ur10_base'

module OroGen
    describe cart_ctrl_wdls.WDLSSolver do
        it "configures the robot model" do
            test_model = SDF::Model.from_xml_string("<model name='test'></model>")
            robot_mock = flexmock(sdf_model: test_model)

            task = syskit_stub_deploy_and_configure(
                OroGen.cart_ctrl_wdls.WDLSSolver
                    .with_arguments(robot: robot_mock)
            )

            assert_equal("<sdf><model name='test'/></sdf>", task.properties.robot_model)
            assert_equal(:ROBOT_MODEL_SDF, task.properties.robot_model_format)
        end
    end

    describe cart_ctrl_wdls.AdaptiveWDLSSolver do
        it "configures the robot model" do
            test_model = SDF::Model.from_xml_string("<model name='test'></model>")
            robot_mock = flexmock(sdf_model: test_model)

            task = syskit_stub_deploy_and_configure(
                OroGen.cart_ctrl_wdls.AdaptiveWDLSSolver
                    .with_arguments(robot: robot_mock)
            )

            assert_equal("<sdf><model name='test'/></sdf>", task.properties.robot_model)
            assert_equal(:ROBOT_MODEL_SDF, task.properties.robot_model_format)
        end
    end

    describe cart_ctrl_wdls.CartCtrl do
        it { is_configurable }
    end

    describe cart_ctrl_wdls.ToPosConverter do
        it { is_configurable }
    end
end
