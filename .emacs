;;; .emacs --- Summary
;;; Commentary:
;;; My Emacs configuration, from https://github.com/josephgrossberg/dotfiles-for-portable-configuration/
;;; Code:
(defvar *emacs-load-start* (car (last (current-time)))) ; for startup
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b99d82e42b1fafd25ee055ed42fefc565daccfe1a233e1d807e9add1e1a5308c" "37c8c2817010e59734fe1f9302a7e6a2b5e8cc648cf6a6cc8b85f3bf17fececf" "cb6ed4854a5919606a2eba2b7518717d5018a4ab070cb453be3ce0572107d9ed" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "403399e5b23965f79d770f9b47565f297a06898c0c30ebb5dc76cbe63db78dd3" "dcf0a263184b9329ac946ce0bf290e6d59b7b98eda890d350e00cd9c28015282" default))
 '(package-selected-packages
   '(yaml-mode copilot codegpt chatgpt use-package hide-mode-line dimmer company tide typescript-mode jsx-mode web-mode melpa-upstream-visit smex powerline git-gutter ag)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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
(show-paren-mode 1)
(require 'uniquify)
(menu-bar-mode -1)
(global-hl-line-mode)
(setq byte-compile-warnings '(cl-functions))
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt) ;; don't echo passwords
(setq use-dialog-box nil)
(global-auto-revert-mode t)

;; usability
(defalias 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
(setq completion-ignore-case t)
(setq vc-follow-symlinks t)
(setq history-length 1000)
(savehist-mode 1)
(save-place-mode 1)

;; recentf stuff
(autoload 'recentf "recentf" t)
(recentf-mode 1)
(setq recentf-max-saved-items 100)
(setq recentf-max-menu-items 100)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; hideshow
;; (hs-minor-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DEFAULT ENCODING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
; skip the comment: -*- coding: utf-8 -*-
(setq ruby-insert-encoding-magic-comment nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KEY BINDINGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq suggest-key-bindings t)
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)
(global-set-key "\C-c\ l" 'goto-line)
(global-set-key "\C-x\ f" 'find-file-other-window)
(global-set-key "\C-z" nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; THEME
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path "~/.emacs.d/themes"))
(load-theme 'molokai)
(set-face-attribute 'font-lock-comment-face nil
                    :foreground "#ccccff" :background "#000033")
(set-face-attribute 'font-lock-comment-face nil
                    :foreground "#ccccff" :background "#000033")

(require 'powerline)
(powerline-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
))
(package-initialize)

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

; rainbow brackets
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
; fuzzy-finder
;(require 'fiplr)
;(global-set-key (kbd "C-x f") 'fiplr-find-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MODE STUFF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; js
(autoload 'js2-mode "js2-mode" nil t)
(setq js2-cleanup-whitespace nil)
(setq js2-highlight-level 3)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-hook 'js2-mode-hook 'hs-minor-mode)

;; jsx
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-jsx-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . js-jsx-mode))
(autoload 'jsx-jsx-mode "js-jsx-mode" "JSX mode" t)

;; typescript
(setq-default typescript-indent-level 2)
(autoload 'typescript-mode "typescript-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.ts$" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx$" . typescript-mode))
(autoload 'tide "tide" t)
(autoload 'company "company" t)

(defun setup-tide-mode ()
  "Configures tide-mode for TypeScript in Emacs."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))
;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)
;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'typescript-ts-mode-hook #'setup-tide-mode)


;; other modes
(autoload 'yaml-mode "yaml-mode" t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
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

;; autorevert stuff
(autoload 'auto-revert-mode "autorevert" nil t)
(autoload 'turn-on-auto-revert-mode "autorevert" nil nil)
(autoload 'global-auto-revert-mode "autorevert" nil t)
(global-auto-revert-mode 1)

;; normally disabled by default
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; for M-x occur
(setq list-matching-lines-default-context-lines 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; STARTUP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(message "My .emacs loaded in %s seconds"
         (/ (- (car (last (current-time))) *emacs-load-start*) 100000.0))
(recentf-open-files)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AI STUFF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'package-archives '( "jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/") t)
(setq openai-key (getenv "OPENAI_KEY"))
(use-package chatgpt :ensure t)
(use-package codegpt :ensure t)
(use-package copilot :ensure t)
(add-hook 'prog-mode-hook 'copilot-mode)
(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

(provide '.emacs)
;;; .emacs ends here
