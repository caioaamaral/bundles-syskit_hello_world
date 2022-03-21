# frozen_string_literal: true

using_task_library 'robot_frames'

module OroGen
    describe robot_frames.Task do
        it { is_configurable }
    end

    describe robot_frames.ChainPublisher do
        it { is_configurable }
    end

    describe robot_frames.SingleChainPublisher do
        it { is_configurable }
    end
end
