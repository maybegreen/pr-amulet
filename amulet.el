;;; amulet.el --- Minor mode for working on Amulet projects
;;
;; Author: SAHLI Youssef
;; URL: https://github.com/maybegreen/amulet-minor-mode
;; Version: 1.0
;;
;;; License:
;;
;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation; either version 3 of the License,
;; or (at your option) any later version.
;;
;; This file is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this file; if not, write to the Free Software
;; Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
;; 02110-1301, USA.
;;
;; Commentary:
;;
;; This projects adds a minor mode for GNU Emacs, and configures a keymap
;; for a faster testing using the Amulet engine.
;;
;; Usage:
;;
;; Put this file on your Emacs lisp path and add this to your '.emacs' :
;;
;; (require `amulet)
;;
;; You can enable the minor mode with (amulet-minor-mode 1)
;;
;; Code:


(defconst amulet-minor-mode-version-number "1.0"
  "The version number of the Amulet minor mode.")

(defvar amulet-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "M-p") `amulet/launch)
    map)
  "A Keymap for Amulet minor mode.")

(defgroup amulet nil
  "The customization group for Amulet minor mode."
  :prefix "amulet-"
  :group 'amulet)

;;;###autoload
(define-minor-mode amulet-minor-mode
  "toggles Amulet minor mode."
  :init-value nil
  :lighter " Amulet"
  :group `amulet
  :keymap amulet-minor-mode-map)

(defcustom amulet-path (or (executable-find "amulet")
			   "~/bin/amulet")
  "Path to Amulet executable."
  :type `string
  :group `amulet)

(defun amulet/launch ()
  "Launch Amulet."
  (interactive)
  (save-buffer)
  (if (get-buffer "*amulet-output*")
      (kill-buffer "*amulet-output*"))
  (message (concat amulet-path " " (buffer-name))
  (call-process amulet-path nil "*amulet-output*" t
                (buffer-name))
  (display-buffer "*amulet-output*" nil)))

(provide `amulet)

;;; amulet.el ends here
