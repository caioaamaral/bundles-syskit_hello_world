# frozen_string_literal: true

using_task_library 'cart_ctrl_wdls'

module OroGen
    describe cart_ctrl_wdls.WDLSSolver do
        it { is_configurable }
    end

    describe cart_ctrl_wdls.AdaptiveWDLSSolver do
        it { is_configurable }
    end

    describe cart_ctrl_wdls.CartCtrl do
        it { is_configurable }
    end

    describe cart_ctrl_wdls.ToPosConverter do
        it { is_configurable }
    end
end
