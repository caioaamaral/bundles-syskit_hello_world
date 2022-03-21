# frozen_string_literal: true

import_types_from 'base'
require 'common_models/models/compositions/constant_generator'

module HelloWorld
    module Compositions #:nodoc:
        class ArmCartesianConstantCommandGenerator < CommonModels::Compositions::ConstantGenerator
                                                     .for('/base/samples/RigidBodyState')
                # The setpoint as a { position: p, orientation: q }
                argument :setpoint

                def setpoint=(setpoint)
                    pose_stamped = Types.base.samples.RigidBodyState.Invalid
                    pose_stamped.position = setpoint.fetch(:position)
                    pose_stamped.orientation = setpoint.fetch(:orientation)

                    self.values = Hash['out' => pose_stamped]
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
