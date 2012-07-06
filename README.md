###### Guard-CTags-Composer
=

Guard-CTags-Composer generates [ctags](http://ctags.sourceforge.net) for your PHP project and for `vendor` libs.
For project tags file `tags` is generated, for vendor tags file `gems.tags` is generated.

Features
-

* When you run `composer install` in your project, `vendor.tags` file is automatically is generated or updated.
* When you save one of you project's php files, `tags` file is automatically generated or updated.

## Install

Make sure you have [Guard](http://github.com/guard/guard) installed.

Install the gem:

    $ gem install guard-ctags-composer

Add a basic setup to your `Guardfile`:

    $ guard init ctags-composer

## Usage

    $ guard

For more info, read [Guard usage doc](https://github.com/guard/guard#readme)

## Guardfile Options

``` ruby
:src_path => ".", # source path to be scanned for tags (default `src`)
:vendor_path => ".", # source path to be scanned for vendor tags (default `vendor`)
:emacs => false, # run ctags in emacs mode and merge tags and gems.tags into TAGS file
```

For a typical [Symfony2](http://symfony.com/) application, `Guardfile` can look like this (default):

    guard 'ctags-composer', :src_path => ["src"], :vendor_path => ["vendor"] do
      watch(/^(src)\/.*\.php/)
      watch('composer.lock')
    end

## CTags

[Ctags](http://ctags.sourceforge.net) generates an index (or tag) file of language objects found in
source files that allows these items to be quickly and easily located by a text editor or other utility.
A tag signifies a language object for which an index entry is available (or, alternatively, the index
entry created for that object). 

In ubuntu you can install ctags by running

    $ sudo apt-get install exuberant-ctags

## Vim

Vim supports ctags by default. All you need to do is add your `gems.tags` file to the Vim's tag stack.

    set tags+=vendor.tags

## Emacs

Ctags can be used with emacs too. Add `:emacs => true` option to your Guardfile and ctags will be generated with `-e` option:

    guard 'ctags-composer', :emacs => true do
      watch(/^(src)\/.*\.php/)
      watch('composer.lock')
    end

## Fork

This version is a forked edition of `guard-ctags-bundler` gem.
