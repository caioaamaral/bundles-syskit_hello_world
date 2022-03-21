# frozen_string_literal: true

require "models/compositions/arm_cartesian_control_wdls"

module HelloWorld
    module Compositions #:nodoc:
        describe ArmCartesianControlWdls do
            it "starts" do
                # Note, you might want to inject specific children
                # here, but it is not strictly required. The syskit_stub_*
                # methods generate what is needed to have a run-able
                # composition
                cmp_task = syskit_stub_deploy_configure_and_start(
                    ArmCartesianControlWdls
                )

                # At this point, cmp_task and all its children are started
                # and can be manipulated

                # Task contexts are stubs, so you can read input ports and
                # write output ports by accessing them with e.g.
                # sample =
                #     expect_execution do
                #         syskit_write cmp_task.my_child.an_output_port, test_sample
                #     end.to { have_one_new_sample cmp_task.my_child.an_input_port }
                # assert_equal 10, sample.value
            end
        end
    end
end
