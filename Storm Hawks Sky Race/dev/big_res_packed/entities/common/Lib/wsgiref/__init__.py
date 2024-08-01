# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/wsgiref/__init__.py
# Compiled at: 2008-12-16 09:38:22
"""wsgiref -- a WSGI (PEP 333) Reference Library

Current Contents:

* util -- Miscellaneous useful functions and wrappers

* headers -- Manage response headers

* handlers -- base classes for server/gateway implementations

* simple_server -- a simple BaseHTTPServer that supports WSGI

* validate -- validation wrapper that sits between an app and a server
  to detect errors in either

To-Do:

* cgi_gateway -- Run WSGI apps under CGI (pending a deployment standard)

* cgi_wrapper -- Run CGI apps under WSGI

* router -- a simple middleware component that handles URL traversal
"""