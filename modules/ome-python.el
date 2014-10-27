(when (version< emacs-version "24.3")
  (ome-install 'python24))

(defun ome-elpy-setup ()
  (elpy-enable t)
  (setq elpy-rpc-backend "jedi")
  (when (executable-find "ipython")
    (elpy-use-ipython))
  (when (el-get-package-installed-p 'flycheck)
    (setq elpy-default-minor-modes
          (remove 'flymake-mode
                  elpy-default-minor-modes)))
  (define-key python-mode-map (kbd "RET")
    'newline-and-indent)
  (add-hook 'python-mode-hook
            (lambda () (set (make-local-variable 'comment-inline-offset) 2))))

(ome-install 'elpy)

(add-to-list 'auto-mode-alist '("\\.wsgi\\'" . python-mode))
