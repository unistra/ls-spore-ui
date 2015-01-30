ls-spore-ui
===========

An UI for SPORE webservices based on ls-spore.


Usage
=====

Install dependencies
--------------------

.. code-block:: bash

    bower install

Config
------

Complete the "ls/config.ls" file :

.. code-block:: bash

    cp ls/config.ls.sample ls/config.ls
    vi ls/config.ls
    lsc -c ls/config.ls -o js/

Run
---

Run a simple http server. You can use nginx, apache, python, node etc ...

.. code-block:: bash

    python -m SimpleHTTPServer 8001


Use
---

* Select a SPORE client with the "Clients" menu
* Add a token for authentication
* Select a method with the "Methods" menu
* Complete the form and launch the search


Developement
============

Use Livescript
--------------
use the following lines to compile livescript to javascript :

.. code-block:: bash

    sudo npm install -g LiveScript
    lsc -wc ls/*.ls -o js/


TODO
----

* PUT, PATCH methods
* Add more authentication methods
* Cookies to store tokens
* Improved forms
* Error handling



