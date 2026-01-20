#!/usr/bin/env raku

# This script reads the lib/Text/Emoji.rakumod file, and generates the
# lookup Map in it.  It uses the currently available "emojis.json" file
# unless "update" is specified as a positional argument.

# always use highest version of Raku
use v6.*;

my $emojis-io := $*PROGRAM.parent(2).add("resources/emojis.json");
my @emojis;
my %reverse;

my sub normalize(%map) {
    my @aliases;
    my $emoji := %map<emoji>;
    for %map<aliases><> -> $alias {
        if $alias.contains('_') {
            my $hyphened := $alias.trans("_" => "-");
            my $cleaned  := $alias.trans("_" => "");
            @aliases.push: $hyphened => %map;
            @aliases.push: $cleaned  => %map;
            %reverse{$emoji}.push: $hyphened;
        }
        else {
            @aliases.push: $alias => %map;
            %reverse{$emoji}.push: $alias;
        }
    }
    @aliases.Slip
}

if @*ARGS.head -> $command {
    if $command eq 'update' {
        my $proc := run <curl https://raw.githubusercontent.com/github/gemoji/master/db/emoji.json>, :out, :err;

        if $proc.exitcode -> $exitcode {
            if $proc.err.slurp -> $errors {
                note $errors;
            }
            else {
                note "Exited with: $exitcode";
            }
            exit 1;
        }
        
        if $proc.out.slurp -> $json {
            $emojis-io.spurt: $json;
            @emojis = Rakudo::Internals::JSON
              .from-json($json).map(&normalize).sort(*.key)
        }
        else {
            note "No emoji data obtained";
            exit 1;
        }
    }
    else {
        note "Don't know how to handle: @*ARGS";
        exit 1;
    }
}
else {
    @emojis = Rakudo::Internals::JSON
      .from-json($emojis-io.slurp).map(&normalize).sort(*.key);
}

# Make sure the shortest alternative is first
$_ = .sort(*.chars).Str for %reverse.values;

my $e-width  := @emojis.map(*.key.chars).max;
my $e-format := Format.new("%-{$e-width}s %s\n");
$*PROGRAM.parent(2).add("resources/emojis").spurt:
  @emojis.map({ $e-format(.key, .value<emoji>) }).join;

my $s-width  := %reverse.map(*.value.chars).max;
my $s-format := Format.new("%-{$s-width}s %s\n");
$*PROGRAM.parent(2).add("resources/sijome").spurt:
  %reverse.sort(*.value).map({ $s-format(.value, .key) }).join;

# vim: expandtab sw=4
