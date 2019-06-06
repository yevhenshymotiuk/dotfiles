;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Font
(setq doom-font (font-spec :family "Fira Code" :size 15))


;; Theme
(setq doom-theme 'doom-peacock)


;; Key-chords
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "fd" 'evil-normal-state)


;; Web-mode
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(sp-local-pair 'web-mode "{" "}" :actions nil)


;; Company
(add-hook 'after-init-hook 'global-company-mode)

(setq company-idle-delay 0.2
      company-minimum-prefix-length 2)


(map! (:after company
        (:map company-active-map
          "<tab>" nil
          "TAB" 'company-complete-selection)))


;; Cursor
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
    (interactive)
    (message "%s" (file-name-directory (buffer-file-name ))))

(defun term-send-cd()
    (term-send-string
        (get-buffer-process "*terminal*")
        (format "cd %s\n%s\n" (current-directory) "clear")))

(defun open-terminal()
    "Opens terminal in a new window."
    (interactive)
    (cond
        ((not (get-buffer-window "*terminal*"))
        (progn
            (pop-to-buffer (save-window-excursion (term "/bin/zsh")))
            (evil-window-set-height 15)
            (evil-window-prev 1)
            (term-send-cd)
            (select-window (get-buffer-window "*terminal*"))))

        (t (progn
                (term-send-cd)
                (select-window (get-buffer-window "*terminal*"))))))


;; (defun open-popup-terminal()
;;     (interactive)
;;     (+term/open-popup-in-project)
;;     (evil-window-set-height 15))

;; <leader>
(map! :leader
      :desc "Open terminal" "'" 'open-terminal
      :desc "Open swiper" "S" 'swiper)
