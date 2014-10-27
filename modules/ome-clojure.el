(ome-install 'clojure-mode)

(defun ome-cider-setup ()
  (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
  (setq cider-repl-tab-command 'indent-for-tab-command)
  (setq cider-repl-pop-to-buffer-on-connect nil)
  (setq cider-popup-stacktraces nil)
  (setq cider-repl-popup-stacktraces t)
  (setq cider-auto-select-error-buffer t)
  (setq nrepl-hide-special-buffers t)
  (setq nrepl-buffer-name-separator "-")
  (setq nrepl-buffer-name-show-port t))

(ome-install 'cider)

(defun ome-ac-nrepl-setup ()
  (add-hook 'cider-mode-hook 'ac-nrepl-setup)
  (add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
  (eval-after-load "auto-complete"
    '(add-to-list 'ac-modes 'cider-repl-mode)))

(ome-install 'ac-nrepl)
