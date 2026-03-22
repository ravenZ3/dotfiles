;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;

(setq doom-font (font-spec :family "JetBrains Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "Cantarell" :size 16))
(add-hook 'org-mode-hook 'variable-pitch-mode)

(setq org-hide-emphasis-markers t)
(setq org-pretty-entities t)
(setq org-ellipsis " ▾")

(custom-set-faces
 '(org-level-1 ((t (:height 1.3 :weight bold))))
 '(org-level-2 ((t (:height 1.2 :weight semi-bold))))
 '(org-level-3 ((t (:height 1.1))))
 )

(add-hook 'org-mode-hook #'visual-line-mode)
(add-hook 'org-mode-hook #'visual-fill-column-mode)

(setq visual-fill-column-width 100
      visual-fill-column-center-text t)
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(global-auto-revert-mode 1)

(defun cp-run (input-file)
  (interactive)
  (let* ((file (buffer-file-name))
         (exe "/tmp/sol")
         (input (expand-file-name input-file))
         (output (expand-file-name "~/cp/output.txt"))
         (cmd (format "g++ -std=c++17 -O2 %s -o %s && %s < %s > %s 2>&1"
                      file exe exe input output)))
    (shell-command cmd)))


(map! :leader
      "c 1" #'(lambda () (interactive) (cp-run "~/cp/i1"))
      "c 2" #'(lambda () (interactive) (cp-run "~/cp/i2"))
      "c 3" #'(lambda () (interactive) (cp-run "~/cp/i3")))

(defun my/cpp-template ()
  (interactive)
  (insert-file-contents "~/.doom.d/templates/cpp.cpp"))

(map! :leader
      :desc "Insert C++ template"
      "i c" #'my/cpp-template)
