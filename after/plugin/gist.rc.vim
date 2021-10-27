if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
      " Mac
      let g:gist_clip_command = 'pbcopy'
  else
      " Linux
      let g:gist_clip_command = 'xclip -selection clipboard'
  endif
endif


let g:github_user = "AlanJui"
let g:gist_token = "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"
