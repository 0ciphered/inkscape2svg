#!/bin/sh

# Author: 0ciphered

xml='<?xml version="1.0" encoding="UTF-8" standalone="no"?>'
doc='<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">'

# namespaces
ns_ink="http://www.inkscape.org/namespaces/inkscape"
ns_sod="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
ns_pur="http://purl.org/dc/elements/1.1/"
ns_cco="http://creativecommons.org/ns#"
ns_w3o="http://www.w3.org/1999/02/22-rdf-syntax-ns#"

# Remove attributes and nodes
xmlstarlet edit \
           -N pur="$ns_pur" \
           -N cco="$ns_cco" \
           -N w3o="$ns_w3o" \
           -N sod="$ns_sod" \
           -N ink="$ns_ink" \
           -d "//attribute::*[namespace-uri()='$ns_ink']" \
           -d "//node()[namespace-uri()='$ns_sod']" \
           -d "//attribute::*[namespace-uri()='$ns_sod']" \
           -d "//node()[namespace-uri()='$ns_pur']" \
           -d "//node()[namespace-uri()='$ns_cco']" \
           -d "//node()[namespace-uri()='$ns_w3o']" "$1" \
           | sed '1d' \
           | (printf "%s\n%s\n" "${xml}" "${doc}"; cat)
