# Quick Buffer Jump

Quick buffer jump makes switching between open buffers more intuitive. All you need to do is invoke the quick buffer jump screen and press the letter next to the buffer to jump to that buffer in the current active pane

## Installation Instructions

### Vim Plug

  ```vimscript
  Plug 'sathishmanohar/quick-buffer-jump'
  ```

### For Packer

   ```lua
   use 'sathishmanohar/quick-buffer-jump'
   ```

### For Lazy

   ```lua
    require'lazy'.setup {
        plugins = {
            -- Other plugins...
            'sathishmanohar/quick-buffer-jump',
        },
    }
   ```

## Require the plugin

To use the plugin require the lua module with

`require "quick_buffer_jump"`

## Usage

Now the Quick Buffer Jump floating window should appear with the list of all open buffers when you type `:QuickBufferJump`

You can jump to the buffer by jumping to the buffer you want to jump by `j k` keys or with your favorite jumping plugin like Easy Motion or leap.

Even better you can just press the alphabet listed at the end the buffer you want to jump and jump straight to that buffer in your active pane.
