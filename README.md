# Quick Buffer Jump

Quick buffer jump makes switching between open buffers more intuitive. All you need to do is invoke the quick buffer jump screen and press the letter next to the buffer to jump to that buffer in the current active pane

## Demo

![Quick Buffer Jump Demo](https://github.com/sathishmanohar/quick-buffer-jump/assets/270991/73eab4f7-aa66-4096-a120-b5aef81eda9c)


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


### Ergonomic Alphabet Option
To switch the default buffer labels from `abcd...` to `asdf...`, the `ergonmic_alphabet` option can be passed as a
table to the setup function like the example below:

`require "quick_buffer_jump".setup{ ergonmic_alphabet = true }`


## Usage Instructions

Upon typing `:QuickBufferJump`, the Quick Buffer Jump floating window will display a list of all open buffers. To navigate to a specific buffer, you can use the `j` and `k` keys, or employ a preferred jumping plugin such as Easy Motion or Leap. Once you have moved the cursor to the desired buffer, press Enter to open it.

For an even more streamlined experience, you can instantly jump to your desired buffer in the active pane by pressing the alphabet letter displayed at the end of the buffer's name. This method is a swift and efficient way to navigate!

## How is this different from :Telescope buffers or similar approaches

Compared to the :Telescope buffers, Quick Buffer Jump offers a faster way to jump an open buffer, requiring less typing.
