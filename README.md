# heirloom cookbook [![Build Status](https://secure.travis-ci.org/intuit/heirloom-cookbook.png?branch=master)](http://travis-ci.org/intuit/heirloom-cookbook)

**!!! This project has been deprecated. We recommend you fork it to your local repo if you continue to rely upon it !!!**

Installs the heirloom pacakage manager RPM and provides an LWRP for downloading heirlooms.

# Requirements

Tested on Chef 10 and 11

# Usage

## Attributes

The following attributes are configurable currently:

 * version
 * package_name

## Recipes

The default recipe installs the heirloom rpm package which contains the heirloom ruby gem and dependent gems.

## LWRP

### heirloom\_archive

Manages heirlooms - only supported action is download (the default).

Example usage:

    heirloom_archive "my-heirloom-name" do
      id "v1.1.1"
      output "/tmp/heirloom"
    end

All heirloom options are supported - for a full list consult the heirloom documentation:

    $ heirloom download -h


## Libraries

### heirloom_url_parser

Used to convert the URI that is used with simple_deploy into a format that can be used by the Heirloom LWRP

example..
HeirloomURLParser.new('s3://bucket-prefix-us-southeast-1/lc/c89204.tar.gz')

# Author
Author:: Intuit, Inc. (@brettweavnet)
