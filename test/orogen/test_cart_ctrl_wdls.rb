# frozen_string_literal: true

using_task_library 'cart_ctrl_wdls'

require 'hello_world/models/profiles/gazebo/ur10_base'

module OroGen
    describe cart_ctrl_wdls.WDLSSolver do
        before do
            test_model = SDF::Model.from_xml_string(
                <<-EOSDF
                <model name='test'>
                    <link name="root_test"/>
                    <link name="tip_test"/>
                </model>
                EOSDF
            )
            
            @profile = flexmock(sdf_model: test_model)
        end

        it "sets the robot_model from its ':robot' argument" do
            syskit_stub_conf(
                OroGen.cart_ctrl_wdls.WDLSSolver, 'default',
                data: { 'root' => 'test::root_test', 'tip' => 'test::tip_test' }
            )

            task = syskit_stub_deploy_and_configure(
                OroGen.cart_ctrl_wdls.WDLSSolver
                    .with_arguments(robot: @profile)
            )

            assert_equal("<sdf>#{@profile.sdf_model.to_xml_string}</sdf>", task.properties.robot_model)
            assert_equal(:ROBOT_MODEL_SDF, task.properties.robot_model_format)
        end

        it "raises if the root link does not exists" do
            syskit_stub_conf(
                OroGen.cart_ctrl_wdls.WDLSSolver, 'default',
                data: { 'root' => 'none', 'tip' => 'test::tip_test'}
            )

            assert_raises(ArgumentError) do
                syskit_stub_deploy_and_configure(
                    OroGen.cart_ctrl_wdls.WDLSSolver
                        .with_arguments(robot: @profile)
                )
            end
        end

        it "raises if the tip link does not exist" do
            syskit_stub_conf(
                OroGen.cart_ctrl_wdls.WDLSSolver, 'default',
                data: {'root' => 'test::root_test', 'tip' => 'none'}
            )

            assert_raises(ArgumentError) do
                syskit_stub_deploy_and_configure(
                    OroGen.cart_ctrl_wdls.WDLSSolver
                        .with_arguments(robot: @profile)
                )
            end
        end
    end

    describe cart_ctrl_wdls.AdaptiveWDLSSolver do
        # AdaptiveWDLSSolver inherits the 'update_properties' from WDLSSolver
    end

    describe cart_ctrl_wdls.CartCtrl do
        it { is_configurable }
    end

    describe cart_ctrl_wdls.ToPosConverter do
        it { is_configurable }
    end
end
