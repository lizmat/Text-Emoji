use Map::Match:ver<0.0.8+>:auth<zef:lizmat>;

#- set up lookup Maps ----------------------------------------------------------
my constant %lookup = %?RESOURCES<emojis>.lines.map: {
    .split(/ \s+ /, 2).Slip if $_ && !.starts-with('#')  # UNCOVERABLE
}
my constant %reverse = %?RESOURCES<sijome>.lines.map: {
    if $_ && !.starts-with("#") {  # UNCOVERABLE
        my @words = .words;
        @words.pop => @words.List  # UNCOVERABLE
    }
}
my $by-tag := BEGIN my %by-tag is Map::Match = %?RESOURCES<tags>.lines.map: {
    Pair.new(|.split(/ \s+ /, 2)) if $_ && !.starts-with("#") # UNCOVERABLE
}

#- to-emoji --------------------------------------------------------------------
my proto sub to-emoji(|) is export {*}
my multi sub to-emoji(Str:D $text) is default {
    $text.contains(":")
      ?? $text.trans: / ":" <[\w+-]>+ ":" / => {
             %lookup{$/.substr(1, *-1).lc} || $/.Str
         }
      !! $text
}
my multi sub to-emoji(Str:D $text, %additional) {
    $text.contains(":")
      ?? $text.trans: / ":" <[\w+-]>+ ":" / => {
             my $key = $/.substr(1, *-1).lc;
             if %additional{$key} -> $value {
                 %lookup{$value} || $value
             }
             else {
                 %lookup{$key} || $/.Str
             }
         }
      !! $text
}
my multi sub to-emoji(Str:D $text, *%_) { to-emoji($text, %_) }

#- to-text ---------------------------------------------------------------------
my proto sub to-text(|) is export {*}
my multi sub to-text(Str:D $text) is default {
    my int $from;
    my int $to;
    my str @parts;

    for $text.comb -> $grapheme {
        if %reverse{$grapheme} -> $alternatives {
            @parts.push: $text.substr($from, $to - $from);
            @parts.push: ":$alternatives.head():";
            $from = ++$to;  # UNCOVERABLE
        }
        else {
            ++$to;
        }
    }

    # graphemes found
    if @parts {
        @parts.push: $text.substr($from, $to - $from);
        @parts.join
    }

    # no work done
    else {
        $text
    }
}
my multi sub to-text(Str:D $text, %extra) {
    my %additional is Map = %extra.map: {
        (%lookup{.value} || .value) => .key
    }
    my int $from;
    my int $to;
    my str @parts;

    for $text.comb -> $grapheme {
        if %additional{$grapheme} || %reverse{$grapheme} -> $alternatives {
            @parts.push: $text.substr($from, $to - $from);
            @parts.push: ":$alternatives.head():";
            $from = ++$to;  # UNCOVERABLE
        }
        else {
            ++$to;
        }
    }

    # graphemes found
    if @parts {
        @parts.push: $text.substr($from, $to - $from);
        @parts.join
    }

    # no work done
    else {
        $text
    }
}
my multi sub to-text(Str:D $text, *%_) { to-text($text, %_) }

#- raw-emoji-data --------------------------------------------------------------
my $raw;
my sub raw-emoji-data() is export {
    $raw // ($raw := Rakudo::Internals::JSON.from-json(
      %?RESOURCES<emojis.json>.slurp
    ).map({ .<emoji>:delete => .Map }).Map)
}

# vim: expandtab shiftwidth=4

#- by-tag ----------------------------------------------------------------------
my sub by-tag() is export { $by-tag }

# vim: expandtab shiftwidth=4
