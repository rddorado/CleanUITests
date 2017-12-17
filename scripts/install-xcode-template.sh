#!/usr/bin/env sh

# Configuration
XCODE_TEMPLATE_DIR=$HOME'/Library/Developer/Xcode/Templates/File Templates/Custom'
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

xcodeTemplate () {
  echo "==> Copying Xcode file templates..."

  if [ -d "$XCODE_TEMPLATE_DIR" ]; then
    rm -R "$XCODE_TEMPLATE_DIR"
  fi
  mkdir -p "$XCODE_TEMPLATE_DIR"

  cp -R $SCRIPT_DIR/*.xctemplate "$XCODE_TEMPLATE_DIR"
#    cp -R $SCRIPT_DIR/UITestCase.xctemplate/ownsView/* "$XCODE_TEMPLATE_DIR/UITestCase.xctemplate/ownsViewwithXIB/"
#  cp -R $SCRIPT_DIR/UITestCase.xctemplate/ownsView/* "$XCODE_TEMPLATE_DIR/UITestCase.xctemplate/ownsViewwithStoryboard/"
}

xcodeTemplate

echo "==> ... success!"
echo "==> Custom Templates have been set up. In Xcode, select 'New File...' to use custom templates."
