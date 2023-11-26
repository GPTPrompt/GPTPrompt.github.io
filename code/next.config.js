const CopyWebpackPlugin = require('copy-webpack-plugin');

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
  distDir: 'dist',
  // webpack: (config, { buildId, dev, isServer, defaultLoaders, webpack }) => {
  //   // 在构建完成后，复制自定义资源到 _next/static 目录
  //   // if (!dev) {
  //     console.log('Executing custom webpack configuration');
  //     config.plugins.push(
  //       new CopyWebpackPlugin({
  //         patterns: [
  //           {
  //             from: 'dist/_next',
  //             to: 'dist/prompt',
  //           },
  //         ],
  //       })
  //     );
  //   // }
  //   return config;
  // },
}

module.exports = withNextra(nextConfig)
