# frozen_string_literal: true

require "models/compositions/arm_cartesian_constant_command_generator"

module HelloWorld
    module Compositions #:nodoc:
        describe ArmCartesianConstantCommandGenerator do
            attr_reader :position, :orientation,:task

            before do
                @position = Eigen::Vector3.new(1,2,3)
                @orientation = Eigen::Quaternion.from_angle_axis(0.2, Eigen::Vector3.UnitX)
                @task = syskit_stub_deploy_configure_and_start(ArmCartesianConstantCommandGenerator.with_arguments(
                    setpoint: Hash[:position => position, :orientation => orientation]
                ))
            end

            it "propagates its position and orientation arguments to #values" do
                assert_equal(position, task.values['out'].position)
                assert_equal(orientation, task.values['out'].orientation)
            end

            it "stamps all samples" do
                Timecop.freeze(expected_time = Time.now)

                sample = expect_execution.
                    to { have_one_new_sample task.out_port }
                
                assert_in_delta(expected_time, sample.time, 1e-6)
            end
        end
    end
end

