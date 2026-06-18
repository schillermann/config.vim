vim9script

def GitBranchName(): string
  var branch = trim(system("git rev-parse --abbrev-ref HEAD 2>/dev/null"))
  return len(branch) > 0 ? branch : 'none'
enddef

command! BranchName echo $'branch: {GitBranchName()}'
