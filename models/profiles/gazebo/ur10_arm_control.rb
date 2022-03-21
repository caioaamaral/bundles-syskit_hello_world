# frozen_string_literal: true

require 'hello_world/models/profiles/gazebo/ur10_base'
require 'hello_world/models/compositions/arm_cartesian_constant_control_wdls'
require 'hello_world/models/compositions/joint_position_constant_control'

module HelloWorld
    module Profiles
        module Gazebo #:nodoc:
            UR10_SAFE_POSITION = Hash[
                'ur10::shoulder_pan'  => 0,
                'ur10::shoulder_lift' => -Math::PI/2,
                'ur10::elbow'         => Math::PI/2,
                'ur10::wrist_1'       => 0,
                'ur10::wrist_2'       => 0,
                'ur10::wrist_3'       => 0
            ]

            profile "UR10ArmControl" do
                define 'arm_cartesian_constant_control',
                    Compositions::ArmCartesianConstantControlWdls
                        .use(UR10Base.ur10_dev)
                        .with_arguments(robot: UR10Base)

                define 'joint_position_constant_control',
                    Compositions::JointPositionConstantControl
                        .use(UR10Base.ur10_dev)
                
                define 'arm_safe_position',
                    joint_position_constant_control_def
                        .with_arguments(setpoint: UR10_SAFE_POSITION)
            end
        end
    end
end
