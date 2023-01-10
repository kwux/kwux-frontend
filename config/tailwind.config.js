const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        theme: {
          light: "#fcf0d8",
          dark: "#11011a"
        },
        waterlineBlue: {
          50: "#d3c7f6",
          100: "#c1b7f0",
          200: "#9a98e4",
          300: "#7b84d5",
          400: "#6075c5",
          500: "#4765b0",
          600: "#315497",
          700: "#1f417b",
          800: "#102d5c",
          900: "#061a3c",
        },
        safflowerPurple: {
          50: "#f6c8dc",
          100: "#f0b8d3",
          200: "#e499c3",
          300: "#d57cb5",
          400: "#c461a8",
          500: "#b0489a",
          600: "#973288",
          700: "#7b1f73",
          800: "#5c115a",
          900: "#3b063c",
        },
        epidoteOlveneOre: {
          50: "#f6f1c8",
          100: "#f0e9b8",
          200: "#e4d999",
          300: "#d5c57c",
          400: "#c4ae61",
          500: "#b09248",
          600: "#977232",
          700: "#7b521f",
          800: "#5c3311",
          900: "#3c1806",
        },
        samphireGreen: {
          50: "#c8f6d1",
          100: "#b8f0c5",
          200: "#99e4ad",
          300: "#7cd595",
          400: "#61c47b",
          500: "#48b05e",
          600: "#32973f",
          700: "#1f7b20",
          800: "#1b5c11",
          900: "#173c06",
        },
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
