;; This is a config that will aim to be speedy. As in near instant start on an SSD.
;; Might not cut it on a conventional HDD but I guess nobody will use it anyway so there.


;; Disable almost all GUI elements
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-splash-screen t)


;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)


;; add all subdirs to load path.
(let ((default-directory "~/.emacs.d/"))
      (normal-top-level-add-to-load-path '("."))
      (normal-top-level-add-subdirs-to-load-path))

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Make things pretty
(require 'appearance)

;; install packages when required.
(require 'setup-package)
;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   (cons 'magit melpa)
   (cons 'move-text melpa)
   (cons 'visual-regexp-steroids melpa)
   (cons 'smartparens melpa)
   (cons 'auto-complete melpa)
   (cons 'mmm-mode melpa)
   (cons 'color-theme melpa)
   (cons 'fic-mode melpa)
   (cons 'rainbow-delimiters melpa)
   (cons 'jedi melpa)
   (cons 'ido melpa)
   (cons 'flx-ido melpa)
   (cons 'ido-ubiquitous melpa)
   (cons 'highlight-escape-sequences melpa)
   (cons 'smartparens melpa)
   (cons 'smex melpa)))

(when (not package-archive-contents) (package-refresh-contents))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))


(require 'setup-minibuffer)
