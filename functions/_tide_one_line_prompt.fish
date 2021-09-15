function _tide_one_line_prompt
    set -l left_prompt (_tide_one_line_left_prompt)
    set -l right_prompt (_tide_one_line_right_prompt)

    echo $right_prompt[1]

    math $COLUMNS+5-(string length --visible "$left_prompt[1]""$right_prompt[1]") -$tide_prompt_min_cols | read -lx dist_btwn_sides
    string replace @PWD@ (_tide_pwd) "$left_prompt[1] "
end

function _tide_one_line_left_prompt
    set -g _tide_last_item_was_newline

    _tide_which_side_working_on=left for item in $tide_left_prompt_items
        _tide_item_$item
    end

    set_color $_tide_previous_bg_color -b normal
    echo -ns $tide_left_prompt_suffix
end

function _tide_one_line_right_prompt
    set -g _tide_last_item_was_newline

    _tide_which_side_working_on=right for item in $tide_right_prompt_items
        _tide_item_$item
    end

    set_color $_tide_previous_bg_color -b normal
    echo -ns $tide_right_prompt_suffix
end

function _tide_item_pwd
    _tide_print_item pwd @PWD@
end
