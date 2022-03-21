# frozen_string_literal: true

module HelloWorld
    describe Robot do
        run_on_robot "gazebo"

        describe "the controller block" do
            it "can be executed" do
                execute_robot_controller

                # Actually check the resulting plan
            end
        end
    end
end
