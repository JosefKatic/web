/** @type {import('tailwindcss').Config} */
module.exports = {
    content: ["./src/*.{html,js}"],
    theme: {
        extend: {
            fontFamily: {
                "cousine": ["Cousine", "sans-serif"]
            },
            colors: {
                brand: {
                    900: '#225e61',
                    800: '#2b786b',
                    700: '#358e6d',
                    600: '#40a469',
                    500: '#4bba61',
                    400: '#61c563',
                    300: '#87cf78',
                    200: '#aad990',
                    100: '#c8e2a8',
                },
            }

        },
    },
    plugins: [],
}
