;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Font
(setq doom-font (font-spec :family "Fira Code" :size 15))


;; Theme
(setq doom-theme 'doom-peacock)


;; key-chords
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "fd" 'evil-normal-state)


;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html.eex\\'" . web-mode))

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


;; dart-mode
(map! (:after dart-mode
        (:map dart-mode-map
          "TAB" 'dart-expand)))

(sp-local-pair 'dart-mode "<" ">")


;; Org-Latex
(setq org-latex-packages-alist
      '(("AUTO" "babel" t)
        ("T2A" "fontenc" t)))


;; Swiper
;; (map! (:after swoop
;;         (:map swoop-map
;;           "C-j" 'swoop-action-goto-line-next
;;           "C-k" 'swoop-action-goto-line-prev)))

;; (setq swoop-font-size-change: nil)


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


;; yasnippet
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")
