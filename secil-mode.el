;;; secil-mode.el --- major mode for editing SELinux Common Intermediate Language (SELinux CIL) -*- lexical-binding: t; -*-

;; SPDX-FileCopyrightText: © 2021 Dominick Grift <dominick.grift@defensec.nl>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;; Add this file to LoadPath (example: ~/.emacs.d/lisp/)
;; Add the following lines to InitFile (example: ~/.emacs.d/init.el)
;;   (add-to-list 'load-path "~/.emacs.d/lisp/")
;;   (autoload 'secil-mode "secil-mode.el" "Major mode for editing SELinux Common Intermediate Language (SELinux CIL)" t)
;;   (add-to-list 'auto-mode-alist '("\\.cil\\'" . secil-mode))

;;; Code:

;;; define faces
(defface cil-access-vector-rules-face
  '((t :foreground "color-17"
       ))
  "Face for access vector rules"
  :group 'secil-mode )
(defvar cil-access-vector-rules-face 'cil-access-vector-rules-face)

(defface cil-call-macro-statements-face
  '((t :foreground "color-19"
       ))
  "Face for call/macro statements"
  :group 'secil-mode )
(defvar cil-call-macro-statements-face
  'cil-call-macro-statements-face)

(defface cil-class-permission-statements-face
  '((t :foreground "color-23"
       ))
  "Face for class/permission statements"
  :group 'secil-mode )
(defvar cil-class-permission-statements-face
  'cil-class-permission-statements-face)

(defface cil-conditional-statements-face
  '((t :foreground "color-25"
       ))
  "Face for conditional statements"
  :group 'secil-mode )
(defvar cil-conditional-statements-face
  'cil-conditional-statements-face)

(defface cil-constraint-statements-face
  '((t :foreground "color-30"
       ))
  "Face for constraint statements"
  :group 'secil-mode )
(defvar cil-constraint-statements-face
  'cil-constraint-statements-face)

(defface cil-container-statements-face
  '((t :foreground "color-32"
       ))
  "Face for container statements"
  :group 'secil-mode )
(defvar cil-container-statements-face 'cil-container-statements-face)

(defface cil-context-statement-face
  '((t :foreground "color-36"
       ))
  "Face for context statement"
  :group 'secil-mode )
(defvar cil-context-statement-face 'cil-context-statement-face)

(defface cil-default-object-statements-face
  '((t :foreground "color-54"
       ))
  "Face for default object statements"
  :group 'secil-mode )
(defvar cil-default-object-statements-face
  'cil-default-object-statements-face)

(defface cil-file-labeling-statements-face
  '((t :foreground "color-56"
       ))
  "Face for file labeling statements"
  :group 'secil-mode )
(defvar cil-file-labeling-statements-face
  'cil-file-labeling-statements-face)

(defface cil-infiniband-statements-face
  '((t :foreground "color-59"
       ))
  "Face for infiniband statements"
  :group 'secil-mode )
(defvar cil-infiniband-statements-face
  'cil-infiniband-statements-face)

(defface cil-mls-labeling-statements-face
  '((t :foreground "color-61"
       ))
  "Face for mls labeling statements"
  :group 'secil-mode )
(defvar cil-mls-labeling-statements-face
  'cil-mls-labeling-statements-face)

(defface cil-network-labeling-statements-face
  '((t :foreground "color-65"
       ))
  "Face for network labeling statements"
  :group 'secil-mode )
(defvar cil-network-labeling-statements-face
  'cil-network-labeling-statements-face)

(defface cil-policy-config-statements-face
  '((t :foreground "color-67"
       ))
  "Face for policy config statements"
  :group 'secil-mode )
(defvar cil-policy-config-statements-face
  'cil-policy-config-statements-face)

(defface cil-role-statements-face
  '((t :foreground "color-95"
       ))
  "Face for role statements"
  :group 'secil-mode )
(defvar cil-role-statements-face 'cil-role-statements-face)

(defface cil-sid-statements-face
  '((t :foreground "color-97"
       ))
  "Face for sid statements"
  :group 'secil-mode )
(defvar cil-sid-statements-face 'cil-sid-statements-face)

(defface cil-type-statements-face
  '((t :foreground "color-101"
       ))
  "Face for type statements"
  :group 'secil-mode )
(defvar cil-type-statements-face 'cil-type-statements-face)

(defface cil-user-statements-face
  '((t :foreground "color-103"
       ))
  "Face for user statements"
  :group 'secil-mode )
(defvar cil-user-statements-face 'cil-user-statements-face)

(defface cil-xen-statements-face
  '((t :foreground "color-126"
       ))
  "Face for xen statements"
  :group 'secil-mode )
(defvar cil-xen-statements-face 'cil-xen-statements-face)

(defface cil-name-string-face
  '((t :foreground "color-128"
       ))
  "Face for name string"
  :group 'secil-mode )
(defvar cil-name-string-face 'cil-name-string-face)

(defface cil-true-false-face
  '((t :foreground "color-131"
       ))
  "Face for true/false"
  :group 'secil-mode )
(defvar cil-true-false-face 'cil-true-false-face)

(defface cil-operators-face
  '((t :foreground "color-136"
       ))
  "Face for operators"
  :group 'secil-mode )
(defvar cil-operators-face 'cil-operators-face)

(defface cil-protocols-face
  '((t :foreground "color-161"
       ))
  "Face for protocols"
  :group 'secil-mode )
(defvar cil-protocols-face 'cil-protocols-face)

(defface cil-task-trans-xattr-face
  '((t :foreground "color-154"
       ))
  "Face for task/trans/xattr"
  :group 'secil-mode )
(defvar cil-task-trans-xattr-face 'cil-task-trans-xattr-face)

(defface cil-self-face
  '((t :foreground "color-178"
       ))
  "Face for self"
  :group 'secil-mode )
(defvar cil-self-face 'cil-self-face)

(defface cil-low-high-glblub-face
  '((t :foreground "color-190"
       ))
  "Face for low/high/low_high/glblub"
  :group 'secil-mode )
(defvar cil-low-high-glblub-face 'cil-low-high-glblub-face)

(defface cil-source-target-face
  '((t :foreground "color-180"
       ))
  "Face for source/target"
  :group 'secil-mode )
(defvar cil-source-target-face 'cil-source-target-face)

;;; syntax highlighting
(setq cil-highlights
      (let* (
             ;; define several category of keywords
             (cil-access-vector-rules '("allow" "auditallow" "deny"
                                        "dontaudit" "neverallow"
                                        "allowx" "auditallowx"
                                        "dontauditx" "neverallowx"
					"reject"))
             (cil-call-macro-statements '("call" "macro"))
             (cil-class-permission-statements '("common"
                                                "classcommon"
                                                "class" "classorder"
                                                "classpermission"
                                                "classpermissionset"
                                                "classmap"
                                                "classmapping"
                                                "permissionx"))
             (cil-conditional-statements '("boolean" "booleanif"
                                           "tunable" "tunableif"))
             (cil-constraint-statements '("constrain"
                                          "validatetrans"
                                          "mlsconstrain"
                                          "mlsvalidatetrans"))
             (cil-container-statements '("block" "blockabstract"
                                         "blockinherit" "optional"
                                         "in"))
             (cil-context-statement '("context"))
             (cil-default-object-statements '("defaultuser"
                                              "defaultrole"
                                              "defaulttype"
                                              "defaultrange"))
             (cil-file-labeling-statements '("filecon" "fsuse"
                                             "genfscon"))
             (cil-infiniband-statements '("ibpkeycon"
                                          "ibendportcon"))
             (cil-mls-labeling-statements '("sensitivity"
                                            "sensitivityalias"
                                            "sensitivityaliasactual"
                                            "sensitivityorder"
                                            "category"
                                            "categoryalias"
                                            "categoryaliasactual"
                                            "categoryorder"
                                            "categoryset"
                                            "sensitivitycategory"
                                            "level" "levelrange"
                                            "rangetransition"))
             (cil-network-labeling-statements '("ipaddr" "netifcon"
                                                "nodecon"
                                                "portcon"))
             (cil-policy-config-statements '("mls" "handleunknown"
                                             "policycap"))
             (cil-role-statements '("role" "roletype"
                                    "roleattribute"
                                    "roleattributeset" "roleallow"
                                    "roletransition" "rolebounds"))
             (cil-sid-statements '("sid" "sidorder" "sidcontext"))
             (cil-type-statements '("type" "typealias"
                                    "typealiasactual"
                                    "typeattribute"
				    "expandtypeattribute"
				    "typeattributeset" "typebounds"
                                    "typechange" "typemember"
                                    "typetransition"
                                    "typepermissive"))
             (cil-user-statements '("user" "userrole"
                                    "userattribute"
                                    "userattributeset" "userlevel"
                                    "userrange" "userbounds"
                                    "userprefix" "selinuxuser"
                                    "selinuxuserdefault"))
             (cil-xen-statements '("iomemcon" "ioportcon"
                                   "pcidevicecon" "pirqcon"
                                   "devicetreecon"))
             (cil-name-string '("name" "string"))
             (cil-true-false '("true" "false"))
             (cil-operators '("and" "or" "xor" "eq" "neq" "not"
                              "all" "dom" "domby" "incomp" "range"
			      "t1" "t2" "t3" "r1" "r2" "r3" "u1" "u2"
			      "u3" "l1" "l2" "h1" "h2"))
             (cil-protocols '("dccp" "sctp" "tcp" "udp"))
             (cil-task-trans-xattr '("task" "trans" "xattr"))
             (cil-self '("self"))
             (cil-low-high-glblub '("low" "high" "low_high" "glblub"))
             (cil-source-target '("source" "target"))

             ;; generate regex string for each category of keywords
             (cil-access-vector-rules-regexp
	      (regexp-opt cil-access-vector-rules 'words))
             (cil-call-macro-statements-regexp
	      (regexp-opt cil-call-macro-statements 'words))
             (cil-class-permission-statements-regexp
	      (regexp-opt cil-class-permission-statements 'words))
             (cil-conditional-statements-regexp
	      (regexp-opt cil-conditional-statements 'words))
             (cil-constraint-statements-regexp
	      (regexp-opt cil-constraint-statements 'words))
             (cil-container-statements-regexp
	      (regexp-opt cil-container-statements 'words))
             (cil-context-statement-regexp
	      (regexp-opt cil-context-statement 'words))
             (cil-default-object-statements-regexp
	      (regexp-opt cil-default-object-statements 'words))
             (cil-file-labeling-statements-regexp
	      (regexp-opt cil-file-labeling-statements 'words))
             (cil-infiniband-statements-regexp
	      (regexp-opt cil-infiniband-statements 'words))
             (cil-mls-labeling-statements-regexp
	      (regexp-opt cil-mls-labeling-statements 'words))
             (cil-network-labeling-statements-regexp
	      (regexp-opt cil-network-labeling-statements 'words))
             (cil-policy-config-statements-regexp
	      (regexp-opt cil-policy-config-statements 'words))
             (cil-role-statements-regexp
	      (regexp-opt cil-role-statements 'words))
             (cil-sid-statements-regexp
	      (regexp-opt cil-sid-statements 'words))
             (cil-type-statements-regexp
	      (regexp-opt cil-type-statements 'words))
             (cil-user-statements-regexp
	      (regexp-opt cil-user-statements 'words))
             (cil-xen-statements-regexp
	      (regexp-opt cil-xen-statements 'words))
             (cil-name-string-regexp
	      (regexp-opt cil-name-string 'words))
             (cil-true-false-regexp
	      (regexp-opt cil-true-false 'words))
             (cil-operators-regexp
	      (regexp-opt cil-operators 'words))
             (cil-protocols-regexp
	      (regexp-opt cil-protocols 'words))
             (cil-task-trans-xattr-regexp
	      (regexp-opt cil-task-trans-xattr 'words))
             (cil-self-regexp (regexp-opt cil-self 'words))
             (cil-low-high-glblub-regexp
	      (regexp-opt cil-low-high-glblub 'words))
             (cil-source-target-regexp
	      (regexp-opt cil-source-target 'words)))
        `(

          (,cil-access-vector-rules-regexp
	   . cil-access-vector-rules-face)
          (,cil-call-macro-statements-regexp
	   . cil-call-macro-statements-face)
          (,cil-class-permission-statements-regexp
	   . cil-class-permission-statements-face)
          (,cil-conditional-statements-regexp
	   . cil-conditional-statements-face)
          (,cil-constraint-statements-regexp
	   . cil-constraint-statements-face)
          (,cil-container-statements-regexp
	   . cil-container-statements-face)
          (,cil-context-statement-regexp
	   . cil-context-statement-face)
          (,cil-default-object-statements-regexp
	   . cil-default-object-statements-face)
          (,cil-file-labeling-statements-regexp
	   . cil-file-labeling-statements-face)
          (,cil-infiniband-statements-regexp
	   . cil-infiniband-statements-face)
          (,cil-mls-labeling-statements-regexp
	   . cil-mls-labeling-statements-face)
          (,cil-network-labeling-statements-regexp
	   . cil-network-labeling-statements-face)
          (,cil-policy-config-statements-regexp
	   . cil-policy-config-statements-face)
          (,cil-role-statements-regexp . cil-role-statements-face)
          (,cil-sid-statements-regexp . cil-sid-statements-face)
          (,cil-type-statements-regexp . cil-type-statements-face)
          (,cil-user-statements-regexp . cil-user-statements-face)
          (,cil-xen-statements-regexp . cil-xen-statements-face)
          (,cil-name-string-regexp . cil-name-string-face)
          (,cil-true-false-regexp . cil-true-false-face)
          (,cil-operators-regexp . cil-operators-face)
          (,cil-protocols-regexp . cil-protocols-face)
          (,cil-task-trans-xattr-regexp . cil-task-trans-xattr-face)
          (,cil-self-regexp . cil-self-face)
          (,cil-low-high-glblub-regexp . cil-low-high-glblub-face)
          (,cil-source-target-regexp . cil-source-target-face)
          )))

;;; syntax table
(defvar cil-syntax-table nil "Syntax table for `secil-mode'")

(setq cil-syntax-table
      (let ( (synTable (make-syntax-table)))
        ;; set/modify each char's class

        ;; do not highlight syntax with . and _
        (modify-syntax-entry ?_ "W" synTable)
        (modify-syntax-entry ?. "W" synTable)

        ;; lisp style comment ";; …"
        (modify-syntax-entry ?\; ". 12b" synTable)
        (modify-syntax-entry ?\n "> b" synTable)
        synTable))

;;; command completion with ido
(require 'ido)
(setq cil-keywords
      '("allow" "auditallow" "deny" "dontaudit" "neverallow" "allowx"
        "auditallowx" "dontauditx" "neverallowx" "call" "macro"
        "common" "classcommon" "class" "classorder" "classpermission"
        "classpermissionset" "classmap" "classmapping" "permissionx"
        "boolean" "booleanif" "tunable" "tunableif" "constrain"
        "validatetrans" "mlsconstrain" "mlsvalidatetrans" "block"
        "blockabstract" "blockinherit" "optional" "in" "context"
        "defaultuser" "defaultrole" "defaulttype" "defaultrange"
        "filecon" "fsuse" "genfscon" "ibpkeycon" "ibendportcon"
        "sensitivity" "sensitivityalias" "sensitivityaliasactual"
        "sensitivityorder" "category" "categoryalias"
        "categoryaliasactual" "categoryorder" "categoryset"
        "sensitivitycategory" "level" "levelrange" "rangetransition"
        "ipaddr" "nefifcon" "nodecon" "portcon" "mls" "handleunknown"
        "policycap" "reject" "role" "roletype" "roleattribute"
        "roleattributeset" "roleallow" "roletransition" "rolebounds"
        "sid" "sidorder" "sidcontext" "type" "typealias"
        "typealiasactual" "typeattribute" "typeattributeset"
	"expandtypeattribute" "typebounds" "typechange" "typemember"
	"typetransition" "typepermissive" "user" "userrole"
	"userattribute" "userattributeset" "userlevel" "userrange"
	"userbounds" "userprefix" "selinuxuser" "selinuxuserdefault"
	"iomemcon" "ioportcon" "pcidevicecon" "pirqcon"
	"devicetreecon" "name" "true" "false" "and" "or" "xor" "eq"
	"neq" "not" "all" "dom" "domby" "incomp" "range" "r1" "r2"
	"r3" "t1" "t2" "t3" "u1" "u2" "u3" "l1" "l2" "h1" "h2"
	"string" "dccp" "sctp" "tcp" "udp" "task" "trans" "xattr"
	"self" "low" "high" "low_high" "glblub" "source" "target"))

(defun cil-complete-symbol ()
  "Perform keyword completion on current symbol.
This uses `ido-mode' user interface for completion"
  (interactive)
  (let* (
         ($bds (bounds-of-thing-at-point 'symbol))
         ($p1 (car $bds))
         ($p2 (cdr $bds))
         ($current-sym
          (if  (or (null $p1) (null $p2) (equal $p1 $p2))
              ""
            (buffer-substring-no-properties $p1 $p2)))
         $result-sym)
    (when (not $current-sym) (setq $current-sym ""))
    (setq $result-sym
          (ido-completing-read "" cil-keywords nil nil $current-sym ))
    (delete-region $p1 $p2)
    (insert $result-sym)))

;;; keymap commands
(defvar cil-map nil "Keymap for `secil-mode'")
(progn
  (setq cil-map (make-sparse-keymap))

  ;; ido command completion
  (define-key cil-map (kbd "TAB") 'cil-complete-symbol))

;;;###autoload
(define-derived-mode secil-mode lisp-mode "secil"
  "major mode for editing SELinux Common Intermediate Language (SELinux CIL)"

  ;; keymap
  (use-local-map cil-map)

  ;; comment-dwim support
  (setq-local comment-start "; ")
  (setq-local comment-end "")

  ;; syntax table
  (set-syntax-table cil-syntax-table)

  ;; syntax highlighting
  (setq font-lock-defaults '((cil-highlights))))

(provide 'secil-mode)
;;; secil-mode.el ends here
