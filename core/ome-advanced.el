(defun ome-evil-setup ()
  (define-key evil-insert-state-map (kbd "C-[") 'evil-force-normal-state)
  (setq evil-auto-indent t)
  (setq evil-regexp-search t)
  (setq evil-want-C-i-jump t)
  (add-hook 'text-mode-hook 'turn-on-evil-mode)
  (add-hook 'prog-mode-hook 'turn-on-evil-mode)
  (add-hook 'comint-mode-hook 'turn-on-evil-mode)
  (add-hook 'Info-mode-hook 'turn-off-evil-mode))

(ome-install 'evil)

(defun ome-evil-leader-setup ()
  (evil-leader/set-leader "<SPC>")
  (unless (featurep 'helm)
    (evil-leader/set-key
      "e" 'find-file
      "b" 'switch-to-buffer))
  (eval-after-load "helm"
    (evil-leader/set-key
      "f" 'helm-for-files
      "l" 'helm-locate
      "c" 'helm-colors
      "y" 'helm-show-kill-ring
      "t" 'helm-top
      "m" 'helm-man-woman
      "o" 'helm-occur
      "j" 'helm-M-x
      "e" 'helm-find-files
      "b" 'helm-buffers-list))
  (eval-after-load "expand-region"
    (progn
      (setq expand-region-contract-fast-key "z")
      (evil-leader/set-key "xx" 'er/expand-region)))
  (eval-after-load "magit"
    (evil-leader/set-key "g" 'magit-status))
  (eval-after-load "git-gutter-mode"
    (evil-leader/set-key
      "s" 'git-gutter:stage-hunk
      "n" 'git-gutter:next-hunk
      "p" 'git-gutter:previous-hunk))
  (evil-leader/set-key
    "k" 'kill-buffer)
  (global-evil-leader-mode))

(ome-install 'evil-leader)

(ome-install 'evil-surround)

(defun ome-expand-region-setup ()
  (global-set-key (kbd "C-=") 'er/expand-region))

(ome-install 'expand-region)

(defun ome-ace-jump-mode-setup ()
  (when (and (featurep 'evil) (featurep 'evil-leader))
    (evil-leader/set-key
      "c" 'ace-jump-char-mode
      "w" 'ace-jump-word-mode
      "l" 'ace-jump-line-mode)))

(ome-install 'ace-jump-mode)

(when (or (executable-find "ack") (executable-find "ack-grep"))
  (ome-install 'ack-and-a-half))

(when (executable-find "ag")
  (ome-install 'ag))
