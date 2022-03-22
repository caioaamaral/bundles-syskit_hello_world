# frozen_string_literal: true

using_task_library 'robot_frames'

module OroGen
    describe robot_frames.Task do
        it { is_configurable }
    end

    describe robot_frames.ChainPublisher do
        it { is_configurable }
    end

    describe robot_frames.SingleChainPublisher do
        it "configures the robot model" do
            test_model = SDF::Model.from_xml_string("<model name='test'></model>")
            robot_mock = flexmock(sdf_model: test_model)

            task = syskit_stub_deploy_and_configure(
                OroGen.robot_frames.SingleChainPublisher
                    .with_arguments(robot: robot_mock)
            )

            assert_equal("<sdf><model name='test'/></sdf>", task.properties.robot_model)
            assert_equal(:ROBOT_MODEL_SDF, task.properties.robot_model_format)
        end
    end
end
