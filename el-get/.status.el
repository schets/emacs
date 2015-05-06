((ac-company status "installed" recipe
	     (:name ac-company :website "http://github.com/buzztaiki/auto-complete" :description "company backend for auto-complete" :type http :url "https://raw.github.com/buzztaiki/auto-complete/master/ac-company.el" :depends
		    (auto-complete company-mode)))
 (ace-jump-mode status "installed" recipe
		(:name ace-jump-mode :website "https://github.com/winterTTr/ace-jump-mode/wiki" :description "A quick cursor location minor mode for emacs." :type github :pkgname "winterTTr/ace-jump-mode"))
 (auto-complete status "installed" recipe
		(:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
		       (popup fuzzy)
		       :features auto-complete-config :post-init
		       (progn
			 (add-to-list 'ac-dictionary-directories
				      (expand-file-name "dict" default-directory))
			 (ac-config-default))))
 (auto-complete-clang status "installed" recipe
		      (:name auto-complete-clang :website "https://github.com/brianjcj/auto-complete-clang" :description "Auto-complete sources for Clang. Combine the power of AC, Clang and Yasnippet." :type github :pkgname "brianjcj/auto-complete-clang" :depends auto-complete))
 (auto-complete-exuberant-ctags status "installed" recipe
				(:name auto-complete-exuberant-ctags :auto-generated t :type elpa :description "Exuberant ctags auto-complete.el source" :repo nil :depends
				       (auto-complete)))
 (buffer-move status "installed" recipe
	      (:name buffer-move :description "Swap buffers without typing C-x b on each window" :type emacswiki :features buffer-move))
 (cider status "installed" recipe
	(:name cider :description "CIDER is a Clojure IDE and REPL." :type github :pkgname "clojure-emacs/cider" :depends
	       (dash queue clojure-mode pkg-info)))
 (cl-lib status "installed" recipe
	 (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (clojure-mode status "installed" recipe
	       (:name clojure-mode :website "https://github.com/clojure-emacs/clojure-mode" :description "Emacs support for the Clojure language." :type github :pkgname "clojure-emacs/clojure-mode"))
 (cmake-mode status "installed" recipe
	     (:name cmake-mode :website "http://www.itk.org/Wiki/CMake/Editors/Emacs" :description "Provides syntax highlighting and indentation for CMakeLists.txt and *.cmake source files." :type http :url "http://cmake.org/gitweb?p=cmake.git;a=blob_plain;hb=master;f=Auxiliary/cmake-mode.el"))
 (company-mode status "installed" recipe
	       (:name company-mode :website "http://company-mode.github.io/" :description "Modular in-buffer completion framework for Emacs" :type github :pkgname "company-mode/company-mode"))
 (ctable status "installed" recipe
	 (:name ctable :description "Table Component for elisp" :type github :pkgname "kiwanami/emacs-ctable"))
 (ctags status "installed" recipe
	(:name ctags :type hg :url "https://bitbucket.org/semente/ctags.el" :description "Exuberant Ctags utilities for Emacs" :website "https://bitbucket.org/semente/ctags.el"))
 (ctags-update status "installed" recipe
	       (:name ctags-update :auto-generated t :type elpa :description "(auto) update TAGS in parent directory using exuberant-ctags" :repo nil))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (deferred status "installed" recipe
   (:name deferred :description "Simple asynchronous functions for emacs lisp." :type github :pkgname "kiwanami/emacs-deferred"))
 (diminish status "installed" recipe
	   (:name diminish :description "An Emacs package that diminishes the amount of space taken on the mode line by the names of minor modes." :type http :url "http://www.eskimo.com/~seldon/diminish.el" :features diminish))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
		("el-get.*\\.el$" "methods/")
		:load "el-get.el"))
 (elpy status "installed" recipe
       (:name elpy :website "https://github.com/jorgenschaefer/elpy" :description "Emacs Python Development Environment" :type github :pkgname "jorgenschaefer/elpy" :checkout "v1.3.0" :shallow nil :post-init
	      (el-get-envpath-prepend "PYTHONPATH" default-directory)
	      :depends
	      (auto-complete yasnippet highlight-indentation find-file-in-project idomenu iedit nose jedi rope pyvenv)))
 (ensime status "installed" recipe
	 (:name ensime :description "ENhanced Scala Interaction Mode for Emacs" :type github :pkgname "ensime/ensime-emacs" :depends
		(s dash popup auto-complete scala-mode2)
		:prepare
		(progn
		  (autoload 'ensime-scala-mode-hook "ensime")
		  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook))))
 (epc status "installed" recipe
      (:name epc :description "An RPC stack for Emacs Lisp" :type github :pkgname "kiwanami/emacs-epc" :depends
	     (deferred ctable)))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (escreen status "installed" recipe
	  (:name escreen :description "Emacs window session manager" :type http :url "http://www.splode.com/~friedman/software/emacs-lisp/src/escreen.el" :prepare
		 (autoload 'escreen-install "escreen" nil t)))
 (evil status "installed" recipe
       (:name evil :website "http://gitorious.org/evil/pages/Home" :description "Evil is an extensible vi layer for Emacs. It\n       emulates the main features of Vim, and provides facilities\n       for writing custom extensions." :type git :url "git://gitorious.org/evil/evil.git" :features evil :depends
	      (undo-tree goto-chg)
	      :build
	      (("make" "all" "info"))
	      :build/berkeley-unix
	      (("gmake" "all" "info"))
	      :build/darwin
	      `(("make" ,(format "EMACS=%s" el-get-emacs)
		 "all" "info"))
	      :info "doc"))
 (evil-leader status "installed" recipe
	      (:name evil-leader :website "http://github.com/cofi/evil-leader" :description "Add <leader> shortcuts to Evil, the extensible vim\n       emulation layer" :type github :pkgname "cofi/evil-leader" :features evil-leader :depends evil))
 (evil-surround status "installed" recipe
		(:name evil-surround :website "http://github.com/timcharper/evil-surround" :description "Emulate Tim Pope's surround.vim in evil, the extensible vim\n       emulation layer for emacs" :type github :pkgname "timcharper/evil-surround" :features evil-surround :post-init
		       (global-evil-surround-mode 1)
		       :depends evil))
 (exec-path-from-shell status "installed" recipe
		       (:name exec-path-from-shell :website "https://github.com/purcell/exec-path-from-shell" :description "Emacs plugin for dynamic PATH loading" :type github :pkgname "purcell/exec-path-from-shell"))
 (expand-region status "installed" recipe
		(:name expand-region :type github :pkgname "magnars/expand-region.el" :description "Expand region increases the selected region by semantic units. Just keep pressing the key until it selects what you want." :website "https://github.com/magnars/expand-region.el#readme"))
 (f status "installed" recipe
    (:name f :website "https://github.com/rejeep/f.el" :description "Modern API for working with files and directories in Emacs" :depends
	   (s dash)
	   :type github :pkgname "rejeep/f.el"))
 (find-file-in-project status "installed" recipe
		       (:name find-file-in-project :type github :pkgname "technomancy/find-file-in-project" :description "Quick access to project files in Emacs"))
 (flycheck status "installed" recipe
	   (:name flycheck :type github :pkgname "flycheck/flycheck" :description "On-the-fly syntax checking extension" :build
		  '(("makeinfo" "-o" "doc/flycheck.info" "doc/flycheck.texi"))
		  :info "./doc" :depends
		  (s dash cl-lib f pkg-info)))
 (flycheck-haskell status "installed" recipe
		   (:name flycheck-haskell :description "Flycheck: Cabal projects and sandboxes." :type github :pkgname "flycheck/flycheck-haskell" :depends
			  (flycheck haskell-mode dash f)
			  :prepare
			  (eval-after-load 'flycheck
			    '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))))
 (fringe-helper status "installed" recipe
		(:name fringe-helper :description "Helper functions for fringe bitmaps." :type github :pkgname "nschum/fringe-helper.el"))
 (fuzzy status "installed" recipe
	(:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (git-gutter status "installed" recipe
	     (:name git-gutter :description "Emacs port of GitGutter Sublime Text 2 Plugin" :website "https://github.com/syohex/emacs-git-gutter" :type github :pkgname "syohex/emacs-git-gutter"))
 (git-gutter-fringe status "installed" recipe
		    (:name git-gutter-fringe :type github :pkgname "syohex/emacs-git-gutter-fringe" :description "Fringe version of git-gutter.el" :depends
			   (git-gutter fringe-helper)))
 (git-modes status "installed" recipe
	    (:name git-modes :description "GNU Emacs modes for various Git-related files" :type github :pkgname "magit/git-modes"))
 (goto-chg status "installed" recipe
	   (:name goto-chg :description "Goto the point of the most recent edit in the buffer." :type emacswiki :features goto-chg))
 (haskell-mode status "installed" recipe
	       (:name haskell-mode :description "A Haskell editing mode" :type github :pkgname "haskell/haskell-mode" :info "." :build
		      `(("make" ,(format "EMACS=%s" el-get-emacs)
			 "all"))
		      :post-init
		      (progn
			(require 'haskell-mode-autoloads)
			(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
			(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation))))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental and narrowing framework" :type github :pkgname "emacs-helm/helm" :build
	      ("make")
	      :build/windows-nt
	      (with-temp-file "helm-autoload.el" nil)))
 (highlight-indentation status "installed" recipe
			(:name highlight-indentation :description "Function for highlighting indentation" :type git :url "https://github.com/antonj/Highlight-Indentation-for-Emacs"))
 (htmlize status "installed" recipe
	  (:type github :pkgname "emacsmirror/htmlize" :name htmlize :website "http://www.emacswiki.org/emacs/Htmlize" :description "Convert buffer text and decorations to HTML." :type emacsmirror :localname "htmlize.el"))
 (hy-mode status "installed" recipe
	  (:name hy-mode :website "https://github.com/hylang/hy-mode" :description "Emacs support for the Hy language." :type github :pkgname "hylang/hy-mode"))
 (idomenu status "installed" recipe
	  (:name idomenu :type emacswiki :description "imenu tag selection a la ido" :load-path "."))
 (iedit status "installed" recipe
	(:name iedit :description "Edit multiple regions with the same content simultaneously." :type emacswiki :features iedit))
 (jedi status "installed" recipe
       (:name jedi :description "An awesome Python auto-completion for Emacs" :type github :pkgname "tkf/emacs-jedi" :submodule nil :depends
	      (epc auto-complete python-environment)))
 (jira status "installed" recipe
       (:name jira :auto-generated t :type elpa :description "Connect to JIRA issue tracking software" :repo nil))
 (json status "installed" recipe
       (:name json :description "JavaScript Object Notation parser / generator" :type http :builtin "23" :url "http://edward.oconnor.cx/elisp/json.el"))
 (linum-relative status "installed" recipe
		 (:name linum-relative :type emacswiki :description "Display relative line number in the left margin" :features linum-relative))
 (log4e status "installed" recipe
	(:name log4e :website "https://github.com/aki2o/log4e" :description "provide logging framework for elisp." :type github :pkgname "aki2o/log4e"))
 (magit status "installed" recipe
	(:name magit :website "https://github.com/magit/magit#readme" :description "It's Magit! An Emacs mode for Git." :type github :pkgname "magit/magit" :depends
	       (cl-lib git-modes)
	       :info "." :compile "magit.*.el\\'" :build
	       `(("make" "docs"))
	       :build/berkeley-unix
	       (("gmake docs"))
	       :build/windows-nt
	       (progn nil)))
 (markdown-mode status "installed" recipe
		(:name markdown-mode :description "Major mode to edit Markdown files in Emacs" :website "http://jblevins.org/projects/markdown-mode/" :type git :url "git://jblevins.org/git/markdown-mode.git" :prepare
		       (add-to-list 'auto-mode-alist
				    '("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))))
 (mic-paren status "installed" recipe
	    (:name mic-paren :description "Advanced highlighting of matching parentheses." :type emacswiki))
 (multiple-cursors status "installed" recipe
		   (:name multiple-cursors :description "An experiment in adding multiple cursors to emacs" :type github :pkgname "magnars/multiple-cursors.el"))
 (nose status "installed" recipe
       (:type github :pkgname "emacsmirror/nose" :name nose :website "https://bitbucket.org/durin42/nosemacs" :description "Emacs extension to provide easy nosetest integration." :type emacsmirror :pkgname nose))
 (org-jira status "installed" recipe
	   (:name org-jira :description "Use Jira in Emacs org-mode." :type github :pkgname "baohaojun/org-jira" :depends soap-client))
 (org-mode status "installed" recipe
	   (:name org-mode :website "http://orgmode.org/" :description "Org-mode is for keeping notes, maintaining ToDo lists, doing project planning, and authoring with a fast and effective plain-text system." :type git :url "git://orgmode.org/org-mode.git" :info "doc" :build/berkeley-unix `,(mapcar
																																				       (lambda
																																					 (target)
																																					 (list "gmake" target
																																					       (concat "EMACS="
																																						       (shell-quote-argument el-get-emacs))))
																																				       '("oldorg"))
		  :build `,(mapcar
			    (lambda
			      (target)
			      (list "make" target
				    (concat "EMACS="
					    (shell-quote-argument el-get-emacs))))
			    '("oldorg"))
		  :load-path
		  ("." "contrib/lisp" "lisp")
		  :load
		  ("lisp/org-loaddefs.el")))
 (package status "installed" recipe
	  (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
		 (progn
		   (let
		       ((old-package-user-dir
			 (expand-file-name
			  (convert-standard-filename
			   (concat
			    (file-name-as-directory default-directory)
			    "elpa")))))
		     (when
			 (file-directory-p old-package-user-dir)
		       (add-to-list 'package-directory-list old-package-user-dir)))
		   (setq package-archives
			 (bound-and-true-p package-archives))
		   (mapc
		    (lambda
		      (pa)
		      (add-to-list 'package-archives pa 'append))
		    '(("ELPA" . "http://tromey.com/elpa/")
		      ("melpa" . "http://melpa.org/packages/")
		      ("gnu" . "http://elpa.gnu.org/packages/")
		      ("marmalade" . "http://marmalade-repo.org/packages/")
		      ("SC" . "http://joseito.republika.pl/sunrise-commander/"))))))
 (paredit status "installed" recipe
	  (:name paredit :description "Minor mode for editing parentheses" :type http :prepare
		 (progn
		   (autoload 'enable-paredit-mode "paredit")
		   (autoload 'disable-paredit-mode "paredit"))
		 :url "http://mumble.net/~campbell/emacs/paredit.el"))
 (pkg-info status "installed" recipe
	   (:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
		  (dash epl)))
 (popup status "installed" recipe
	(:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :pkgname "auto-complete/popup-el"))
 (powerline status "installed" recipe
	    (:name powerline :website "https://github.com/milkypostman/powerline" :depends
		   (cl-lib)
		   :description "Powerline for Emacs" :type github :pkgname "milkypostman/powerline" :load-path "." :features powerline))
 (puppet-mode status "installed" recipe
	      (:name puppet-mode :description "A simple mode for editing puppet manifests" :type github :pkgname "lunaryorn/puppet-mode" :website "https://github.com/lunaryorn/puppet-mode" :prepare
		     (progn
		       (autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests" t)
		       (add-to-list 'auto-mode-alist
				    '("\\.pp$" . puppet-mode)))))
 (python-environment status "installed" recipe
		     (:name python-environment :description "Python virtualenv API for Emacs Lisp" :type github :pkgname "tkf/emacs-python-environment" :depends
			    (deferred)))
 (pyvenv status "installed" recipe
	 (:name pyvenv :website "https://github.com/jorgenschaefer/pyvenv" :description "Python virtual environment interface for Emacs" :type github :pkgname "jorgenschaefer/pyvenv" :post-init
		(el-get-envpath-prepend "PYTHONPATH" default-directory)))
 (queue status "installed" recipe
	(:name queue :description "Queue data structure" :type elpa))
 (quickrun status "installed" recipe
	   (:name quickrun :description "Run commands quickly" :website "https://github.com/syohex/emacs-quickrun" :type github :pkgname "syohex/emacs-quickrun" :features "quickrun"))
 (rainbow-delimiters status "installed" recipe
		     (:name rainbow-delimiters :website "https://github.com/jlr/rainbow-delimiters#readme" :description "Color nested parentheses, brackets, and braces according to their depth." :type github :pkgname "jlr/rainbow-delimiters"))
 (rope status "installed" recipe
       (:name rope :description "A python refactoring library" :post-init
	      (el-get-envpath-prepend "PYTHONPATH" default-directory)
	      :type git :url "https://github.com/python-rope/rope.git"))
 (s status "installed" recipe
    (:name s :description "The long lost Emacs string manipulation library." :type github :pkgname "magnars/s.el"))
 (sbt-mode status "installed" recipe
	   (:name sbt-mode :description "An emacs mode for interacting with scala sbt and projects" :type github :pkgname "hvesalai/sbt-mode"))
 (scala-mode2 status "installed" recipe
	      (:name scala-mode2 :description "A new scala-mode for Emacs 24." :type github :pkgname "hvesalai/scala-mode2"))
 (smart-tabs-mode status "installed" recipe
		  (:name smart-tabs-mode :auto-generated t :type elpa :description "Intelligently indent with tabs, align with spaces!" :repo nil))
 (smartparens status "installed" recipe
	      (:name smartparens :description "Autoinsert pairs of defined brackets and wrap regions" :type github :pkgname "Fuco1/smartparens" :depends dash))
 (soap-client status "installed" recipe
	      (:name soap-client :website "http://code.google.com/p/emacs-soap-client/" :description "The soap-client.el library provides access to SOAP web-services from Emacs. It supports encoding/decoding SOAP messages based on WSDL descriptors." :type hg :url "https://code.google.com/p/emacs-soap-client/"))
 (solarized-emacs status "installed" recipe
		  (:name solarized-emacs :description "Solarized for Emacs is an Emacs port of the Solarized theme for vim, developed by Ethan Schoonover." :website "https://github.com/bbatsov/solarized-emacs" :minimum-emacs-version "24" :type github :pkgname "bbatsov/solarized-emacs" :depends dash :prepare
			 (add-to-list 'custom-theme-load-path default-directory)))
 (sourcemap status "installed" recipe
	    (:name sourcemap :auto-generated t :type elpa :description "Sourcemap parser" :repo nil :depends
		   (cl-lib)
		   :minimum-emacs-version
		   (24)))
 (tss status "installed" recipe
      (:name tss :website "https://github.com/aki2o/emacs-tss" :description "provide a interface for auto-complete.el/flymake.el on typescript-mode." :type github :pkgname "aki2o/emacs-tss" :depends
	     (auto-complete log4e yaxception)))
 (typed-clojure-mode status "installed" recipe
		     (:name typed-clojure-mode :description "Typed Clojure minor mode for Emacs" :type github :pkgname "typedclojure/typed-clojure-mode" :depends
			    (clojure-mode cider)))
 (undo-tree status "installed" recipe
	    (:name undo-tree :description "Treat undo history as a tree" :website "http://www.dr-qubit.org/emacs.php" :type git :url "http://www.dr-qubit.org/git/undo-tree.git/"))
 (wikipedia-mode status "installed" recipe
		 (:name wikipedia-mode :description "Mode for editing Wikipedia articles off-line" :type emacswiki :features wikipedia-mode :post-init
			(add-to-list 'auto-mode-alist
				     '("\\.wiki\\.txt\\'" . wikipedia-mode))))
 (xcscope status "installed" recipe
	  (:name xcscope :description "Cscope interface for (X)Emacs" :type github :pkgname "dkogan/xcscope.el" :prepare
		 (progn
		   (add-hook 'c-mode-hook #'cscope-minor-mode)
		   (add-hook 'c++-mode-hook #'cscope-minor-mode)
		   (add-hook 'dired-mode-hook #'cscope-minor-mode))))
 (xkcd status "installed" recipe
       (:name xkcd :type github :description "Read xkcd from Emacs" :pkgname "vibhavp/emacs-xkcd" :depends
	      (json)))
 (yaml-mode status "installed" recipe
	    (:name yaml-mode :description "Simple major mode to edit YAML file for emacs" :type github :pkgname "yoshiki/yaml-mode"))
 (yascroll status "installed" recipe
	   (:name yascroll :description "Yet Another Scroll Bar Mode" :website "https://github.com/m2ym/yascroll-el" :type github :pkgname "m2ym/yascroll-el" :features "yascroll"))
 (yasnippet status "installed" recipe
	    (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil :build
		   (("git" "submodule" "update" "--init" "--" "snippets"))))
 (yaxception status "installed" recipe
	     (:name yaxception :website "https://github.com/aki2o/yaxception" :description "provide framework about exception like Java for elisp." :type github :pkgname "aki2o/yaxception")))
