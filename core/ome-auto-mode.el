(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))

(defun ome-puppet-mode-setup ()
  (when (featurep 'evil)
    (add-hook 'puppet-mode-hook 'turn-on-evil-mode)))

(ome-install 'puppet-mode)

(when (executable-find "pacman")
  (ome-install 'pkgbuild-mode))

(defun ome-wikipedia-mode-setup ()
  (add-to-list 'auto-mode-alist
               '("\\.wiki\\'" . wikipedia-mode)))

(ome-install 'wikipedia-mode)

(defun ome-yaml-mode-setup ()
  (add-hook 'yaml-mode-hook
            (lambda ()
              (linum-mode 1))))

(ome-install 'yaml-mode)
