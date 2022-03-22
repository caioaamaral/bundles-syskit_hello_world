# frozen_string_literal: true

require 'hello_world/models/compositions/arm_cartesian_constant_command_generator'
require 'hello_world/models/compositions/arm_cartesian_control_wdls'

module HelloWorld
    module Compositions #:nodoc:
        class ArmCartesianConstantControlWdls < Syskit::Composition
            argument :robot
            argument :setpoint  # The setpoint as a { position: p, orientation: q }

            add(ArmCartesianConstantCommandGenerator, as: 'command')
                .with_arguments(setpoint: from(:parent_task).setpoint)

            add(ArmCartesianControlWdls, as: 'control')
                .with_arguments(robot: from(:parent_task).robot)

            command_child.out_port.
                connect_to(control_child.command_port)
        end
    end
end
