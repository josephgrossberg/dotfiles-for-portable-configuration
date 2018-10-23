(defvar *emacs-load-start* (car (last (current-time)))) ; for startup

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("403399e5b23965f79d770f9b47565f297a06898c0c30ebb5dc76cbe63db78dd3" "dcf0a263184b9329ac946ce0bf290e6d59b7b98eda890d350e00cd9c28015282" default)))
 '(package-selected-packages
   (quote
    (jsx-mode web-mode melpa-upstream-visit smex powerline git-gutter ag))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PATHS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq additional-paths '("~/.emacs.d/lisp" "~/lisp"))
(setq load-path (append additional-paths load-path))
(push "/usr/local/bin" exec-path)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; USER INTERFACE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq visible-bell t)
(setq next-line-add-newlines nil)
(setq require-final-newline t)
(setq resize-minibuffer-frame t)
(setq-default transient-mark-mode t)
(setq blink-matching-paren nil)
(menu-bar-mode -1)
(global-hl-line-mode)

;; hideshow
;;(hs-minor-mode)
;(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
;; C-c @ C-M-s show all
;; C-c @ C-M-h hide all
;; C-c @ C-s show block
;; C-c @ C-h hide block
;; C-c @ C-c toggle hide/show

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DEFAULT ENCODING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
; skip the # -*- coding: utf-8 -*-
(setq ruby-insert-encoding-magic-comment nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KEY BINDINGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq suggest-key-bindings t)
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)
;(global-set-key "\C-h" 'backward-delete-char)
;(global-set-key "\C-x\ ?" 'help)
(global-set-key "\C-c\ l" 'goto-line)
(global-set-key "\C-x\ f" 'find-file-other-window)
(global-set-key "\C-z" nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; THEME
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path "~/.emacs.d/themes"))
(load-theme 'molokai)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'powerline)
(powerline-default)

(require 'package) ;; You might already have this line
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
))
(package-initialize)

;; to start emacs web server:
;(require 'simple-httpd)
;(setq httpd-root "/var/www")
;(httpd-start)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'git-gutter)
(global-git-gutter-mode t)
(global-display-line-numbers-mode t)

;(require 'magit)

(require 'ag)
(setq ag-highlight-search t)

; fuzzy-finder
; (require 'fiplr)
; (global-set-key (kbd "C-x f") 'fiplr-find-file)

; rainbow brackets
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MODE STUFF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; erlang
;; TODO: more elegant solution to symlinks / version-specific
(setq load-path (cons  "~/erlang_install/lib/erlang/lib/tools-2.6.13/emacs"
                       load-path))
(setq erlang-root-dir "~/erlang_install/lib/erlang")
(setq exec-path (cons "~/erlang_install/lib/erlang/bin" exec-path))
(if (featurep 'erlang-start) (require 'erlang-start))
;; see: http://bob.ippoli.to/archives/2007/03/14/erlang-mode-for-emacs/
;(defvar inferior-erlang-prompt-timeout t)

;; ruby
(autoload 'ruby-mode "ruby-mode" t)
(setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Capfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Gemfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.irbrc$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rhtml$" . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.erb$" . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.sass$" . css-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.scss$" . css-mode) auto-mode-alist))
(autoload 'haml-mode "haml-mode" t)
(setq auto-mode-alist (cons '("\\.haml$" . haml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.feature$" . feature-mode) auto-mode-alist))

;; js
;(setq auto-mode-alist (cons '("\\.js$" . javascript-mode) auto-mode-alist))
(autoload 'js2-mode "js2-mode" nil t)
(setq js2-cleanup-whitespace nil)
(setq js2-highlight-level 3)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.har$" . js2-mode))
(autoload 'coffee-mode "coffee-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-jsx-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . js-jsx-mode))
(autoload 'jsx-jsx-mode "js-jsx-mode" "JSX mode" t)
(add-hook 'js2-mode-hook 'hs-minor-mode)

;; other modes
(autoload 'yaml-mode "yaml-mode" t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(setq auto-mode-alist (cons '("\\zsh" . shell-script-mode) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MISC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; avoid creating the ...~ files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; tab = two spaces
(setq default-tab-width 2)
(setq-default indent-tabs-mode nil)
(setq css-indent-offset 2)
(setq-default js-indent-level 2)

;; translates ANSI colors into text-properties, for eshell
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; recentf stuff
(autoload 'recentf "recentf" t)
(recentf-mode 1)
(setq recentf-max-saved-items 50)
(setq recentf-max-menu-items 50)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; autorevert stuff
(autoload 'auto-revert-mode "autorevert" nil t)
(autoload 'turn-on-auto-revert-mode "autorevert" nil nil)
(autoload 'global-auto-revert-mode "autorevert" nil t)
(global-auto-revert-mode 1)

;; normally disabled by default
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; counting functions
(defalias 'lc 'count-lines-page)
(defun wc ()
  "Count the words in the current buffer, show the result in the minibuffer"
  (interactive)          ; *** This is the line that you need to add
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-min))
      (let ((count 0))
      (while (forward-word 1)
    (setq count(1+ count)))
      (message "There are %d words in the buffer" count)))))

;; for M-x occur
(setq list-matching-lines-default-context-lines 1)

;; don't echo passwords
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;; usability
(defalias 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
(setq completion-ignore-case t)
(setq vc-follow-symlinks t)

;; methods I forget the name of
; dired
; find-name-dired
; rgrep

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; STARTUP MESSAGE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(setq initial-scratch-message "; hello, world\n")
(message "My .emacs loaded in %s seconds"
         (/ (- (car (last (current-time))) *emacs-load-start*) 100000.0))
(recentf-open-files)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
