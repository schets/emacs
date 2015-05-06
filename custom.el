;;; This file contains some temporary code snippets, it will be loaded after
;;; various oh-my-emacs modules. When you just want to test some code snippets
;;; and don't want to bother with the huge ome.*org files, you can put things
;;; here.

;;; You email address
(setq user-mail-address "samschet@gmail.com")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(load (expand-file-name "~/quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
(setq
 slime-lisp-implementations
 '((sbcl ("sbcl" "--dynamic-space-size" "1024"))))
;;; Calendar settings
;; you can use M-x sunrise-sunset to get the sun time
(setq calendar-latitude 30.37)
(setq calendar-longitude -97.79)
(setq calendar-location-name "Austin, Texas, U.S.")
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(load "escreen")
(escreen-install)

(setenv "PATH" (concat "/usr/local/bin/sbt/bin:" (getenv "PATH")))
(setenv "PATH" (concat "/usr/local/bin/scala/bin:" (getenv "PATH")))
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setenv "PATH" (concat (getenv "PATH") ":/usr/bin"))
(setenv "PATH" (concat (getenv "PATH") ":/Users/sams/.cabal/bin"))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(electric-indent-mode +1)

(add-hook
 'rst-mode-hook
 (lambda ()
   (add-hook
	'electric-indent-functions
	(lambda () 'no-indent) nil 'local)))


(add-to-list 'load-path "/mydirs/rust-mode/")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)

(defun my-haskell-mode-hook ()
  (haskell-indentation-mode 1)
  (haskell-indent-mode -1c)

  ;; further customisations go here.  For example:
  (setq locale-coding-system 'utf-8 )
  (flyspell-prog-mode)  ;; spell-checking in comments and strings
  ;; etc.      

  )

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'typed-clojure-mode)
(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'cider-mode-hook 'company-mode)
(add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'company-mode)
;;; Time related settings
;; show time in 24hours format
(setq display-time-24hr-format t)
;; show time and date
(setq display-time-and-date t)
;; time change interval
(setq display-time-interval 10)
;; show time
(display-time-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-modes
   (quote
	(org-mode text-mode emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode malabar-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode less-css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode ts-mode sclang-mode verilog-mode qml-mode)))
 '(c-basic-offset (quote set-from-style))
 '(c-default-style
   (quote
	((c-mode . "")
	 (c++-mode . "")
	 (java-mode . "java")
	 (awk-mode . "awk")
	 (other . "gnu"))))
 '(c-doc-comment-style
   (quote
	((c-mode . gtkdoc)
	 (c++-mode)
	 (java-mode . javadoc)
	 (pike-mode . autodoc))))
 '(c-hanging-semi&comma-criteria (quote set-from-style))
 '(c-syntactic-indentation t)
 '(cider-annotate-completion-candidates t)
 '(company-auto-complete (quote (quote company-explicit-action-p)))
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
	("e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "943bff6eada8e1796f8192a7124c1129d6ff9fbd1a0aed7b57ad2bf14201fdd4" default)))
 '(elpy-default-minor-modes (quote (eldoc-mode yas-minor-mode auto-complete-mode)))
 '(elpy-rpc-backend nil)
 '(ensime-sbt-command "/usr/local/bin/sbt")
 '(evil-mode t)
 '(flycheck-gcc-language-standard "c++11")
 '(global-smart-tab-mode t)
 '(haskell-font-lock-symbols nil)
 '(haskell-interactive-popup-errors nil)
 '(haskell-mode-hook
   (quote
	(turn-on-eldoc-mode turn-on-haskell-decl-scan turn-on-haskell-doc turn-on-haskell-indentation turn-on-haskell-doc-mode)) t)
 '(haskell-notify-p t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
	(solarized-color-blend it "#002b36" 0.25)
	(quote
	 ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
	(("#073642" . 0)
	 ("#546E00" . 20)
	 ("#00736F" . 30)
	 ("#00629D" . 50)
	 ("#7B6000" . 60)
	 ("#8B2C02" . 70)
	 ("#93115C" . 85)
	 ("#073642" . 100))))
 '(inhibit-startup-screen t)
 '(python-indent-guess-indent-offset nil)
 '(show-smartparens-global-mode nil)
 '(smartparens-global-mode nil)
 '(smartparens-global-strict-mode nil)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#839496" 0.2))
 '(sp-show-pair-from-inside t)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(typescript-mode-hook (quote (turn-on-evil-mode)))
 '(weechat-color-list
   (quote
	(unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(yas-global-mode nil nil (yasnippet)))
(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-x C-d") nil)
     (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
     (define-key haskell-mode-map (kbd "C-c C-b") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c M-.") nil)
     (define-key haskell-mode-map (kbd "C-c C-d") nil)))

(add-hook 'term-mode-hook (lambda()
							(setq yas-dont-activate t)))
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/bin")

(defconst my-cc-style
  '("stroustrup"
    (c-offsets-alist . ((innamespace . 0)))))
(c-add-style "my-cc-mode" my-cc-style)

(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode t)

(setq-default indent-tabs-mode t)
(add-hook 'python-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(smart-tabs-add-language-support c++ c++-mode-hook
  ((c-indent-line . c-basic-offset)
   (c-indent-region . c-basic-offset)))

(setq-default tab-width 4)
(setq cua-auto-tabify-rectangles nil)

(defadvice align (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice align-regexp (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice indent-relative (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice indent-according-to-mode (around smart-tabs activate)
  (let ((indent-tabs-mode indent-tabs-mode))
    (if (memq indent-line-function
              '(indent-relative
                indent-relative-maybe))
        (setq indent-tabs-mode nil))
    ad-do-it))

(defmacro smart-tabs-advice (function offset)
  `(progn
     (defvaralias ',offset 'tab-width)
     (defadvice ,function (around smart-tabs activate)
       (cond
        (indent-tabs-mode
         (save-excursion
           (beginning-of-line)
           (while (looking-at "\t*\\( +\\)\t+")
             (replace-match "" nil nil nil 1)))
         (setq tab-width tab-width)
         (let ((tab-width fill-column)
               (,offset fill-column)
               (wstart (window-start)))
           (unwind-protect
               (progn ad-do-it)
             (set-window-start (selected-window) wstart))))
        (t
         ad-do-it)))))

(smart-tabs-advice c-indent-line c-basic-offset)
(smart-tabs-advice c-indent-region c-basic-offset)


(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(require 'cl)

(defun file-in-directory-list-p (file dirlist)
  "Returns true if the file specified is contained within one of
the directories in the list. The directories must also exist."
  (let ((dirs (mapcar 'expand-file-name dirlist))
        (filedir (expand-file-name (file-name-directory file))))
    (and
     (file-directory-p filedir)
     (member-if (lambda (x) ; Check directory prefix matches
                  (string-match (substring x 0 (min(length filedir) (length x))) filedir))
                dirs))))

(defun buffer-standard-include-p ()
  "Returns true if the current buffer is contained within one of
the directories in the INCLUDE environment variable."
  (and (getenv "INCLUDE")
       (file-in-directory-list-p buffer-file-name (split-string (getenv "INCLUDE") path-separator))))

(add-to-list 'magic-fallback-mode-alist '(buffer-standard-include-p . c++-mode))

                                        ; style I want to use in c++ mode
(defun my-c++-mode-hook ()
  (c-set-style "my-cc-mode")        ; use my-style defined above
  (auto-fill-mode)         
  (c-toggle-auto-hungry-state 1))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(smart-tabs-advice c-indent-line c-basic-offset)
(smart-tabs-advice c-indent-region c-basic-offset) 

(linum-relative-toggle)

(global-set-key "\M-\r" 'shell-resync-dirs)

(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-n") 'mc/mark-more-like-this-extended)

(defun sp-raise-current-sexp (&optional arg)
  (interactive "P")
  (sp-backward-up-sexp arg)
  (sp-splice-sexp-killing-around arg))

;; better smartparens keybindings
(let ((map smartparens-mode-map))		;
  ;; Movement and navigation
  (define-key map (kbd "C-M-f") #'sp-forward-sexp)
  (define-key map (kbd "C-M-b") #'sp-backward-sex)
  (define-key map (kbd "C-M-u") #'sp-backward-up-sexp)
  (define-key map (kbd "C-M-d") #'sp-down-sexp)
  (define-key map (kbd "C-M-p") #'sp-backward-down-sexp)
  (define-key map (kbd "C-M-n") #'sp-up-sexp)
  ;; Deleting and killing
  (define-key map (kbd "C-M-k") #'sp-kill-sexp)
  (define-key map (kbd "C-M-w") #'sp-copy-sexp)
  ;; Depth changing
  (define-key map (kbd "M-s") #'sp-splice-sexp)
  (define-key map (kbd "M-<up>") #'sp-splice-sexp-killing-backward)
  (define-key map (kbd "M-<down>") #'sp-splice-sexp-killing-forward)
  (define-key map (kbd "M-r") #'sp-splice-sexp-killing-around)
  (define-key map (kbd "M-R") #'sp-raise-current-sexp)
  (define-key map (kbd "M-?") #'sp-convolute-sexp)
  ;; Barfage & Slurpage
  (define-key map (kbd "C-)")  #'sp-forward-slurp-sexp)
  (define-key map (kbd "C-<right>") #'sp-forward-slurp-sexp)
  (define-key map (kbd "C-}")  #'sp-forward-barf-sexp)
  (define-key map (kbd "C-<left>") #'sp-forward-barf-sexp)
  (define-key map (kbd "C-(")  #'sp-backward-slurp-sexp)
  (define-key map (kbd "C-M-<left>") #'sp-backward-slurp-sexp)
  (define-key map (kbd "C-{")  #'sp-backward-barf-sexp)
  (define-key map (kbd "C-M-<right>") #'sp-backward-barf-sexp)
  ;; Miscellaneous commands
  (define-key map (kbd "M-S") #'sp-split-sexp)
  (define-key map (kbd "M-J") #'sp-join-sexp)
  (define-key map (kbd "C-M-t") #'sp-transpose-sexp))

;; Some additional bindings for strict mode
(let ((map smartparens-strict-mode-map))
  (define-key map (kbd "M-q") #'sp-indent-defun)
  (define-key map (kbd "C-j") #'sp-newline))

(smartparens-global-mode)
(show-smartparens-global-mode)          ; Show parenthesis
(global-flycheck-mode)


(defun my-bell-function ()
  (unless (memq this-command
                '(isearch-abort abort-recursive-edit exit-minibuffer
                                keyboard-quit mwheel-scroll down up next-line previous-line
                                backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time

(global-set-key (kbd "M-x") 'execute-extended-command)
(setq ac-disable-faces nil)


;;(require 'ido)
;;(ido-mode t)
(setq backup-directory-alist `(("." . "~/.saves")))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load "~/.emacs.d/themes/zenburn.el")
(load "~/.emacs.d/keychord.el")
(key-chord-mode 1) 
(key-chord-define evil-insert-state-map ";;" 'evil-normal-state)

(elpy-use-cpython)
;;; Some tiny tool functions
(defun replace-all-chinese-quote ()
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (replace-regexp  "”\\|“" "\"")
    (mark-whole-buffer)
    (replace-regexp "’\\|‘" "'")))

;; Comment function for GAS assembly language
(defun gas-comment-region (start end)
  "Comment region for AT&T syntax assembly language The default
comment-char for gas is ';', we need '#' instead"
  (interactive "r")
  (setq end (copy-marker end t))
  (save-excursion
    (goto-char start)
    (while (< (point) end)
      (beginning-of-line)
      (insert "# ")
      (next-line))
    (goto-char end)))

(defun gas-uncomment-region (start end)
  "Uncomment region for AT&T syntax assembly language the
inversion of gas-comment-region"
  (interactive "r")
  (setq end (copy-marker end t))
  (save-excursion
    (goto-char start)
    (while (< (point) end)
      (beginning-of-line)
      (if (equal (char-after) ?#)
          (delete-char 1))
      (next-line))
    (goto-char end)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

