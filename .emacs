(defvar *emacs-load-start* (car (last (current-time))))

(setq additional-paths '("~/.emacs.d" "~/lisp"))
(setq load-path (append additional-paths load-path))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; APPEARANCE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-message t)
(setq visible-bell t)
(setq require-final-newline t)
(setq resize-minibuffer-frame t)
(setq-default transient-mark-mode t)
(setq next-line-add-newlines nil)
(setq blink-matching-paren nil)
(menu-bar-mode -1)

(require 'powerline)
(powerline-default)

(set-face-background 'region "#333")
(set-face-background 'isearch-fail "#600")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KEYS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq suggest-key-bindings t)
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-x\ ?" 'help)
(global-set-key "\C-c\ l" 'goto-line)
(global-set-key "\C-x\ f" 'find-file-other-window)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key "\C-z" nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MODE STUFF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby
(autoload 'ruby-mode "ruby-mode" t)
(setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Capfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.irbrc$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rhtml$" . html-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.erb$" . html-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rxml$" . html-mode) auto-mode-alist))
(autoload 'sass-mode "sass-mode" t)
(setq auto-mode-alist (cons '("\\.sass$" . sass-mode) auto-mode-alist))
(autoload 'haml-mode "haml-mode" t)
(setq auto-mode-alist (cons '("\\.haml$" . haml-mode) auto-mode-alist))

;; other modes
(setq auto-mode-alist (cons '("\\.js$" . javascript-mode) auto-mode-alist))
(autoload 'yaml-mode "yaml-mode" t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MISC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; translates ANSI colors into text-properties, for eshell
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; recentf stuff
(autoload 'recentf "recentf" t)
(recentf-mode 1)
(setq recentf-max-menu-items 50)

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
(setq completion-ignore-case t)

;; avoid creating the ...~ files
(setq make-backup-files nil)

;; methods I forget the name of
; find-grep-dired
; find-name-dired
; grep-find

(message "My .emacs loaded in %s seconds" (/ (- (car (last (current-time))) *emacs-load-start*) 100000.0))
