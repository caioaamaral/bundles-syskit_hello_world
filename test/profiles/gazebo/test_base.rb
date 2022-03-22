# frozen_string_literal: true

require "models/profiles/gazebo/ur10_base"

module HelloWorld
    module Profiles
        module Gazebo #:nodoc:
            describe UR10Base do
                # Verifies that the only variation points in the profile are
                # profile tags. If you want to limit the test to certain
                # definitions,
                # give them as argument
                #
                # You usually want this. Really. Keep it there.
                it { is_self_contained }

                # If you really really want to allow some definitions to
                # NOT be self-contained (but you really do not, trust me),
                # you can call assert_is_self_contained with
                # specific definitions
                # it "has only a_def self-contained" do
                #    assert_is_self_contained a_def
                # end

                # Test if all definitions can be instanciated, i.e. are
                # well-formed networks with no data services
                #
                # In principle you could remove the self-contained test above,
                # but that would mean that, were you to disable this test you
                # would not check for the profile being self-contained. And
                # that's a bad idea. Keep both.
                it { can_instanciate }

                # If only parts of the profile should be instanciated, you can
                # call assert_can_instanciate with specific definitions
                # it { can_instanciate a_def }

                # call assert_can_instanciate with specific definitions
                # it { can_instanciate a_def }

                # Test if specific definitions can be deployed, i.e. are
                # ready to be started. You want this on the "final"
                # profiles (i.e. the definitions you will actually run
                # on the robot)
                #
                # In principle you could avoid testing for instanciation and/or
                # self-contained properties, but it is advisable to keep them.
                # Were you to disable this test you would not check for
                # them anymore. And that's a bad idea. Keep all.
                it { can_deploy }

                # If only parts of the profile should be deployd, you can
                # call assert_can_deploy with specific definitions
                # it { can_deploy a_def }

                # If you want to verify properties when some actions are
                # present in the same network use the _together variants:
                # it { can_instanciate_together a_def, another_def }
                # it { can_deploy_together a_def, another_def }

                # See the documentation of Syskit::Test::ProfileAssertions
                # for more
            end
        end
    end
end
