# 0.3.0

## Changing philosophy of the current template

> root => app[], package[], domain + ...more

- The root folder of the project clean from any code specifics
- The each app itself is become dynamic workspace-root
- The package folder contains all libs, that can reuse any app
- The app folder contains these apps

---

#### What is dynamic workspace root?

Simply speaking, thanks to justfile, the project can be easily reopened one
level deeper with root of some of the apps.

#### How packages will be accessed?

By linking. So any member of package can be linked to any app and become
app/lib/member.

---

- new task - `just format_all_justfiles`
































[ids]

*

[main]
capslock = overload(nav, esc)
leftshift+rightshift = capslock
[nav]
h = left
j = down
k = up
l = right
] = macro(C-tab)
[ = macro(C-S-tab)
enter = macro(C-r)
space = overload(extra, noop)

[extra]
h = home
j = pagedown
k = pageup
l = end

6 = :
4 = ;
c = ,
d = .
s = /
1 = v
2 = b
