;;; emacs-one.el --- One For Emacs

;; Copyright (C) 2018 Balaji Sivaraman

;; Author: Balaji Sivaraman <balaji@balajisivaraman.com>
;; URL: http://github.com/balajisivaraman/emacs-one-themes
;; Version: 0.1.0

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; A port of the Vim/Atom One colorscheme to Emacs.
;;
;;; Credits
;;
;; This theme is heavily inspired by the Vim port of One created by
;; Ramir Akremi.
;;
;;; Code:

;;; Setup
(defconst emacs-one-colours
  '((dark . ((mono1 . "#ABB2BF")
             (mono2 . "#828997")
             (mono3 . "#5C6370")
             (mono4 . "#4B5263")
             (cyan . "#56B6C2")
             (blue . "#61AFEF")
             (violet . "#C678DD")
             (green . "#98C379")
             (red1 . "#E06C75")
             (red2 . "#BE5046")
             (orange1 . "#D19A66")
             (orange2 . "#E5C07B")
             (background . "#282C34")
             (contrast-bg . "#2C323C")
             (low-contrast-bg . "#292E37")
             (fringe . "#636D83")
             (accent . "#528BFF")
             (highlight . "#3E4452")))
    (light . ((mono1 . "#494B53")
              (mono2 . "#696C77")
              (mono3 . "#A0A1A7")
              (mono4 . "#C2C2C3")
              (cyan . "#0184BC")
              (blue . "#4078F2")
              (violet . "#A626A4")
              (green . "#50A14F")
              (red1 . "#E45649")
              (red2 . "#CA1243")
              (orange1 . "#986801")
              (orange2 . "#C18401")
              (background . "#FAFAFA")
              (contrast-bg . "#F0F0F0")
              (low-contrast-bg . "#F5F5F5")
              (fringe . "#9E9E9E")
              (accent . "#526FFF")
              (highlight . "#D0D0D0")))))

(defmacro emacs-one-with-colour-variables (variant &rest body)
  "Helper macro to setup colours for the provided `VARIANT' to be used in `BODY'."
  (declare (indent defun))
  `(let* ((colours (cdr (assoc ,variant emacs-one-colours)))
          (mono1 (cdr (assoc 'mono1 colours)))
          (mono2 (cdr (assoc 'mono2 colours)))
          (mono3 (cdr (assoc 'mono3 colours)))
          (mono4 (cdr (assoc 'mono4 colours)))
          (cyan (cdr (assoc 'cyan colours)))
          (blue (cdr (assoc 'blue colours)))
          (violet (cdr (assoc 'violet colours)))
          (green (cdr (assoc 'green colours)))
          (red1 (cdr (assoc 'red1 colours)))
          (red2 (cdr (assoc 'red2 colours)))
          (orange1 (cdr (assoc 'orange1 colours)))
          (orange2 (cdr (assoc 'orange2 colours)))
          (background (cdr (assoc 'background colours)))
          (contrast-bg (cdr (assoc 'contrast-bg colours)))
          (low-contrast-bg (cdr (assoc 'low-contrast-bg colours)))
          (fringe (cdr (assoc 'fringe colours)))
          (accent (cdr (assoc 'accent colours)))
          (highlight (cdr (assoc 'highlight colours)))
          (foreground mono1)
          (comment mono3)
          (class '((class color) (min-colors 89)))
          (background-mode (if (eq ,variant 'light) 'light 'dark)))
     ,@body))

(defun create-one-theme (variant theme-name)
  "Create a `VARIANT' of the theme named `THEME-NAME'."
  (emacs-one-with-colour-variables
   variant
   (custom-theme-set-faces
    theme-name
    ;; Emacs Interface Colours
    `(default ((,class (:foreground ,foreground :background ,background))))
    `(cursor ((,class (:background ,mono1))))
    `(fringe ((,class (:background ,low-contrast-bg :foreground ,fringe))))
    `(linum ((,class (:background ,background :foreground ,comment :italic nil :underline nil))))
    `(highlight ((,class (:background ,contrast-bg))))
    `(vertical-border ((,class (:foreground ,contrast-bg))))
    `(border ((,class (:background ,contrast-bg :foreground ,highlight))))
    `(region ((,class (:background ,highlight :inverse-video nil))))
    `(secondary-selection ((,class (:background ,highlight))))
    `(mode-line ((,class (:foreground ,foreground :background ,contrast-bg :weight normal
                                      :box (:line-width 1 :color ,contrast-bg)))))
    `(mode-line-buffer-id ((,class (:foreground ,mono1 :background nil))))
    `(mode-line-inactive ((,class (:inherit mode-line
                                            :foreground ,comment
                                            :background ,highlight :weight normal))))
    `(mode-line-emphasis ((,class (:foreground ,foreground :slant italic))))
    `(mode-line-highlight ((,class (:foreground ,violet :box nil :weight bold))))
    `(match ((,class (:background ,background :foreground ,accent :weight bold))))
    `(menu ((,class (:foreground ,blue :background ,background))))
    `(minibuffer-prompt ((,class (:foreground ,blue))))
    `(header-line ((,class (:inherit mode-line-inactive :foreground ,orange1 :background nil))))

    ;; Standard font lock faces
    `(font-lock-builtin-face ((,class (:foreground ,mono2))))
    `(font-lock-comment-delimiter-face ((,class (:foreground ,comment :slant italic))))
    `(font-lock-comment-face ((,class (:foreground ,comment :slant italic))))
    `(font-lock-constant-face ((,class (:foreground ,green))))
    `(font-lock-doc-face ((,class (:foreground ,comment))))
    `(font-lock-doc-string-face ((,class (:foreground ,orange2))))
    `(font-lock-function-name-face ((,class (:foreground ,blue))))
    `(font-lock-keyword-face ((,class (:foreground ,red1))))
    `(font-lock-negation-char-face ((,class (:foreground ,blue))))
    `(font-lock-preprocessor-face ((,class (:foreground ,orange2))))
    `(font-lock-regexp-grouping-backslash ((,class (:foreground ,orange2))))
    `(font-lock-regexp-grouping-construct ((,class (:foreground ,violet))))
    `(font-lock-string-face ((,class (:foreground ,green))))
    `(font-lock-type-face ((,class (:foreground ,blue))))
    `(font-lock-variable-name-face ((,class (:foreground ,orange2))))
    `(font-lock-warning-face ((,class (:weight bold :foreground ,red2))))
    `(shadow ((,class (:foreground ,comment))))
    `(success ((,class (:foreground ,green))))
    `(error ((,class (:foreground ,red2))))
    `(warning ((,class (:foreground ,orange1))))
    `(tooltip ((,class (:foreground ,orange2 :background ,background :inverse-video t))))

    ;; which-function
    `(which-func ((,class (:foreground ,blue :background nil :weight bold))))

    ;; Helm
    `(helm-header ((,class (:inherit header-line))))
    `(helm-header-line-left-margin ((,class (:inherit header-line))))
    `(helm-match ((,class (:inherit match))))
    `(helm-M-x-key ((,class (:foreground ,red1 :underline t))))
    `(helm-buffer-size ((,class (:foreground ,foreground))))
    `(helm-candidate-number ((,class (:foreground ,mono2 :bold t))))
    `(helm-selection ((,class (:background ,highlight :foreground ,mono4))))
    `(helm-selection-line ((,class (:background ,highlight :foreground ,mono2
                                                :underline nil))))
    `(helm-separator ((,class (:foreground ,red1))))
    `(helm-source-header ((,class (:background ,foreground :foreground ,background
                                               :underline nil :bold t))))

    ;; Helm Buffers
    `(helm-buffer-not-saved ((,class (:foreground ,orange1))))
    `(helm-buffer-saved-out ((,class (:foreground ,red1 :background ,background
                                                  :inverse-video t))))
    `(helm-buffer-size ((,class (:foreground ,foreground))))
    `(helm-buffer-directory ((,class (:foreground ,red2))))
    `(helm-buffer-process ((,class (:foreground ,orange1))))

    ;; Helm Find Files
    `(helm-ff-directory ((,class (:foreground ,red2))))
    `(helm-ff-dotted-directory ((,class (:background ,mono3 :foreground ,background))))
    `(helm-ff-executable ((,class (:foreground ,green))))
    `(helm-ff-file ((,class (:foreground ,foreground))))
    `(helm-ff-invalid-symlink ((,class (:foreground ,orange1 :slant italic))))
    `(helm-ff-prefix ((,class (:background ,orange2 :foreground ,background))))
    `(helm-ff-symlink ((,class (:foreground ,cyan))))

    ;; Helm Grep
    `(helm-grep-file ((,class (:foreground ,cyan :underline t))))
    `(helm-grep-finish ((,class (:foreground ,green))))
    `(helm-grep-lineno ((,class (:foreground ,orange1))))
    `(helm-grep-match ((,class (:inherit match))))

    ;; Helm Bookmarks
    `(helm-bookmark-directory ((,class (:inherit helm-ff-directory))))
    `(helm-bookmark-file ((,class (:foreground ,mono2))))
    `(helm-bookmark-gnus ((,class (:foreground ,cyan))))
    `(helm-bookmark-info ((,class (:foreground ,green))))
    `(helm-bookmark-man ((,class (:foreground ,violet))))
    `(helm-bookmark-w3m ((,class (:foreground ,orange1))))
    `(helm-bookmarks-su ((,class (:foreground ,orange2))))
    )))

;;; Footer

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
(file-name-as-directory (file-name-directory load-file-name))))

(provide 'emacs-one)
;;; emacs-one.el ends here
