const withNextra = require('nextra')({
  theme: 'nextra-theme-docs',
  themeConfig: './theme.config.tsx',
})

const nextConfig = {
  output: 'export',
  images: {
    unoptimized:true,
    // loader: 'custom',
    // loaderFile: './my-loader.ts',
  },
  distDir: 'dist'
}

module.exports = withNextra(nextConfig)
