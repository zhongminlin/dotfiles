local ensure_packer = function()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup {
  function(use)
    use 'wbthomason/packer.nvim'
    -- In Buffer ( Auto )
    use {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require('colorizer').setup()
      end
    }
    use {
      'lukas-reineke/indent-blankline.nvim',

    }


    -- UI
    use 'RRethy/nvim-base16'
    use {
      'kyazdani42/nvim-tree.lua',
      require = {
	      'nvim-tree/nvim-web-devicons',
      },
      config = function()
        require('nvim-tree').setup()
      end
    }
    use { 'echasnovski/mini.starter',
      config = function()
        require('plugins.starter')
      end
    }

    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
    }
    use {
      'akinsho/bufferline.nvim',
      config = function()
        require('bufferline').setup()
      end
    }

    -- Completion, LSP
    use {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup()
      end
    }

    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }
    use {
      'AlphaTechnolog/pywal.nvim', as = 'pywal'
      -- config = function()
      --   require('pywal').setup()
      -- end
    }
    use {
      'nvim-lualine/lualine.nvim',
      config = function()
        require('lualine').setup {
          options = {
            theme = 'base16',
          },
        }
      end
    }

    if packer_bootstrap then
      require('packer').sync()
    end

  end,

  config = {
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'single' }
      end,
      prompt_border = 'single',
    }
  }
}
