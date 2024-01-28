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

inside your `init.lua`

## Usage Instructions

Upon typing `:QuickBufferJump`, the Quick Buffer Jump floating window will display a list of all open buffers. To navigate to a specific buffer, you can use the `j` and `k` keys, or employ a preferred jumping plugin such as Easy Motion or Leap. Once you have moved the cursor to the desired buffer, press Enter to open it.

For an even more streamlined experience, you can instantly jump to your desired buffer in the active pane by pressing the alphabet letter displayed at the end of the buffer's name. This method is a swift and efficient way to navigate!
