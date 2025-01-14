alias counttime_check="$dir/counttime_check"

# zle-line-init widget (don't redefine if already defined)
(( ! ${+functions[_counttime_zle-line-init]} )) || return 0

# Get the directory of this file
dir="$(dirname "$0")"

case "$widgets[zle-line-init]" in
  # Simply define the function if zle-line-init doesn't yet exist
  builtin|"") function _counttime_zle-line-init() {
      ($dir/counttime &> /dev/null)
    } ;;
  # Override the current zle-line-init widget, calling the old one
  user:*) zle -N _counttime_orig_zle-line-init "${widgets[zle-line-init]#user:}"
    function _counttime_zle-line-init() {
      ($dir/counttime &> /dev/null)
      zle _counttime_orig_zle-line-init -- "$@"
    } ;;
esac

zle -N zle-line-init _counttime_zle-line-init
