;;; This file contains some temporary code snippets, it will be loaded after
;;; various oh-my-emacs modules. When you just want to test some code snippets
;;; and don't want to bother with the huge ome.*org files, you can put things
;;; here.

;;; You email address
(setq user-mail-address "samschet@gmail.com")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;; Calendar settings
;; you can use M-x sunrise-sunset to get the sun time
(setq calendar-latitude 30.37)
(setq calendar-longitude -97.79)
(setq calendar-location-name "Austin, Texas, U.S.")

;;; Time related settings
;; show time in 24hours format
(setq display-time-24hr-format t)
;; show time and date
(setq display-time-and-date t)
;; time change interval
(setq display-time-interval 10)
;; show time
(display-time-mode t)

(add-hook 'term-mode-hook (lambda()
			    (setq yas-dont-activate t)))

(highlight-indentation-mode -1)
(linum-relative-toggle)

(global-set-key "\M-\r" 'shell-resync-dirs)

(add-hook 'after-init-time #'global-flycheck-mode)

;; better smartparens keybindings
(let ((map smartparens-mode-map))
  ;; Movement and navigation
  (define-key map (kbd "C-M-f") #'sp-forward-sexp)
  (define-key map (kbd "C-M-b") #'sp-backward-sexp)
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


(defun my-bell-function ()
  (unless (memq this-command
		'(isearch-abort abort-recursive-edit exit-minibuffer
				keyboard-quit mwheel-scroll down up next-line previous-line
				backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)


(elpy-use-ipython)

(global-set-key (kbd "M-x") 'execute-extended-command)
(setq ac-disable-faces nil)


;;(require 'ido)
;;(ido-mode t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load "~/.emacs.d/themes/zenburn.el")
(load "~/.emacs.d/keychord.el")
(key-chord-mode 1) 
(key-chord-define evil-insert-state-map ";;" 'evil-normal-state)

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "943bff6eada8e1796f8192a7124c1129d6ff9fbd1a0aed7b57ad2bf14201fdd4" default)))
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
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#839496" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
