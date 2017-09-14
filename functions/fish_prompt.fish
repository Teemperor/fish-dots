function fish_prompt
	set_color $fish_color_cwd
	
	set cols (tput cols)
    echo -n "-❰"
    
    
    set l_pwd (prompt_pwd)
    set l_pwd_size (echo -n "$l_pwd" | wc -c)
    set_color $fish_color_cwd_root
    echo -n "$l_pwd"
	set_color $fish_color_cwd
    echo -n "❱━"
    
    
    set l_time (date "+%e.%m %R")
    set l_time_size  (echo -n "$l_time" | wc -c)
    
    git status 2>/dev/null >/dev/null
    if test $status -eq 0
        # Get number of files added to the index (but uncommitted)
        set l_add_n (git status --porcelain 2>/dev/null| grep "^M" | wc -l)

        # Get number of files that are uncommitted and not added
        set l_unc_n (git status --porcelain 2>/dev/null| grep "^ M" | wc -l)
        
        set l_git_branch (git branch | grep "* " | cut -c 3- | string trim)
        set l_git_branch_size  (echo -n "$l_git_branch" | wc -c)

        echo -n "❰git⇉"
        set_color $fish_color_host
        echo -n $l_git_branch
        set_color $fish_color_cwd
        
        if test \( $l_unc_n -gt 0 \) -o \( $l_add_n -gt 0 \)
            echo -n "⇉"
            set l_git_branch_size  (echo "$l_git_branch_size+1" | bc)
            
            if test $l_unc_n -gt 0
                set_color $fish_color_host
                echo -n "?"
                set l_git_branch_size  (echo "$l_git_branch_size+1" | bc)
            end
            
            if test $l_add_n -gt 0
                set_color $fish_color_host
                echo -n "+"
                set l_git_branch_size  (echo "$l_git_branch_size+1" | bc)
            end
            
            set_color $fish_color_host
        end
        
        echo -n "❱"
    else
        set l_git_branch_size 0
    end
    
    set remaining_size (echo "$cols-$l_pwd_size-$l_time_size-$l_git_branch_size-14" | bc)
    
    for i in (seq 0 $remaining_size); echo -n "━"; end
    
    set_color normal
    echo -n "❰$l_time❱"
	set_color $fish_color_cwd
    echo -n "━"
    
    echo ""
    set_color normal
    echo -n '> '
end
