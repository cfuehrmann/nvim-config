local cmp = require "cmp"

cmp.setup {
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Esc>"] = cmp.mapping.close(),
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = "[Buffer]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "buffer" },
  },
}
