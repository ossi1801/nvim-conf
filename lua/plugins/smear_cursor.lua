return {
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",  -- Lazy-load after startup to keep NvChad fast
    opts = {
      -- Enable smear when switching buffers/windows (default: true)
      smear_between_buffers = true,
      -- Enable smear for moves within/to neighbor lines (default: true)
      smear_between_neighbor_lines = true,
      -- Minimum distances to trigger smear (defaults: 0 for both)
      min_horizontal_distance_smear = 0,
      min_vertical_distance_smear = 0,
      -- Enable directional smears (defaults: true for all)
      smear_horizontally = true,
      smear_vertically = true,
      smear_diagonally = true,
      -- Insert mode support (default: true)
      smear_insert_mode = true,
      -- Use legacy symbols for better blending (default: false; set true if using compatible font)
      legacy_computing_symbols_support = false,
    },
  },
}
