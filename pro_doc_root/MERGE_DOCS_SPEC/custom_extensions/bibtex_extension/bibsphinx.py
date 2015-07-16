#!/usr/bin/env python
# encoding: utf-8
#
# Copyright (c) 2010 Doug Hellmann.  All rights reserved.
#
"""Integration of Sphinx with BitBucket.
"""

from docutils import nodes, utils
from docutils.parsers.rst.roles import set_classes

def bibcite_role(name, rawtext, text, lineno, inliner, options={}, content=[]):
    """Link to a BitBucket issue.

    Returns 2 part tuple containing list of nodes to insert into the
    document and a list of system messages.  Both are allowed to be
    empty.

    :param name: The role name used in the document.
    :param rawtext: The entire markup snippet, with role.
    :param text: The text marked with the role.
    :param lineno: The line number where rawtext appears in the input.
    :param inliner: The inliner instance that called us.
    :param options: Directive options for customization.
    :param content: The directive content for customization.
    """
	# todo: parse bibliography-file and search for bibtex-ID
	# try: bla ...
	# exception ... bibtex item not found oder sowas
	# pruefen ob raw-latex definiert wurde, ansonsten selbst definieren
    # registrieren vlt. ueber from docutils.parsers.rst import roles
    # roles.register_local_role(name, role_function)
    # http://docutils.sourceforge.net/docs/howto/rst-roles.html

    cite_text = '\cite{' + text + '}'
    node = nodes.raw('', cite_text, format='latex')#nodes.raw(latex, cite_text)
    return [node], []

def setup(app):
    """Install the plugin.
    
    :param app: Sphinx application context.
    """
    app.info('Initializing BitBucket plugin')
    app.add_role('bibcite', bibcite_role)
    return
