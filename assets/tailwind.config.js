// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require('tailwindcss/plugin')

module.exports = {
  content: ['./js/**/*.js', '../lib/*_web.ex', '../lib/*_web/**/*.*ex'],
  theme: {
    fontSize: {
      '1xs': '0.8125rem' /* 13px */,
      '1sm': '0.938rem' /* 15px */,
      '1xl': '1.375rem' /* 22px */,
    },
    screens: {
      /* Responsive breakpoints */
      sm: '375px',
      // => @media (min-width: 375px) { ... }
      md: '768px',
      // => @media (min-width: 768px) { ... }
      lg: '1240px',
      // => @media (min-width: 1240px) { ... }
    },
    extend: {
      fontFamily: {
        montserrat: ['Montserrat', 'sans-serif'],
      },
      colors: {
        brand: '#FD4F00',
        indigo: {
          450: '#755FFF',
          650: '#5337FF',
          850: '#322199',
          925: '#28177E',
          935: '#211666',
          950: '#110B33',
        },
      },
      margin: {
        '22px': '22px',
        '33px': '33px',
        '35px': '35px',
        '2pct': '2%',
        '3pct': '3%',
        '4pct': '4%',
        '5pct': '5%',
        '20pct': '20%',
        '30pct': '30%',
        '10pct': '10%',
      },
      padding: {
        '3pct': '3%',
        '30pct': '30%',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    plugin(({ addVariant }) =>
      addVariant('phx-no-feedback', ['.phx-no-feedback&', '.phx-no-feedback &'])
    ),
    plugin(({ addVariant }) =>
      addVariant('phx-click-loading', [
        '.phx-click-loading&',
        '.phx-click-loading &',
      ])
    ),
    plugin(({ addVariant }) =>
      addVariant('phx-submit-loading', [
        '.phx-submit-loading&',
        '.phx-submit-loading &',
      ])
    ),
    plugin(({ addVariant }) =>
      addVariant('phx-change-loading', [
        '.phx-change-loading&',
        '.phx-change-loading &',
      ])
    ),
  ],
}
