# frozen_string_literal: true

require 'hello_world/models/compositions/arm_cartesian_constant_command_generator'
require 'hello_world/models/compositions/arm_cartesian_control_wdls'

module HelloWorld
    module Compositions #:nodoc:
        class ArmCartesianConstantControlWdls < Syskit::Composition
            argument :setpoint

            add(ArmCartesianConstantCommandGenerator, as: 'command')
                .with_arguments(setpoint: from(:parent_task).setpoint)

            add(ArmCartesianControlWdls, as: 'control')

            command_child.out_port.
                connect_to(control_child.command_port)
        end
    end
end
