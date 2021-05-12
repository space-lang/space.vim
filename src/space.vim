if exists('b"current_syntax')
    finish
endif

let b:current_syntax = "space"

sy match  spaceValue                    "\v^Value\s" nextgroup=spaceOption,spaceVar skipwhite
sy match  spaceVar          contained   "\v\S+" nextgroup=textfsmRegex skipwhite
sy match  spaceOption       contained   "\v<((Filldown|Key|Required|List|Fillup),?)+>" nextgroup=textfsmVar,textfsmRegex skipwhite
sy match  spaceRegex        contained   "\v\(.*\)"hs=s+1,he=e-1

sy match  spaceState                    "\v^\w+\s*$" nextgroup=textfsmRule,textfsmStateComment skipnl

sy region spaceRule         contained start="\v^\s\s?\^" end="$"  end="\s->" contains=textfsmRuleVar,textfsmArrow nextgroup=textfsmRule,textfsmStateComment skipnl skipwhite
sy match  spaceRuleVar      contained "\v\$\w+"
sy match  spaceRuleVar      contained "\v\$\{\w+\}"

sy match  spaceCommentSL    "^\s*--.*"
" sy match  spaceCommentML