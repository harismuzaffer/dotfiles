"when hitting Tab/Backspace keys, how far should cursor move...This is
"different from length of Tab character. When expandtab is on, then there will
"be no Tab character at all- meaning hitting Tab key will enter spaces...equivalent
"to the number specified in softtabstop. If expandtab is off, then hitting Tab
"will enter both, the Tab characters and spaces depending on the value of
"tabstop. For example, if tabstop is 8 and softtabstop is 4, then hitting Tab
"key will enter 4 spaces first time then on second hit, it will convert all
"the 8 spaces into one Tab character. Hitting Tab 5 times will enter 2 Tab
"characters and 4 spaces.
set softtabstop=4

"When indenting using >, < or =, how much to shift
set shiftwidth=4

