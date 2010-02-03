= Smarty test integration =

== Background ==

Laurent and me (Thomas) spoke about some technical difficults
currently underling ispCP implementation. We agreed that I create a sample
branch for a Smarty integration in ispCP. So, this is done...

Currently, the translation and escaping is done within ispCP application
source. The best practise is to remove escaping completely from the PHP
source code. That sounds dangerous, but it is better - read on why.
Best practise for variable output in a Smarty template:

  {$variable|escape}

The default escaping is HTML. If we use this escape (so called) "modifier"
for every variable output, we are mostly clean for XSS. The escaping is done
by ready-to-run-plugin functions of Smarty by using "htmlentities".

Another goal is, to strip the HTML entities off the po-files and let
Smarty do the escaping. The main reason for this is to use the same text
passages for HTML, E-Mail or other output formats.

An example of a good Smarty implementation that is also readably by
gettext:

  {_GT ("Good morning") escape=html}

To do this we had to code at least one smarty plugin. All translations
that the user should se can be written inside the template. Other
escaping methods could be "javascript", "iso-8859-1", ...

In my profession I have created other modifiers and functions, so
that I am able to create a PDF document by a Smarty template :-)


== How Smarty works - in short ==
Smarty does not parse the template every time. The template is
compiled to native php code and stored in a folder "templates_c".
If the time stamp of a file changes, the file will be compiled again.
The compile act needs some resources, but it's an infrequent act.

We use Smarty also for heavy-loaded internet shop systems (e.g. 20000
unique visitory by day). It's not the bottleneck.

So, Smarty is not slow ;-)


== Notes to implementation ==

=== Smarty template structure in ispCP ===
I've made a small change in the template structure for the Smarty
implementation. Every template folder has a file called "main.tpl".
This is the "outer" wrap for each other inner content. Have a look
at "smarty_test/main.tpl" and "smarty_test/index.tpl". The main.tpl
in this folder is very clear, because we don't have a big wrapper.

=== Control elements ===
Also I wanted to create some control element plugins in a new folder
for our use Smarty. The content for these controls can be found
under "smarty_test/controls/".

Currently there seems to be a bug in the beta of Smarty 3 (don't want
to use old Smarty 2 if using new implementation).

=== Test implementation ===
The following scripts are running with Smarty:

- index.php (with/without maintenance mode)
- lostpassword.php
- reseller/ticket_create.php

In the small sample of reseller ticket creation, you can see that
even a "simple" implementation of Smarty will reduce code in PHP!


To be continued...

---
Author: Thomas Wacker <zuhause@thomaswacker.de>