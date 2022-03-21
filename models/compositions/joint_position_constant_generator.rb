# frozen_string_literal: true

require 'common_models/models/compositions/constant_generator'
import_types_from 'base'

def makeJointStateFromSetpoint(setpoint)
    setpoint.each_value.map do | position |
        makeJointStateFromPosition(position)
    end
end

def makeJointStateFromPosition(position)
    Types.base.JointState.new(position: position)
end

module HelloWorld
    module Compositions #:nodoc:
        class JointPositionConstantGenerator < CommonModels::Compositions::ConstantGenerator
                                               .for('base/commands/Joints')
            argument :setpoint # a hash of joint_names to joint_state

            def setpoint=(setpoint)
                joint_names = setpoint.keys
                joint_states = makeJointStateFromSetpoint(setpoint)

                self.values = Hash['out' => Types.base.commands.Joints.new(
                    time: Time.at(0),
                    names: joint_names,
                    elements: joint_states,
                )]
            end

            def values
                if super
                    sample = super['out'].dup
                    sample.time = Time.now
                    Hash['out' => sample]
                end
            end
        end
    end
end
