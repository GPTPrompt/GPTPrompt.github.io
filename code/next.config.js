const withNextra = require('nextra')({
  theme: 'nextra-theme-docs',
  themeConfig: './theme.config.tsx',
})

const nextConfig = {
  output: 'export',
  // basePath: '/code', // Set your repository name
  // assetPrefix: '/code/',
  images: {
    unoptimized: true,
    // loader: 'custom',
    // loaderFile: './my-loader.ts',
  },
  distDir: 'dist'
}

module.exports = withNextra(nextConfig)
