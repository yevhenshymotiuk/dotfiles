;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Font
(setq doom-font (font-spec :family "Fira Code" :size 15))


;; Theme
(setq doom-theme 'doom-peacock)


;; evil-escape-key-sequence
(setq evil-escape-key-sequence "fd")


;; web-mode
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html.eex\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

(sp-local-pair 'web-mode "{" "}" :actions nil)
(sp-local-pair 'web-mode "<" ">" :actions nil)

(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'django-html-mode-hook 'web-mode)

(map! (:after web-mode
        (:map web-mode-map
          "TAB" nil
          "TAB" 'emmet-expand-yas)))


;; Company
(add-hook 'after-init-hook 'global-company-mode)

(setq company-idle-delay 0.2
      company-minimum-prefix-length 2)

(map! (:after company
        (:map company-active-map
          "<tab>" nil
          "TAB" 'company-complete-selection)))


;; cursor
(setq cursor-color "palegoldenrod")
(setq s/cursor-color/+evil--default-cursor-color/ "palegoldenrod")


;; dart-mode
(map! (:after dart-mode
        (:map dart-mode-map
          "TAB" 'dart-expand)))

(sp-local-pair 'dart-mode "<" ">")


;; Org-Latex
(setq org-latex-packages-alist
      '(("AUTO" "babel" t)
        ("T2A" "fontenc" t)))


;; term
(defun current-directory()
    "Returns current directory"
    (file-name-directory (buffer-file-name )))

(defun term-send-cd()
    (term-send-string
        (get-buffer-process "*terminal*")
        (format "cd %s\n%s\n" (current-directory) "clear")))

(defun open-terminal()
    "Opens terminal in a new window"
    (interactive)
    (cond
        ((not (get-buffer-window "*terminal*"))
        (progn
            (pop-to-buffer (save-window-excursion (term "/bin/zsh")))
            (evil-window-set-height 15)))

        (t (progn
                (term-send-cd)
                (select-window (get-buffer-window "*terminal*"))))))

(defun open-popup-terminal()
    (interactive)
    (+term/toggle t)
    (evil-window-set-height 15))


;; <leader>
(map! :leader
      :desc "Open terminal" "'" 'open-terminal
      :desc "Open swiper" "S" 'swiper
      :desc "Terminal in popup" "o t" 'open-popup-terminal)


;; python
(add-hook 'python-mode-hook (λ! (electric-indent-local-mode -1)))


;; snippets
(require 'yasnippet)
(doom-snippets-initialize)

;; django
(add-hook 'django-mode-hook 'python-mode)
(setq whitespace-style (quote ()))


;; flycheck
(setq-default flycheck-disabled-checkers '(python-pylint))


;; agenda
(setq org-agenda-files '("~/Documents/org/"))

(setq org-agenda-custom-commands
      '(("c" "Custom agenda view"
         ((agenda ""
            ((org-agenda-overriding-header "Today's agenda")
             (org-agenda-start-day "4d")
             (org-agenda-span 1)))
          (agenda "" ((org-agenda-overriding-header "10 days' agenda")))
          (alltodo "" ((org-agenda-overriding-header "All tasks")))))))


;; ligatures
(when (featurep! :ui pretty-code)
  (after! org
    (set-pretty-symbols! 'org-mode
      :name "#+NAME:"
      :src_block "#+BEGIN_SRC"
      :src_block_end "#+END_SRC"
      :alist '(("[ ]" . "")
               ("[X]" . "")
               ("[-]" . "")
               ("SCHEDULED:" . "")
               ("DEADLINE:" . "")
               ("#+begin_src" . "«")
               ("#+end_src" . "»")))))


;; plantuml
(setq org-plantuml-jar-path (expand-file-name "/usr/share/java/plantuml/plantuml.jar"))
