;; This file is where you put your includes so company ("complete anything")
;; can find them. Put this file in your project root.

((nil . ((company-clang-arguments . ("-I/home/<user>/project_root/include1/"
                                     "-I/home/<user>/project_root/include2/")))))

;; In the above example, nil means apply the settings to any file or sub-directory visited. If non-nil, you have to specify a major mode and the settings are applied to major modes only. You set company-clang to c-mode and c++-mode anyway, so there's no problem setting major mode to nil. The remaining is a key-value pair of variable and value of that variable. company-clang-arguments is where you can tell include paths, and it takes a list of strings of include paths, as you can see above. After that, company-clang can see include paths in your project. If you add something new, like an include path, to your .dir-locals.el and is editing some source file, reopen the file for the new values to take effect. 
