"" Create Tags Function

function s:JobHandler(job_id, data, event) dict
  if a:event == 'stdout'
    let str = self.shell.' stdout: '.join(a:data)
  elseif a:event == 'stderr'
    let str = self.shell.' stderr: '.join(a:data)
  else
    let str = self.shell.' finished executing '. a:data
  endif

  echom str
endfunction

function s:FinishedTagsHandler(job_id, exit_code, event) dict
  if a:exit_code == 0
    " required due to SSHFS bug where files created via a remote script aren't
    " recognized or present via the SSHFS. A touch call seems to fix this
    call jobstart(['bash', '-c', 'touch .git/tags'], extend({'shell': 'touch ctags'}, s:touchCallbacks))
    let str = self.shell.' finished executing. Exit code: '.a:exit_code
    echom str
  endif
endfunction

" create ctags
" TODO: create ctags for BOTH project dir and global dirs (ie $HOME . '.tags/')
if !exists(':call CreateDevboxTags')
  function CreateDevboxTags()
    " set tag_name to project_directory.filetype.tags
    "let l:tag_name = split(getcwd(), '/')[-1] . '.tags'
    " generate ctags (relative to the directory they're being generated in, ie .git/)
    "silent execute "!ctags --tag-relative -R -f .git/tags &> /dev/null"
    " The devbox equivalent runs the following remote bash script instead of
    " performing it over sshfs:
    "   bash -c 'ssh -A $DEVBOX "~/.scripts/generate_ctags.sh project_name"'
    let project_name = split(getcwd(), '/')[-1]
    let remote_host = $DEVBOX
    let generate_tags_cmd = '"~/.scripts/generate_ctags.sh ' . project_name . '"'
    let ssh_cmd = join(['ssh', '-A', remote_host, generate_tags_cmd], ' ')
    let bash_cmd = ['bash', '-c', ssh_cmd]

    call jobstart(bash_cmd, extend({'shell': 'ctags generator'}, s:sshCallbacks))
  endfunction
endif

if !exists(':call CreateLocalTags')
  function CreateLocalTags()
    let generate_tags_cmd = '"~/.scripts/generate_ctags.sh ' . getcwd() . '"'
    let bash_cmd = ['bash', '-c', generate_tags_cmd]

    call jobstart(bash_cmd, extend({'shell': 'ctags generator'}, s:localCallbacks))
  endfunction
endif

let s:touchCallbacks = {
\ 'on_stdout': function('s:JobHandler'),
\ 'on_stderr': function('s:JobHandler')
\ }

let s:localCallbacks = {
\ 'on_stdout': function('s:JobHandler'),
\ 'on_stderr': function('s:JobHandler'),
\ 'on_exit': function('s:JobHandler')
\ }

let s:sshCallbacks = {
\ 'on_stdout': function('s:JobHandler'),
\ 'on_stderr': function('s:JobHandler'),
\ 'on_exit': function('s:FinishedTagsHandler')
\ }
