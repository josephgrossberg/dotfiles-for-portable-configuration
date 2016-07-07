;; Author: Adam Lloyd <lloyda2@rpi.edu>
;; Author: Seth Chisamore <schisamo@gmail.com>
;; Adapted for Emacs24 by Thomas Pelletier <thomas@pelletier.im>
;;
;; Note: Based on the molokai theme for vim by Tomas Restrepo, which
;; is in turn based on the monokai theme for textmate by Wimer
;; Hazenberg and a darker variant by Hamish Stuart Macpherson.


(deftheme molokai
  "Color theme based on the Molokai color scheme for Vim.")

(custom-theme-set-faces
       'molokai

       ;; basic coloring
       '(default ((t (:foreground "#F8F8F2" :background "#000000"))))
       '(cursor ((t (:background "#F8F8F0" :foreground nil))))
       '(bold ((t (:weight bold))))
       '(bold-italic ((t (:weight bold :slant italic))))
       '(custom-face-tag ((t (:foreground "#66D9EF" :weight bold))))
       '(custom-state ((t (:foreground "#A6E22E"))))
       '(italic ((t (:slant italic))))
       '(region ((t (:background "#504D4D"))))
       '(underline ((t (:underline t))))
       '(css-selector ((t (:foreground "#F92672"))))
       '(css-property ((t (:foreground "#66D9EF"))))
       '(diff-added ((t (:foreground "#A6E22E" :weight bold))))
       '(diff-context ((t (:foreground "#F8F8F2"))))
       '(diff-file-header ((t (:foreground "#66D9EF" :background nil))))
       '(diff-indicator-added ((t (:foreground "#A6E22E"))))
       '(diff-indicator-removed ((t (:foreground "#F92672"))))
       '(diff-header ((t (:foreground "#F8F8F2" :background "#232526"))))
       '(diff-hunk-header ((t (:foreground "#AE81FF" :background "#232526"))))
       '(diff-removed ((t (:foreground "#F92672" :weight bold))))
       '(escape-glyph ((t (:foreground "#E6DB74"))))
       '(minibuffer-prompt ((t (:foreground "#66D9EF"))))
       '(mode-line ((t (:foreground "#FFFFFF" :background "#CE580B"
                        :box (:line-width 1 :color "#000000" :style released-button)))))
       '(mode-line-buffer-id ((t (:foreground nil  :weight semi-bold))))
       '(mode-line-inactive ((t (:foreground "#BCBCBC" :background "#455354"
                                 :box (:line-width 1 :color "#2A3233")))))
       '(mode-line-mousable ((t (:foreground "#BCBCBC" :background "#000000"))))
       '(mode-line-mousable-minor-mode ((t (:foreground "#BCBCBC" :background "#000000"))))

       ;; font lock
       '(font-lock-builtin-face ((t (:foreground "#A6E22E"))))
       '(font-lock-comment-face ((t (:foreground "#465457" :slant italic))))
       '(font-lock-comment-delimiter-face ((t (:foreground "#465457" :slant italic))))
       '(font-lock-constant-face ((t (:foreground "#AE81FF"))))
       '(font-lock-doc-face ((t (:foreground "#E6DB74" :slant italic))))
       '(font-lock-function-name-face ((t (:foreground "#F92672" :slant italic))))
       '(font-lock-keyword-face ((t (:foreground "#66D9EF"))))
       '(font-lock-negation-char-face ((t (:weight bold))))
       '(font-lock-preprocessor-face ((t (:foreground "#A6E22E"))))
       '(font-lock-regexp-grouping-backslash ((t (:weight bold))))
       '(font-lock-regexp-grouping-construct ((t (:weight bold))))
       '(font-lock-string-face ((t (:foreground "#E6DB74"))))
       '(font-lock-type-face ((t (:foreground "#66D9EF"))))
       '(font-lock-variable-name-face ((t (:foreground "#F92672"))))
       '(font-lock-warning-face ((t (:foreground "#FFFFFF" :background "#333333"))))

       '(fringe ((t (:background "#232526"))))
     ;  '(Highlight ((t (:foreground "#000000" :background "#C4BE89"))))
       '(hl-line ((t (:background "#293739" ))))
       '(icompletep-choices ((t (:foreground "#F92672"))))
       '(icompletep-determined ((t (:foreground "#A6E22E"))))
       '(icompletep-keys ((t (:foreground "#F92672"))))
       '(icompletep-nb-candidates ((t (:foreground "#AE81FF"))))
       '(isearch ((t (:foreground "#C4BE89" :background "#000000"))))
       '(isearch-fail ((t (:foreground "#FFFFFF" :background "#333333"))))
       '(lazy-highlight ((t (:foreground "#465457" :Background "#000000"))))

       ;; linum-mode
       '(linum ((t (:foreground "#333333" :background "#111111"))))

       ;; markdown-mode
       '(markdown-italic-face ((t (:slant italic))))
       '(markdown-bold-face ((t (:weight bold))))
       '(markdown-header-face ((t (:weight normal))))
       '(markdown-header-face-1 ((t (:foreground "#66D9EF"))))
       '(markdown-header-face-2 ((t (:foreground "#F92672"))))
       '(markdown-header-face-3 ((t (:foreground "#A6E22E"))))
       '(markdown-header-face-4 ((t (:foreground "#AE81FF"))))
       '(markdown-header-face-5 ((t (:foreground "#E6DB74"))))
       '(markdown-header-face-6 ((t (:foreground "#FF7F00"))))
       '(markdown-inline-code-face ((t (:foreground "#66D9EF"))))
       '(markdown-list-face ((t (:foreground "#A6E22E"))))
       '(markdown-blockquote-face ((t (:slant italic))))
       '(markdown-pre-face ((t (:foreground "#AE81FF"))))
       '(markdown-link-face ((t (:foreground "#66D9EF"))))
       '(markdown-reference-face ((t (:foreground "#66D9EF"))))
       '(markdown-url-face ((t (:foreground "#E6DB74"))))
       '(markdown-link-title-face ((t (:foreground "#F92672"))))
       '(markdown-comment-face ((t (:foreground "#465457"))))
       '(markdown-math-face ((t (:foreground "#AE81FF" :slant italic))))

       '(mumamo-background-chunk-major ((t (:background "#272822"))))
       '(mumamo-background-chunk-submode ((t (:background "#1B1D1E"))))
       '(outline-1 ((t (:foreground "#66D9EF"))))
       '(outline-2 ((t (:foreground "#F92672"))))
       '(outline-3 ((t (:foreground "#A6E22E"))))
       '(outline-4 ((t (:foreground "#AE81FF"))))
       '(outline-5 ((t (:foreground "#E6DB74"))))
       '(outline-6 ((t (:foreground "#66D9EF"))))
       '(outline-7 ((t (:foreground "#F92672"))))
       '(outline-8 ((t (:foreground "#A6E22E"))))
       '(secondary-selection ((t (:background "#272822"))))
       '(show-paren-match-face ((t (:foreground "#000000" :background "#FD971F"))))
       '(show-paren-mismatch-face ((t (:foreground "#960050" :background "#1E0010"))))
       '(Widget-inactive-face ((t (:background "#ff0000"))))
       '(woman-addition ((t (:foreground "#AE81FF"))))
       '(woman-bold ((t (:foreground "#F92672"))))
       '(woman-italic ((t (:foreground "#A6E22E"))))
       '(woman-unknown ((t (:foreground "#66D9EF"))))

       ;; rainbow-delimiters
       '(rainbow-delimiters-depth-1-face ((t (:foreground "#2aa198"))))
       '(rainbow-delimiters-depth-2-face ((t (:foreground "#b58900"))))
       '(rainbow-delimiters-depth-3-face ((t (:foreground "#268bd2"))))
       '(rainbow-delimiters-depth-4-face ((t (:foreground "#dc322f"))))
       '(rainbow-delimiters-depth-5-face ((t (:foreground "#859900"))))
       '(rainbow-delimiters-depth-6-face ((t (:foreground "#268bd2"))))
       '(rainbow-delimiters-depth-7-face ((t (:foreground "#cb4b16"))))
       '(rainbow-delimiters-depth-8-face ((t (:foreground "#d33682"))))
       '(rainbow-delimiters-depth-9-face ((t (:foreground "#839496"))))

       ;; whitespace-mode
       '(whitespace-space ((t (:foreground "#960050" :background "#1E0010"))))
       '(whitespace-hspace ((t (:foreground "#960050" :background "#1E0010"))))
       '(whitespace-tab ((t (:foreground "#960050" :background "#1E0010"))))
       ;'(whitespace-newline ((t (:foreground "#960050" :background "#1E0010"))))
       '(whitespace-trailing ((t (:foreground "#960050" :background "#1E0010"))))
       '(whitespace-line ((t (:foreground "#960050" :background "#1E0010"))))
       '(whitespace-space-before-tab ((t (:foreground "#960050" :background "#1E0010"))))
       '(whitespace-indentation ((t (:foreground "#960050" :background "#1E0010"))))
       '(whitespace-empty ((t (:foreground "#960050" :background "#1E0010"))))
       '(whitespace-space-after-tab ((t (:foreground "#960050" :background "#1E0010"))))

)

(provide-theme 'molokai)
