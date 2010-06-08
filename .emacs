(defvar *emacs-load-start* (car (last (current-time))))

(setq additional-paths '("/Users/josephgrossberg/" "/Users/josephgrossberg/lisp"))
(setq load-path (append additional-paths load-path))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; APPEARANCE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-message t)
(setq font-lock-maximum-decoration t)
(setq visible-bell t)
(setq require-final-newline t)
(setq resize-minibuffer-frame t)
(setq column-number-mode t)
(setq-default transient-mark-mode t)
(setq next-line-add-newlines nil)
(setq blink-matching-paren nil)
(global-font-lock-mode 1 t)
(blink-cursor-mode -1)
(if (eq system-type 'gnu/linux) (tooltip-mode -1) ) ; win32 emacs

(set-foreground-color "#dbdbdb")
(set-background-color "#000000")
(set-cursor-color "#ffffff")

(if (> (display-color-cells) 20)
    (custom-set-faces
     '(font-lock-builtin-face ((t (:foreground "deepskyblue"))))
     '(font-lock-comment-face ((t (:foreground "gray60"))))
     '(font-lock-doc-face ((t (:foreground "darkkhaki"))))
     '(font-lock-keyword-face ((t (:foreground "magenta"))))
     '(font-lock-function-name-face ((t (:foreground "green" :background "seagreen"))))
     '(font-lock-string-face ((t (:foreground "gold"))))
     '(font-lock-type-face ((t (:foreground "cyan" :background "slateblue"))))
     '(font-lock-variable-name-face ((t (:foreground "yellow"))))

     '(modeline ((t (:foreground "plum1" :background "navy"))))
     '(region ((t (:background "sienna"))))
     '(highlight ((t (:foreground "black" :background "darkseagreen2"))))
     '(fringe ((t (:foreground "lawngreen" :background "gray10"))))
     '(isearch-lazy-highlight-face ((t (:foreground "black" :background "paleturquoise"))))
     '(mouse ((t (:background "green"))))

     '(diff-added-face ((t (:foreground "green"))))
     '(diff-changed-face ((t (:foreground "yellow"))))
     '(diff-header-face ((t (:foreground "cyan"))))
     '(diff-hunk-header-face ((t (:foreground "magenta"))))
     '(diff-removed-face ((t (:foreground "red")))))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KEYS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq suggest-key-bindings t)
;;(setq meta-command-modifier 'control)
;;(setq control-command-modifier 'meta)
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)
(global-set-key "\C-h" 'backward-delete-char)
;;(normal-erase-is-backspace-mode)
(global-set-key "\C-x\ ?" 'help)
(global-set-key "\C-c\ l" 'goto-line)
(global-set-key "\C-x\ f" 'find-file-other-window)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key "\C-z" nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MODE STUFF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python
(autoload 'python-mode "python-mode" t)
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq-default intend-tabs-mode nil)
(setq-default tab-width 4)

(defun untabify-buffer()
  (interactive)
  "Untabify the current buffer.  Return nil.
  Must return nil, if added to write-file-hooks."
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "[ \t]+$" nil t)
      (delete-region (match-beginning 0) (match-end 0)))
    (goto-char (point-min))
    (if (search-forward "\t" nil t)
        (untabify (1- (point)) (point-max))))
  nil)

(setq python-mode-hook
      '(lambda () (progn
                    (add-hook 'write-file-hooks 'untabify-buffer)
                    (set-variable 'py-indent-offset 4)
                    (set-variable 'py-smart-indentation nil)
                    (set-variable 'indent-tabs-mode nil) )))

;; ruby
(autoload 'ruby-mode "ruby-mode" t)
(setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.irbrc$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rhtml$" . html-mode) auto-mode-alist))
(autoload 'sass-mode "sass-mode" t)
(setq auto-mode-alist (cons '("\\.sass$" . sass-mode) auto-mode-alist))
(autoload 'haml-mode "haml-mode" t)
(setq auto-mode-alist (cons '("\\.haml$" . haml-mode) auto-mode-alist))

(setq auto-mode-alist (cons '("\\.xsd$" . xml-mode) auto-mode-alist))

;; php
(autoload 'php-mode "php-mode" t)
(setq auto-mode-alist (cons '("\\.php$" . php-mode) auto-mode-alist))

;(defun php-mode-hook ()
;  (setq tab-width 4
;        c-basic-offset 4
;        c-hanging-comment-ender-p nil
;        indent-tabs-mode
;  (not
;    (and (string-match "/\\(PEAR\\|pear\\)/" (buffer-file-name))
;      (string-match "\.php$" (buffer-file-name))))))

;; cvs
;(setq vc-default-back-end 'CVS)
;(autoload 'cvs-add "cvs-add" "CVS add" t)
;(autoload 'cvs-commit "cvs-commit" "CVS commit" t)
;(autoload 'cvs-diff "cvs-diff" "CVS diff" t)

;; other modes
(setq auto-mode-alist (cons '("\\.js$" . java-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("\\.rsel$" . java-mode) auto-mode-alist))
(autoload 'yaml-mode "yaml-mode" t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;(autoload 'erlang "erlang" t)
;(add-to-list 'auto-mode-alist '("\\.erl$" . erlang-mode))

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
