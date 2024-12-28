[![Actions Status](https://github.com/lizmat/Text-Emoji/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/Text-Emoji/actions) [![Actions Status](https://github.com/lizmat/Text-Emoji/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/Text-Emoji/actions) [![Actions Status](https://github.com/lizmat/Text-Emoji/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/Text-Emoji/actions)

NAME
====

Text::Emoji - provide :text: to emoji translation

SYNOPSIS
========

```raku
use Text::Emoji;

say to-emoji("I :heart: :beer:");  # I ❤️ 🍺
```

DESCRIPTION
===========

The `Text::Emoji` distribution exports a single subroutine `to-emoji` which takes a single string argument. It then attempts to translate any emoji text shortcuts to the actual unicode equivalent.

INSPIRATION
===========

Inspired by Simon Harms' [`Avolution::Emoji`](https://github.com/ukn-ubi/Avolution-Emoji) module, but completely re-imagined from scratch using the table provided by the [`gemoji`](https://github.com/github/gemoji) library.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Text-Emoji . Comments and Pull Requests are welcome.

If you like this module, or what I'm doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2024 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

