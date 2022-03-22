# frozen_string_literal: true

require "models/compositions/arm_cartesian_constant_control_wdls"

require 'hello_world/models/profiles/gazebo/ur10_base'

module HelloWorld
    module Compositions #:nodoc:
        describe ArmCartesianConstantControlWdls do
            it "forwards its setpoint argument to the generator child" do
                setpoint = Hash[
                    position: Eigen::Vector3.new(1,2,3),
                    orientation: Eigen::Quaternion.from_angle_axis(0.4, Eigen::Vector3.UnitZ)
                ]

                cmp_task = syskit_stub_deploy_configure_and_start(
                    ArmCartesianConstantControlWdls
                        .with_arguments(setpoint: setpoint)
                        .with_arguments(robot: Profiles::Gazebo::UR10Base)

                )

                assert_equal(setpoint, cmp_task.command_child.setpoint)
            end
        end
    end
end
