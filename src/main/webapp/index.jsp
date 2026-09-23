!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Waffle Royale | Artisanal Gourmet Waffles</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700;800;900&family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        royale: {
                            gold: '#D4AF37',
                            lightGold: '#F3E5AB',
                            darkGold: '#AA7C11',
                            amber: '#1F140E',
                            deepAmber: '#120B07',
                            cardBg: '#1C120C',
                            accent: '#C5A059',
                            cream: '#FAF6EF',
                            chocolate: '#2C1B10',
                            crimson: '#8B0000'
                        }
                    },
                    fontFamily: {
                        cinzel: ['Cinzel', 'serif'],
                        sans: ['Plus Jakarta Sans', 'sans-serif']
                    },
                    boxShadow: {
                        'gold-glow': '0 0 25px rgba(212, 175, 55, 0.25)',
                        'gold-glow-lg': '0 0 40px rgba(212, 175, 55, 0.4)'
                    }
                }
            }
        }
    </script>
    <style>
        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
        }
        ::-webkit-scrollbar-track {
            background: #120B07;
        }
        ::-webkit-scrollbar-thumb {
            background: #D4AF37;
            border-radius: 4px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: #AA7C11;
        }
        
        .gold-gradient-text {
            background: linear-gradient(135deg, #FFF0C2 0%, #D4AF37 50%, #9A7B1C 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .gold-gradient-bg {
            background: linear-gradient(135deg, #D4AF37 0%, #AA7C11 100%);
        }

        .gold-border-gradient {
            border-image: linear-gradient(to bottom right, #D4AF37, #4A3319) 1;
        }

        .glass-panel {
            background: rgba(28, 18, 12, 0.85);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
        }
    </style>
</head>
<body class="bg-royale-deepAmber text-royale-cream font-sans antialiased selection:bg-royale-gold selection:text-black">

    <!-- Toast Notification Container -->
    <div id="toast-container" class="fixed top-24 right-5 z-50 flex flex-col gap-3 pointer-events-none"></div>

    <!-- Navigation Bar -->
    <header class="fixed top-0 left-0 right-0 z-40 glass-panel border-b border-royale-gold/20 transition-all duration-300">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-20 flex items-center justify-between">
            <!-- Brand Logo -->
            <a href="#" class="flex items-center gap-3 group">
                <div class="w-12 h-12 rounded-full border-2 border-royale-gold flex items-center justify-center bg-royale-chocolate group-hover:shadow-gold-glow transition-all duration-300">
                    <i class="fa-solid font-bold text-xl text-royale-gold fa-crown"></i>
                </div>
                <div>
                    <span class="font-cinzel text-2xl font-bold tracking-widest gold-gradient-text block leading-none">WAFFLE</span>
                    <span class="text-[10px] tracking-[0.3em] uppercase text-royale-lightGold block mt-1 font-semibold">Royale • Gourmet</span>
                </div>
            </a>

            <!-- Desktop Navigation Links -->
            <nav class="hidden md:flex items-center gap-8">
                <a href="#hero" class="text-sm uppercase tracking-wider text-royale-cream hover:text-royale-gold transition-colors">Home</a>
                <a href="#menu" class="text-sm uppercase tracking-wider text-royale-cream hover:text-royale-gold transition-colors">Menu</a>
                <a href="#customizer" class="text-sm uppercase tracking-wider text-royale-gold font-semibold flex items-center gap-1 hover:brightness-125 transition-all">
                    <i class="fa-solid fa-wand-magic-sparkles text-xs"></i> Builder
                </a>
                <a href="#story" class="text-sm uppercase tracking-wider text-royale-cream hover:text-royale-gold transition-colors">Our Story</a>
                <a href="#reviews" class="text-sm uppercase tracking-wider text-royale-cream hover:text-royale-gold transition-colors">Reviews</a>
            </nav>

            <!-- Action Buttons & Cart Trigger -->
            <div class="flex items-center gap-4">
                <button id="cart-btn" onclick="toggleCart()" class="relative p-3 rounded-full bg-royale-amber border border-royale-gold/30 hover:border-royale-gold hover:shadow-gold-glow transition-all group">
                    <i class="fa-solid fa-shopping-bag text-royale-gold group-hover:scale-110 transition-transform"></i>
                    <span id="cart-badge" class="absolute -top-1 -right-1 w-5 h-5 bg-royale-gold text-royale-deepAmber font-bold text-xs rounded-full flex items-center justify-center scale-0 transition-transform duration-300">0</span>
                </button>

                <a href="#customizer" class="hidden sm:inline-flex items-center gap-2 px-5 py-2.5 rounded-full gold-gradient-bg text-royale-deepAmber font-bold text-xs tracking-wider uppercase hover:shadow-gold-glow hover:scale-105 transition-all">
                    <span>Craft Waffle</span>
                    <i class="fa-solid fa-arrow-right"></i>
                </a>

                <!-- Mobile Menu Button -->
                <button id="mobile-menu-btn" onclick="toggleMobileMenu()" class="md:hidden text-royale-gold text-2xl p-2 focus:outline-none">
                    <i class="fa-solid fa-bars"></i>
                </button>
            </div>
        </div>

        <!-- Mobile Navigation Menu -->
        <div id="mobile-menu" class="hidden md:hidden bg-royale-cardBg border-b border-royale-gold/20 px-6 py-4 flex flex-col gap-4">
            <a href="#hero" onclick="toggleMobileMenu()" class="text-sm uppercase tracking-wider text-royale-cream py-1">Home</a>
            <a href="#menu" onclick="toggleMobileMenu()" class="text-sm uppercase tracking-wider text-royale-cream py-1">Menu</a>
            <a href="#customizer" onclick="toggleMobileMenu()" class="text-sm uppercase tracking-wider text-royale-gold font-bold py-1">Waffle Customizer</a>
            <a href="#story" onclick="toggleMobileMenu()" class="text-sm uppercase tracking-wider text-royale-cream py-1">Our Story</a>
            <a href="#reviews" onclick="toggleMobileMenu()" class="text-sm uppercase tracking-wider text-royale-cream py-1">Reviews</a>
        </div>
    </header>

    <!-- Hero Section -->
    <section id="hero" class="relative min-h-screen pt-28 pb-16 flex items-center justify-center overflow-hidden">
        <!-- Background Ambient Glows -->
        <div class="absolute top-1/4 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[600px] bg-royale-gold/10 rounded-full blur-[140px] pointer-events-none"></div>
        <div class="absolute bottom-10 left-10 w-80 h-80 bg-royale-crimson/10 rounded-full blur-[100px] pointer-events-none"></div>

        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 grid grid-cols-1 lg:grid-cols-2 gap-12 items-center relative z-10">
            <!-- Hero Copy -->
            <div class="space-y-6 text-center lg:text-left">
                <div class="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-royale-amber border border-royale-gold/40 shadow-gold-glow">
                    <span class="w-2 h-2 rounded-full bg-royale-gold animate-ping"></span>
                    <span class="text-xs font-semibold tracking-widest uppercase text-royale-lightGold">Handcrafted Royal Treats</span>
                </div>
                
                <h1 class="font-cinzel text-4xl sm:text-6xl lg:text-7xl font-extrabold leading-tight">
                    Indulge in <br>
                    <span class="gold-gradient-text">Artisanal</span> Perfection
                </h1>

                <p class="text-royale-cream/80 text-base sm:text-lg max-w-xl mx-auto lg:mx-0 leading-relaxed font-light">
                    Savor the pinnacle of culinary luxury. Freshly baked liege waffles infused with authentic Belgian pearl sugar, topped with 24k gold leaf and premium ingredients.
                </p>

                <div class="flex flex-col sm:flex-row items-center justify-center lg:justify-start gap-4 pt-4">
                    <a href="#menu" class="w-full sm:w-auto px-8 py-4 rounded-full gold-gradient-bg text-royale-deepAmber font-extrabold text-sm tracking-widest uppercase hover:shadow-gold-glow hover:-translate-y-0.5 transition-all text-center">
                        Explore Full Menu
                    </a>
                    <a href="#customizer" class="w-full sm:w-auto px-8 py-4 rounded-full bg-royale-amber border border-royale-gold/50 text-royale-gold font-bold text-sm tracking-widest uppercase hover:bg-royale-gold/10 hover:border-royale-gold transition-all text-center flex items-center justify-center gap-2">
                        <i class="fa-solid fa-stroopwafel"></i>
                        <span>Custom Builder</span>
                    </a>
                </div>

                <!-- Trust Badges -->
                <div class="pt-8 border-t border-royale-gold/10 grid grid-cols-3 gap-4 max-w-md mx-auto lg:mx-0 text-center">
                    <div>
                        <div class="font-cinzel text-xl sm:text-2xl font-bold text-royale-gold">100%</div>
                        <div class="text-[11px] text-royale-cream/60 uppercase tracking-wider mt-0.5">Organic Ingredients</div>
                    </div>
                    <div>
                        <div class="font-cinzel text-xl sm:text-2xl font-bold text-royale-gold">24K</div>
                        <div class="text-[11px] text-royale-cream/60 uppercase tracking-wider mt-0.5">Gold Flake Editions</div>
                    </div>
                    <div>
                        <div class="font-cinzel text-xl sm:text-2xl font-bold text-royale-gold">30 Min</div>
                        <div class="text-[11px] text-royale-cream/60 uppercase tracking-wider mt-0.5">Express Luxury Delivery</div>
                    </div>
                </div>
            </div>

            <!-- Hero Visual Feature -->
            <div class="relative flex justify-center">
                <!-- Rotating Decorative Ring -->
                <div class="absolute inset-0 m-auto w-[320px] h-[320px] sm:w-[440px] sm:h-[440px] border border-dashed border-royale-gold/30 rounded-full animate-[spin_40s_linear_infinite] pointer-events-none"></div>

                <!-- Showcase Card -->
                <div class="relative bg-royale-cardBg border border-royale-gold/30 rounded-3xl p-6 sm:p-8 max-w-md w-full shadow-2xl shadow-black/80 hover:border-royale-gold/60 transition-all">
                    <!-- Top Ribbon Badge -->
                    <div class="absolute -top-3 right-6 bg-gradient-to-r from-red-800 to-royale-crimson text-white text-[10px] font-bold tracking-widest uppercase px-4 py-1 rounded-full border border-red-500/30 shadow-md">
                        Chef's Masterpiece
                    </div>

                    <div class="relative rounded-2xl overflow-hidden mb-6 aspect-square bg-royale-chocolate flex items-center justify-center group">
                        <img id="hero-image" src="https://images.unsplash.com/photo-1562376552-0d160a2f238d?auto=format&fit=crop&w=800&q=80" alt="Imperial Gold Waffle" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-700">
                        <div class="absolute inset-0 bg-gradient-to-t from-royale-deepAmber via-transparent to-transparent opacity-80"></div>
                        
                        <!-- Floating Tag -->
                        <div class="absolute bottom-4 left-4 right-4 flex justify-between items-end">
                            <div>
                                <span class="text-xs uppercase tracking-widest text-royale-gold font-semibold">Signature Dish</span>
                                <h3 class="font-cinzel text-lg font-bold text-white">Imperial Gold Belgian</h3>
                            </div>
                            <span class="font-cinzel font-bold text-xl text-royale-lightGold">$28.00</span>
                        </div>
                    </div>

                    <p class="text-xs text-royale-cream/70 mb-6 leading-relaxed">
                        Infused with Madagascar Bourbon vanilla, draped in Valrhona dark chocolate drizzle, fresh berries, and genuine 24K edible gold leaves.
                    </p>

                    <button onclick="addPresetToCart('Imperial Gold Belgian', 28.00, 'https://images.unsplash.com/photo-1562376552-0d160a2f238d?auto=format&fit=crop&w=800&q=80')" class="w-full py-3 rounded-xl gold-gradient-bg text-royale-deepAmber font-bold text-xs uppercase tracking-widest hover:shadow-gold-glow transition-all flex items-center justify-center gap-2">
                        <i class="fa-solid fa-cart-plus"></i>
                        <span>Order This Signature Item</span>
                    </button>
                </div>
            </div>
        </div>
    </section>

    <!-- Interactive "Build Your Own Grand Waffle" Builder -->
    <section id="customizer" class="py-24 bg-gradient-to-b from-royale-deepAmber via-royale-chocolate/40 to-royale-deepAmber relative border-y border-royale-gold/15">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <!-- Section Header -->
            <div class="text-center max-w-2xl mx-auto mb-16">
                <span class="text-xs font-bold tracking-[0.3em] uppercase text-royale-gold">Bespeak Experience</span>
                <h2 class="font-cinzel text-3xl sm:text-5xl font-bold mt-2 gold-gradient-text">Craft Your Custom Waffle</h2>
                <div class="w-16 h-0.5 bg-royale-gold mx-auto mt-4"></div>
                <p class="text-royale-cream/70 text-sm mt-4">Select your tailored foundations, extravagant drizzles, and luxurious toppings below.</p>
            </div>

            <!-- Customizer Container -->
            <div class="grid grid-cols-1 lg:grid-cols-12 gap-10 items-start">
                
                <!-- Steps & Choices (8 Cols) -->
                <div class="lg:col-span-7 space-y-8">
                    
                    <!-- STEP 1: BASE -->
                    <div class="bg-royale-cardBg border border-royale-gold/20 rounded-2xl p-6">
                        <div class="flex items-center gap-3 mb-4">
                            <span class="w-7 h-7 rounded-full bg-royale-gold text-royale-deepAmber font-bold text-sm flex items-center justify-center">1</span>
                            <h3 class="font-cinzel text-lg font-bold text-royale-lightGold">Choose Waffle Base</h3>
                        </div>
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-3" id="base-options">
                            <!-- JS populated or static structure -->
                            <button onclick="selectBase('Classic Belgian Liege', 12.00, this)" class="custom-base-btn active border-2 border-royale-gold bg-royale-amber p-4 rounded-xl text-left transition-all hover:border-royale-gold flex justify-between items-center">
                                <div>
                                    <div class="font-bold text-sm text-royale-cream">Classic Belgian Liege</div>
                                    <div class="text-[11px] text-royale-cream/60">Rich pearl sugar glaze</div>
                                </div>
                                <span class="text-royale-gold font-bold text-sm">$12.00</span>
                            </button>
                            <button onclick="selectBase('Dark Chocolate Ganache', 14.00, this)" class="custom-base-btn border border-royale-gold/20 bg-royale-deepAmber p-4 rounded-xl text-left transition-all hover:border-royale-gold flex justify-between items-center">
                                <div>
                                    <div class="font-bold text-sm text-royale-cream">Dark Cocoa Infused</div>
                                    <div class="text-[11px] text-royale-cream/60">Dutch dark cocoa batter</div>
                                </div>
                                <span class="text-royale-gold font-bold text-sm">$14.00</span>
                            </button>
                            <button onclick="selectBase('Matcha Imperial', 15.00, this)" class="custom-base-btn border border-royale-gold/20 bg-royale-deepAmber p-4 rounded-xl text-left transition-all hover:border-royale-gold flex justify-between items-center">
                                <div>
                                    <div class="font-bold text-sm text-royale-cream">Matcha Imperial</div>
                                    <div class="text-[11px] text-royale-cream/60">Uji ceremonial grade</div>
                                </div>
                                <span class="text-royale-gold font-bold text-sm">$15.00</span>
                            </button>
                            <button onclick="selectBase('Red Velvet Velvet', 14.50, this)" class="custom-base-btn border border-royale-gold/20 bg-royale-deepAmber p-4 rounded-xl text-left transition-all hover:border-royale-gold flex justify-between items-center">
                                <div>
                                    <div class="font-bold text-sm text-royale-cream">Red Velvet Royale</div>
                                    <div class="text-[11px] text-royale-cream/60">Crimson cocoa blend</div>
                                </div>
                                <span class="text-royale-gold font-bold text-sm">$14.50</span>
                            </button>
                        </div>
                    </div>

                    <!-- STEP 2: DRIZZLES -->
                    <div class="bg-royale-cardBg border border-royale-gold/20 rounded-2xl p-6">
                        <div class="flex items-center gap-3 mb-4">
                            <span class="w-7 h-7 rounded-full bg-royale-gold text-royale-deepAmber font-bold text-sm flex items-center justify-center">2</span>
                            <h3 class="font-cinzel text-lg font-bold text-royale-lightGold">Select Drizzle Sauce</h3>
                        </div>
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-3" id="drizzle-options">
                            <button onclick="selectDrizzle('Pure Amber Maple', 3.00, this)" class="custom-drizzle-btn active border-2 border-royale-gold bg-royale-amber p-4 rounded-xl text-left transition-all hover:border-royale-gold flex justify-between items-center">
                                <div>
                                    <div class="font-bold text-sm text-royale-cream">Pure Amber Maple</div>
                                    <div class="text-[11px] text-royale-cream/60">Grade A Canadian syrup</div>
                                </div>
                                <span class="text-royale-gold font-bold text-sm">+$3.00</span>
                            </button>
                            <button onclick="selectDrizzle('Salted Gold Caramel', 4.00, this)" class="custom-drizzle-btn border border-royale-gold/20 bg-royale-deepAmber p-4 rounded-xl text-left transition-all hover:border-royale-gold flex justify-between items-center">
                                <div>
                                    <div class="font-bold text-sm text-royale-cream">Salted Gold Caramel</div>
                                    <div class="text-[11px] text-royale-cream/60">Butter & Fleur de Sel</div>
                                </div>
                                <span class="text-royale-gold font-bold text-sm">+$4.00</span>
                            </button>
                            <button onclick="selectDrizzle('Belgian Milk Chocolate', 3.50, this)" class="custom-drizzle-btn border border-royale-gold/20 bg-royale-deepAmber p-4 rounded-xl text-left transition-all hover:border-royale-gold flex justify-between items-center">
                                <div>
                                    <div class="font-bold text-sm text-royale-cream">Belgian Milk Chocolate</div>
                                    <div class="text-[11px] text-royale-cream/60">Warm melted silky chocolate</div>
                                </div>
                                <span class="text-royale-gold font-bold text-sm">+$3.50</span>
                            </button>
                            <button onclick="selectDrizzle('Wild Berry Reduction', 4.50, this)" class="custom-drizzle-btn border border-royale-gold/20 bg-royale-deepAmber p-4 rounded-xl text-left transition-all hover:border-royale-gold flex justify-between items-center">
                                <div>
                                    <div class="font-bold text-sm text-royale-cream">Wild Berry Coulis</div>
                                    <div class="text-[11px] text-royale-cream/60">Raspberry & Blackberry</div>
                                </div>
                                <span class="text-royale-gold font-bold text-sm">+$4.50</span>
                            </button>
                        </div>
                    </div>

                    <!-- STEP 3: TOPPINGS (MULTIPLE) -->
                    <div class="bg-royale-cardBg border border-royale-gold/20 rounded-2xl p-6">
                        <div class="flex items-center justify-between mb-4">
                            <div class="flex items-center gap-3">
                                <span class="w-7 h-7 rounded-full bg-royale-gold text-royale-deepAmber font-bold text-sm flex items-center justify-center">3</span>
                                <h3 class="font-cinzel text-lg font-bold text-royale-lightGold">Luxury Toppings</h3>
                            </div>
                            <span class="text-xs text-royale-cream/50">(Select multiple)</span>
                        </div>
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-3" id="topping-options">
                            <button onclick="toggleTopping('24K Edible Gold Flakes', 6.00, this)" class="custom-topping-btn border border-royale-gold/20 bg-royale-deepAmber p-4 rounded-xl text-left transition-all hover:border-royale-gold flex justify-between items-center">
                                <div>
                                    <div class="font-bold text-sm text-royale-cream">24K Edible Gold Flakes</div>
                                    <div class="text-[11px] text-royale-cream/60">Pure gold garnish</div>
                                </div>
                                <span class="text-royale-gold font-bold text-sm">+$6.00</span>
                            </button>
                            <button onclick="toggleTopping('Organic Strawberries', 3.50, this)" class="custom-topping-btn border border-royale-gold/20 bg-royale-deepAmber p-4 rounded-xl text-left transition-all hover:border-royale-gold flex justify-between items-center">
                                <div>
                                    <div class="font-bold text-sm text-royale-cream">Organic Strawberries</div>
                                    <div class="text-[11px] text-royale-cream/60">Freshly sliced</div>
                                </div>
                                <span class="text-royale-gold font-bold text-sm">+$3.50</span>
                            </button>
                            <button onclick="toggleTopping('Candied Pecans', 3.00, this)" class="custom-topping-btn border border-royale-gold/20 bg-royale-deepAmber p-4 rounded-xl text-left transition-all hover:border-royale-gold flex justify-between items-center">
                                <div>
                                    <div class="font-bold text-sm text-royale-cream">Candied Pecans</div>
                                    <div class="text-[11px] text-royale-cream/60">Honey roasted crunch</div>
                                </div>
                                <span class="text-royale-gold font-bold text-sm">+$3.00</span>
                            </button>
                            <button onclick="toggleTopping('Madagascar Vanilla Gelato', 5.00, this)" class="custom-topping-btn border border-royale-gold/20 bg-royale-deepAmber p-4 rounded-xl text-left transition-all hover:border-royale-gold flex justify-between items-center">
                                <div>
                                    <div class="font-bold text-sm text-royale-cream">Vanilla Gelato Scoop</div>
                                    <div class="text-[11px] text-royale-cream/60">Artisanal scoop</div>
                                </div>
                                <span class="text-royale-gold font-bold text-sm">+$5.00</span>
                            </button>
                        </div>
                    </div>

                </div>

                <!-- Live Preview Card & Order Summary (5 Cols) -->
                <div class="lg:col-span-5 sticky top-28">
                    <div class="bg-royale-cardBg border-2 border-royale-gold/40 rounded-3xl p-6 sm:p-8 shadow-2xl relative overflow-hidden">
                        <!-- Top Accent Ribbon -->
                        <div class="absolute top-0 left-0 right-0 h-1.5 gold-gradient-bg"></div>

                        <h3 class="font-cinzel text-xl font-bold text-royale-lightGold border-b border-royale-gold/20 pb-4 mb-6 flex items-center justify-between">
                            <span>Your Custom Masterpiece</span>
                            <i class="fa-solid fa-crown text-royale-gold"></i>
                        </h3>

                        <!-- Live Visual Representation -->
                        <div class="relative rounded-2xl h-48 bg-royale-amber mb-6 border border-royale-gold/20 overflow-hidden flex items-center justify-center p-4">
                            <img src="https://images.unsplash.com/photo-1504113076330-118f9816c65a?auto=format&fit=crop&w=600&q=80" alt="Waffle Creation" class="w-full h-full object-cover rounded-xl opacity-80">
                            <div class="absolute inset-0 bg-gradient-to-t from-black via-black/30 to-transparent"></div>
                            
                            <!-- Badges Overlay -->
                            <div class="absolute bottom-3 left-3 right-3 flex justify-between items-end">
                                <span class="text-xs bg-royale-gold text-royale-deepAmber font-bold px-3 py-1 rounded-full uppercase tracking-wider">Custom Blend</span>
                                <span id="builder-price-display" class="font-cinzel text-2xl font-extrabold text-white">$15.00</span>
                            </div>
                        </div>

                        <!-- Selected Composition Breakdown -->
                        <div class="space-y-3 mb-8 text-sm">
                            <div class="flex justify-between items-center text-royale-cream/80 border-b border-royale-gold/10 pb-2">
                                <span class="text-xs uppercase tracking-wider text-royale-gold">Base:</span>
                                <span id="summary-base-name" class="font-medium">Classic Belgian Liege</span>
                            </div>
                            <div class="flex justify-between items-center text-royale-cream/80 border-b border-royale-gold/10 pb-2">
                                <span class="text-xs uppercase tracking-wider text-royale-gold">Drizzle:</span>
                                <span id="summary-drizzle-name" class="font-medium">Pure Amber Maple</span>
                            </div>
                            <div class="text-royale-cream/80">
                                <div class="text-xs uppercase tracking-wider text-royale-gold mb-1">Toppings:</div>
                                <div id="summary-toppings-list" class="text-xs text-royale-cream/70 italic pl-2">None Selected</div>
                            </div>
                        </div>

                        <!-- Add Custom Waffle To Cart Button -->
                        <button onclick="addCustomWaffleToCart()" class="w-full py-4 rounded-xl gold-gradient-bg text-royale-deepAmber font-extrabold text-sm tracking-widest uppercase hover:shadow-gold-glow-lg hover:scale-[1.02] transition-all flex items-center justify-center gap-2">
                            <i class="fa-solid fa-plus-circle text-base"></i>
                            <span>Add Custom Waffle to Cart</span>
                        </button>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- Menu Grid Section -->
    <section id="menu" class="py-24 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center max-w-2xl mx-auto mb-12">
            <span class="text-xs font-bold tracking-[0.3em] uppercase text-royale-gold">Curated Menu</span>
            <h2 class="font-cinzel text-3xl sm:text-5xl font-bold mt-2 gold-gradient-text">Signature Collections</h2>
            <div class="w-16 h-0.5 bg-royale-gold mx-auto mt-4"></div>
        </div>

        <!-- Filter Tabs -->
        <div class="flex flex-wrap items-center justify-center gap-2 sm:gap-4 mb-12">
            <button onclick="filterMenu('all', this)" class="filter-tab active px-6 py-2.5 rounded-full bg-royale-gold text-royale-deepAmber font-bold text-xs uppercase tracking-wider transition-all">All Delights</button>
            <button onclick="filterMenu('signature', this)" class="filter-tab px-6 py-2.5 rounded-full bg-royale-cardBg border border-royale-gold/30 text-royale-cream font-medium text-xs uppercase tracking-wider hover:border-royale-gold transition-all">Signature Waffles</button>
            <button onclick="filterMenu('boxes', this)" class="filter-tab px-6 py-2.5 rounded-full bg-royale-cardBg border border-royale-gold/30 text-royale-cream font-medium text-xs uppercase tracking-wider hover:border-royale-gold transition-all">Royale Gift Boxes</button>
            <button onclick="filterMenu('pairs', this)" class="filter-tab px-6 py-2.5 rounded-full bg-royale-cardBg border border-royale-gold/30 text-royale-cream font-medium text-xs uppercase tracking-wider hover:border-royale-gold transition-all">Dessert Pairs</button>
        </div>

        <!-- Products Grid -->
        <div id="product-grid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <!-- Dynamic menu items will be rendered via JS -->
        </div>
    </section>

    <!-- Brand Story & Craftsmanship Section -->
    <section id="story" class="py-24 bg-royale-cardBg border-y border-royale-gold/20 relative overflow-hidden">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
                
                <!-- Story Visual -->
                <div class="relative">
                    <div class="relative rounded-3xl overflow-hidden border-2 border-royale-gold/30 shadow-2xl">
                        <img src="https://images.unsplash.com/photo-1551024709-8f23befc6f87?auto=format&fit=crop&w=800&q=80" alt="Waffle Crafting Process" class="w-full h-[450px] object-cover">
                        <div class="absolute inset-0 bg-gradient-to-t from-royale-deepAmber via-transparent to-transparent"></div>
                    </div>
                    <div class="absolute -bottom-8 -right-8 hidden sm:flex flex-col bg-royale-amber border-2 border-royale-gold p-6 rounded-2xl shadow-xl max-w-xs">
                        <i class="fa-solid fa-award text-3xl text-royale-gold mb-2"></i>
                        <span class="font-cinzel font-bold text-base text-royale-lightGold">Awarded Best Gourmet Pastry 2025</span>
                        <span class="text-xs text-royale-cream/60 mt-1">International Culinary Guild</span>
                    </div>
                </div>

                <!-- Story Text & Pillars -->
                <div class="space-y-6">
                    <span class="text-xs font-bold tracking-[0.3em] uppercase text-royale-gold">Uncompromised Quality</span>
                    <h2 class="font-cinzel text-3xl sm:text-4xl font-bold gold-gradient-text leading-tight">The Heritage of Pure Belgian Perfection</h2>
                    <p class="text-royale-cream/80 text-sm leading-relaxed">
                        At Waffle Royale, we treat waffle-making as an art form. Our dough is prepared using centuries-old Liege techniques, naturally fermented for 24 hours to develop deep complex flavors, then baked in heavy cast-iron irons imported directly from Belgium.
                    </p>

                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 pt-4">
                        <div class="flex items-start gap-4 p-4 rounded-xl bg-royale-deepAmber border border-royale-gold/10 hover:border-royale-gold/40 transition-all">
                            <div class="w-10 h-10 rounded-full bg-royale-gold/10 flex items-center justify-center text-royale-gold font-bold flex-shrink-0">
                                <i class="fa-solid fa-wheat-awn"></i>
                            </div>
                            <div>
                                <h4 class="font-cinzel font-bold text-sm text-royale-lightGold">Pearl Sugar</h4>
                                <p class="text-xs text-royale-cream/60 mt-1">Authentic imported Belgian sugar that caramelizes inside the batter.</p>
                            </div>
                        </div>

                        <div class="flex items-start gap-4 p-4 rounded-xl bg-royale-deepAmber border border-royale-gold/10 hover:border-royale-gold/40 transition-all">
                            <div class="w-10 h-10 rounded-full bg-royale-gold/10 flex items-center justify-center text-royale-gold font-bold flex-shrink-0">
                                <i class="fa-solid fa-cow"></i>
                            </div>
                            <div>
                                <h4 class="font-cinzel font-bold text-sm text-royale-lightGold">French Charentes Butter</h4>
                                <p class="text-xs text-royale-cream/60 mt-1">Rich 84% fat butter delivering buttery flakes in every bite.</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- Reviews / Testimonials -->
    <section id="reviews" class="py-24 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center max-w-2xl mx-auto mb-16">
            <span class="text-xs font-bold tracking-[0.3em] uppercase text-royale-gold">Patron Praise</span>
            <h2 class="font-cinzel text-3xl sm:text-5xl font-bold mt-2 gold-gradient-text">Words From Epicureans</h2>
            <div class="w-16 h-0.5 bg-royale-gold mx-auto mt-4"></div>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="bg-royale-cardBg border border-royale-gold/20 p-8 rounded-2xl flex flex-col justify-between hover:border-royale-gold/50 transition-all">
                <div class="space-y-4">
                    <div class="flex text-royale-gold gap-1 text-sm">
                        <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                    </div>
                    <p class="text-royale-cream/80 text-sm italic leading-relaxed">
                        "The Imperial Gold Belgian is literally a work of art. The crunch of the pearl sugar combined with 24k gold flakes makes it an unforgettable luxury dessert."
                    </p>
                </div>
                <div class="mt-8 pt-4 border-t border-royale-gold/10 flex items-center gap-3">
                    <div class="w-10 h-10 rounded-full bg-royale-gold/20 flex items-center justify-center font-bold text-royale-gold font-cinzel">EA</div>
                    <div>
                        <div class="font-bold text-sm text-royale-lightGold">Lady Eleanor Vance</div>
                        <div class="text-[11px] text-royale-cream/50">Verified Gourmet Enthusiast</div>
                    </div>
                </div>
            </div>

            <div class="bg-royale-cardBg border border-royale-gold/20 p-8 rounded-2xl flex flex-col justify-between hover:border-royale-gold/50 transition-all">
                <div class="space-y-4">
                    <div class="flex text-royale-gold gap-1 text-sm">
                        <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                    </div>
                    <p class="text-royale-cream/80 text-sm italic leading-relaxed">
                        "Ordered the Royale Celebration Box for a private gala. The presentation was divine and every guest was asking where these were crafted."
                    </p>
                </div>
                <div class="mt-8 pt-4 border-t border-royale-gold/10 flex items-center gap-3">
                    <div class="w-10 h-10 rounded-full bg-royale-gold/20 flex items-center justify-center font-bold text-royale-gold font-cinzel">MC</div>
                    <div>
                        <div class="font-bold text-sm text-royale-lightGold">Chef Marcus Chen</div>
                        <div class="text-[11px] text-royale-cream/50">Michelin Star Critic</div>
                    </div>
                </div>
            </div>

            <div class="bg-royale-cardBg border border-royale-gold/20 p-8 rounded-2xl flex flex-col justify-between hover:border-royale-gold/50 transition-all">
                <div class="space-y-4">
                    <div class="flex text-royale-gold gap-1 text-sm">
                        <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                    </div>
                    <p class="text-royale-cream/80 text-sm italic leading-relaxed">
                        "The online custom builder let me tailor every single drizzle and topping. Fast delivery and packed in warm insulated golden cases."
                    </p>
                </div>
                <div class="mt-8 pt-4 border-t border-royale-gold/10 flex items-center gap-3">
                    <div class="w-10 h-10 rounded-full bg-royale-gold/20 flex items-center justify-center font-bold text-royale-gold font-cinzel">SD</div>
                    <div>
                        <div class="font-bold text-sm text-royale-lightGold">Sophia De-Luca</div>
                        <div class="text-[11px] text-royale-cream/50">Food & Wine Magazine</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Cart Drawer Modal -->
    <div id="cart-drawer-overlay" onclick="toggleCart()" class="fixed inset-0 bg-black/70 backdrop-blur-sm z-50 opacity-0 pointer-events-none transition-opacity duration-300"></div>
    <div id="cart-drawer" class="fixed top-0 right-0 h-full w-full sm:w-[450px] bg-royale-cardBg border-l border-royale-gold/30 z-50 transform translate-x-full transition-transform duration-300 flex flex-col justify-between shadow-2xl">
        
        <!-- Cart Header -->
        <div class="p-6 border-b border-royale-gold/20 flex items-center justify-between">
            <div class="flex items-center gap-3">
                <i class="fa-solid fa-bag-shopping text-royale-gold text-xl"></i>
                <h3 class="font-cinzel text-xl font-bold text-royale-lightGold">Your Selection</h3>
            </div>
            <button onclick="toggleCart()" class="text-royale-cream/60 hover:text-royale-gold text-xl focus:outline-none">
                <i class="fa-solid fa-xmark"></i>
            </button>
        </div>

        <!-- Cart Items List -->
        <div id="cart-items-container" class="p-6 overflow-y-auto flex-1 space-y-4">
            <!-- Dynamic Cart Items Rendered Here -->
        </div>

        <!-- Cart Footer & Checkout -->
        <div class="p-6 border-t border-royale-gold/20 bg-royale-deepAmber space-y-4">
            <div class="space-y-2 text-sm">
                <div class="flex justify-between text-royale-cream/70">
                    <span>Subtotal</span>
                    <span id="cart-subtotal">$0.00</span>
                </div>
                <div class="flex justify-between text-royale-cream/70">
                    <span>Royal Express Delivery</span>
                    <span id="cart-delivery">$5.00</span>
                </div>
                <div class="flex justify-between text-base font-bold text-royale-gold pt-2 border-t border-royale-gold/10">
                    <span>Total Amount</span>
                    <span id="cart-total">$0.00</span>
                </div>
            </div>

            <!-- Promo Input -->
            <div class="flex gap-2">
                <input type="text" id="promo-code" placeholder="Promo Code (e.g. ROYALE10)" class="w-full bg-royale-amber border border-royale-gold/30 rounded-lg px-3 py-2 text-xs text-royale-cream focus:outline-none focus:border-royale-gold uppercase">
                <button onclick="applyPromo()" class="px-4 py-2 bg-royale-gold/20 border border-royale-gold text-royale-gold font-bold text-xs rounded-lg hover:bg-royale-gold hover:text-royale-deepAmber transition-all">Apply</button>
            </div>

            <button onclick="simulateCheckout()" class="w-full py-4 rounded-xl gold-gradient-bg text-royale-deepAmber font-extrabold text-sm tracking-widest uppercase hover:shadow-gold-glow transition-all flex items-center justify-center gap-2">
                <span>Proceed to Checkout</span>
                <i class="fa-solid fa-lock text-xs"></i>
            </button>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-royale-deepAmber border-t border-royale-gold/20 pt-16 pb-8 text-royale-cream/70">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-10 mb-12">
                
                <!-- Col 1: Brand -->
                <div class="space-y-4">
                    <a href="#" class="flex items-center gap-3">
                        <div class="w-10 h-10 rounded-full border border-royale-gold flex items-center justify-center bg-royale-chocolate">
                            <i class="fa-solid font-bold text-base text-royale-gold fa-crown"></i>
                        </div>
                        <span class="font-cinzel text-xl font-bold tracking-widest gold-gradient-text">WAFFLE ROYALE</span>
                    </a>
                    <p class="text-xs leading-relaxed">
                        Crafting unforgettable moments of culinary luxury through authentic Belgian Liege waffles.
                    </p>
                    <div class="flex gap-4 text-royale-gold text-lg pt-2">
                        <a href="#" class="hover:text-white transition-colors"><i class="fa-brands fa-instagram"></i></a>
                        <a href="#" class="hover:text-white transition-colors"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#" class="hover:text-white transition-colors"><i class="fa-brands fa-x-twitter"></i></a>
                    </div>
                </div>

                <!-- Col 2: Navigation -->
                <div>
                    <h4 class="font-cinzel font-bold text-sm text-royale-lightGold mb-4 uppercase tracking-wider">Quick Links</h4>
                    <ul class="space-y-2 text-xs">
                        <li><a href="#hero" class="hover:text-royale-gold transition-colors">Home Experience</a></li>
                        <li><a href="#menu" class="hover:text-royale-gold transition-colors">Signature Menu</a></li>
                        <li><a href="#customizer" class="hover:text-royale-gold transition-colors">Custom Waffle Builder</a></li>
                        <li><a href="#story" class="hover:text-royale-gold transition-colors">Our Heritage</a></li>
                    </ul>
                </div>

                <!-- Col 3: Boutique Locations -->
                <div>
                    <h4 class="font-cinzel font-bold text-sm text-royale-lightGold mb-4 uppercase tracking-wider">Boutiques</h4>
                    <ul class="space-y-2 text-xs">
                        <li>Fifth Avenue, New York</li>
                        <li>Bond Street, London</li>
                        <li>Champs-Élysées, Paris</li>
                        <li>Dubai Mall, Dubai</li>
                    </ul>
                </div>

                <!-- Col 4: Newsletter -->
                <div>
                    <h4 class="font-cinzel font-bold text-sm text-royale-lightGold mb-4 uppercase tracking-wider">Join The VIP Guild</h4>
                    <p class="text-xs mb-3">Subscribe to receive exclusive invitations to seasonal tastings.</p>
                    <form onsubmit="subscribeNewsletter(event)" class="space-y-2">
                        <input type="email" id="newsletter-email" required placeholder="Enter your email" class="w-full bg-royale-amber border border-royale-gold/30 rounded-lg px-3 py-2 text-xs text-royale-cream focus:outline-none focus:border-royale-gold">
                        <button type="submit" class="w-full py-2.5 rounded-lg gold-gradient-bg text-royale-deepAmber font-bold text-xs uppercase tracking-wider hover:shadow-gold-glow transition-all">
                            Subscribe
                        </button>
                    </form>
                </div>

            </div>

            <div class="border-t border-royale-gold/10 pt-6 flex flex-col sm:flex-row justify-between items-center text-[11px] text-royale-cream/50 gap-4">
                <p>&copy; 2026 Waffle Royale Inc. All rights reserved.</p>
                <div class="flex gap-6">
                    <a href="#" class="hover:text-royale-gold">Privacy Policy</a>
                    <a href="#" class="hover:text-royale-gold">Terms of Service</a>
                    <a href="#" class="hover:text-royale-gold">Concierge Contact</a>
                </div>
            </div>
        </div>
    </footer>

    <script>
        // --- Catalog Data ---
        const PRODUCTS = [
            {
                id: 'p1',
                name: 'Imperial Gold Belgian',
                category: 'signature',
                price: 28.00,
                rating: 5.0,
                tag: 'Chef Choice',
                image: 'https://images.unsplash.com/photo-1562376552-0d160a2f238d?auto=format&fit=crop&w=800&q=80',
                desc: 'Infused with Madagascar Bourbon vanilla, Valrhona dark chocolate drizzle, and 24K edible gold leaves.'
            },
            {
                id: 'p2',
                name: 'Salted Caramel Pecan Peak',
                category: 'signature',
                price: 22.00,
                rating: 4.9,
                tag: 'Bestseller',
                image: 'https://images.unsplash.com/photo-1504113076330-118f9816c65a?auto=format&fit=crop&w=800&q=80',
                desc: 'Warm salted butter caramel sauce over crispy Liege waffle, topped with toasted candied pecans.'
            },
            {
                id: 'p3',
                name: 'Matcha Blossom Royal',
                category: 'signature',
                price: 24.00,
                rating: 4.8,
                tag: 'Limited Edition',
                image: 'https://images.unsplash.com/photo-1592417817098-8f3d6ef23a81?auto=format&fit=crop&w=800&q=80',
                desc: 'Uji ceremonial matcha-infused waffle batter paired with organic strawberries and white chocolate silk.'
            },
            {
                id: 'p4',
                name: 'The Grand Celebration Box',
                category: 'boxes',
                price: 65.00,
                rating: 5.0,
                tag: 'Luxury Box',
                image: 'https://images.unsplash.com/photo-1568051243851-f9b136146e97?auto=format&fit=crop&w=800&q=80',
                desc: 'A curated selection of 6 artisanal waffles with individual toppings and golden dipping pots.'
            },
            {
                id: 'p5',
                name: 'Red Velvet Truffle Delight',
                category: 'signature',
                price: 21.00,
                rating: 4.9,
                tag: 'Popular',
                image: 'https://images.unsplash.com/photo-1551024709-8f23befc6f87?auto=format&fit=crop&w=800&q=80',
                desc: 'Crimson cocoa batter topped with mascarpone cream glaze and dark chocolate truffle shavings.'
            },
            {
                id: 'p6',
                name: 'Affogato Royale Pair',
                category: 'pairs',
                price: 26.00,
                rating: 4.9,
                tag: 'Dessert Pair',
                image: 'https://images.unsplash.com/photo-1517433670267-08bbd4be890f?auto=format&fit=crop&w=800&q=80',
                desc: 'Fresh Liege waffle served alongside a shot of artisan espresso and Madagascar vanilla gelato.'
            }
        ];

        // --- State Management ---
        let cart = [];
        let discount = 0;

        // Custom Waffle Builder State
        let customWaffleState = {
            base: { name: 'Classic Belgian Liege', price: 12.00 },
            drizzle: { name: 'Pure Amber Maple', price: 3.00 },
            toppings: [] // [{ name: '', price: 0 }]
        };

        // Initialize App on DOM Ready
        document.addEventListener('DOMContentLoaded', () => {
            renderProducts('all');
            updateBuilderSummary();
        });

        // --- Customizer Logic ---
        function selectBase(name, price, btnElement) {
            customWaffleState.base = { name, price };
            document.querySelectorAll('.custom-base-btn').forEach(btn => {
                btn.classList.remove('active', 'border-2', 'border-royale-gold', 'bg-royale-amber');
                btn.classList.add('border', 'border-royale-gold/20', 'bg-royale-deepAmber');
            });
            btnElement.classList.add('active', 'border-2', 'border-royale-gold', 'bg-royale-amber');
            btnElement.classList.remove('border-royale-gold/20', 'bg-royale-deepAmber');
            updateBuilderSummary();
        }

        function selectDrizzle(name, price, btnElement) {
            customWaffleState.drizzle = { name, price };
            document.querySelectorAll('.custom-drizzle-btn').forEach(btn => {
                btn.classList.remove('active', 'border-2', 'border-royale-gold', 'bg-royale-amber');
                btn.classList.add('border', 'border-royale-gold/20', 'bg-royale-deepAmber');
            });
            btnElement.classList.add('active', 'border-2', 'border-royale-gold', 'bg-royale-amber');
            btnElement.classList.remove('border-royale-gold/20', 'bg-royale-deepAmber');
            updateBuilderSummary();
        }

        function toggleTopping(name, price, btnElement) {
            const index = customWaffleState.toppings.findIndex(t => t.name === name);
            if (index > -1) {
                // Remove topping
                customWaffleState.toppings.splice(index, 1);
                btnElement.classList.remove('active', 'border-2', 'border-royale-gold', 'bg-royale-amber');
                btnElement.classList.add('border', 'border-royale-gold/20', 'bg-royale-deepAmber');
            } else {
                // Add topping
                customWaffleState.toppings.push({ name, price });
                btnElement.classList.add('active', 'border-2', 'border-royale-gold', 'bg-royale-amber');
                btnElement.classList.remove('border-royale-gold/20', 'bg-royale-deepAmber');
            }
            updateBuilderSummary();
        }

        function updateBuilderSummary() {
            const totalPrice = customWaffleState.base.price + customWaffleState.drizzle.price + customWaffleState.toppings.reduce((acc, curr) => acc + curr.price, 0);

            document.getElementById('builder-price-display').innerText = `$${totalPrice.toFixed(2)}`;
            document.getElementById('summary-base-name').innerText = customWaffleState.base.name;
            document.getElementById('summary-drizzle-name').innerText = customWaffleState.drizzle.name;

            const toppingsListElem = document.getElementById('summary-toppings-list');
            if (customWaffleState.toppings.length === 0) {
                toppingsListElem.innerText = 'None Selected';
            } else {
                toppingsListElem.innerText = customWaffleState.toppings.map(t => t.name).join(', ');
            }
        }

        function addCustomWaffleToCart() {
            const totalPrice = customWaffleState.base.price + customWaffleState.drizzle.price + customWaffleState.toppings.reduce((acc, curr) => acc + curr.price, 0);
            
            const toppingNames = customWaffleState.toppings.map(t => t.name).join(', ') || 'Standard Glaze';
            const itemDesc = `Base: ${customWaffleState.base.name} | Drizzle: ${customWaffleState.drizzle.name} | Toppings: ${toppingNames}`;

            const customItem = {
                id: 'custom-' + Date.now(),
                name: 'Custom Waffle Creation',
                price: totalPrice,
                image: 'https://images.unsplash.com/photo-1504113076330-118f9816c65a?auto=format&fit=crop&w=600&q=80',
                details: itemDesc,
                quantity: 1
            };

            cart.push(customItem);
            updateCartUI();
            showToast('Custom Waffle added to your cart!');
            toggleCart(true); // Open cart automatically
        }

        // --- Product Catalog Rendering & Filtering ---
        function renderProducts(category) {
            const container = document.getElementById('product-grid');
            const filtered = category === 'all' ? PRODUCTS : PRODUCTS.filter(p => p.category === category);

            container.innerHTML = filtered.map(item => `
                <div class="bg-royale-cardBg border border-royale-gold/20 rounded-2xl overflow-hidden hover:border-royale-gold/60 transition-all duration-300 flex flex-col justify-between group hover:-translate-y-1">
                    <div>
                        <div class="relative h-56 overflow-hidden">
                            <img src="${item.image}" alt="${item.name}" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500">
                            <div class="absolute inset-0 bg-gradient-to-t from-royale-cardBg via-transparent to-transparent opacity-60"></div>
                            <span class="absolute top-3 right-3 bg-royale-amber/90 border border-royale-gold/40 text-royale-lightGold text-[10px] font-bold px-3 py-1 rounded-full uppercase tracking-wider backdrop-blur-md">
                                ${item.tag}
                            </span>
                        </div>
                        <div class="p-6">
                            <div class="flex items-center justify-between mb-2">
                                <h3 class="font-cinzel text-lg font-bold text-royale-lightGold group-hover:text-royale-gold transition-colors">${item.name}</h3>
                                <div class="flex items-center text-xs text-royale-gold gap-1">
                                    <i class="fa-solid fa-star"></i>
                                    <span class="font-bold text-white">${item.rating}</span>
                                </div>
                            </div>
                            <p class="text-xs text-royale-cream/70 leading-relaxed mb-4">${item.desc}</p>
                        </div>
                    </div>
                    <div class="px-6 pb-6 pt-0 flex items-center justify-between border-t border-royale-gold/10 pt-4">
                        <span class="font-cinzel font-extrabold text-xl text-white">$${item.price.toFixed(2)}</span>
                        <button onclick="addPresetToCart('${item.name}', ${item.price}, '${item.image}')" class="px-4 py-2 rounded-xl gold-gradient-bg text-royale-deepAmber font-bold text-xs uppercase tracking-wider hover:shadow-gold-glow transition-all flex items-center gap-1.5">
                            <i class="fa-solid fa-bag-shopping text-xs"></i>
                            <span>Add</span>
                        </button>
                    </div>
                </div>
            `).join('');
        }

        function filterMenu(category, btnElement) {
            document.querySelectorAll('.filter-tab').forEach(tab => {
                tab.classList.remove('active', 'bg-royale-gold', 'text-royale-deepAmber', 'font-bold');
                tab.classList.add('bg-royale-cardBg', 'border', 'border-royale-gold/30', 'text-royale-cream', 'font-medium');
            });

            btnElement.classList.add('active', 'bg-royale-gold', 'text-royale-deepAmber', 'font-bold');
            btnElement.classList.remove('bg-royale-cardBg', 'border', 'border-royale-gold/30', 'text-royale-cream', 'font-medium');

            renderProducts(category);
        }

        // --- Cart Management ---
        function addPresetToCart(name, price, image) {
            const existing = cart.find(i => i.name === name);
            if (existing) {
                existing.quantity++;
            } else {
                cart.push({
                    id: 'item-' + Date.now(),
                    name,
                    price,
                    image,
                    quantity: 1
                });
            }
            updateCartUI();
            showToast(`Added "${name}" to cart`);
        }

        function changeQuantity(id, delta) {
            const item = cart.find(i => i.id === id);
            if (item) {
                item.quantity += delta;
                if (item.quantity <= 0) {
                    cart = cart.filter(i => i.id !== id);
                }
            }
            updateCartUI();
        }

        function updateCartUI() {
            const container = document.getElementById('cart-items-container');
            const totalCount = cart.reduce((sum, item) => sum + item.quantity, 0);
            const badge = document.getElementById('cart-badge');

            // Badge count animation
            badge.innerText = totalCount;
            if (totalCount > 0) {
                badge.classList.remove('scale-0');
            } else {
                badge.classList.add('scale-0');
            }

            if (cart.length === 0) {
                container.innerHTML = `
                    <div class="text-center py-12 text-royale-cream/50 space-y-3">
                        <i class="fa-solid fa-cookie-bite text-4xl text-royale-gold/30"></i>
                        <p class="text-sm">Your cart is currently empty.</p>
                        <a href="#menu" onclick="toggleCart()" class="inline-block text-xs uppercase tracking-wider text-royale-gold hover:underline">Explore Menu</a>
                    </div>
                `;
            } else {
                container.innerHTML = cart.map(item => `
                    <div class="bg-royale-amber border border-royale-gold/20 p-3 rounded-xl flex gap-3 items-center">
                        <img src="${item.image}" alt="${item.name}" class="w-16 h-16 object-cover rounded-lg flex-shrink-0">
                        <div class="flex-1 min-w-0">
                            <h4 class="font-cinzel text-xs font-bold text-royale-lightGold truncate">${item.name}</h4>
                            ${item.details ? `<p class="text-[10px] text-royale-cream/60 line-clamp-1">${item.details}</p>` : ''}
                            <div class="text-xs font-bold text-royale-gold mt-1">$${(item.price * item.quantity).toFixed(2)}</div>
                        </div>
                        <div class="flex items-center gap-2 bg-royale-deepAmber border border-royale-gold/20 rounded-lg px-2 py-1">
                            <button onclick="changeQuantity('${item.id}', -1)" class="text-xs text-royale-cream/70 hover:text-royale-gold px-1">-</button>
                            <span class="text-xs font-bold text-white">${item.quantity}</span>
                            <button onclick="changeQuantity('${item.id}', 1)" class="text-xs text-royale-cream/70 hover:text-royale-gold px-1">+</button>
                        </div>
                    </div>
                `).join('');
            }

            // Price Calculations
            const subtotal = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
            const deliveryFee = cart.length > 0 ? 5.00 : 0.00;
            const discountedSubtotal = subtotal * (1 - discount);
            const total = discountedSubtotal + deliveryFee;

            document.getElementById('cart-subtotal').innerText = `$${subtotal.toFixed(2)}`;
            document.getElementById('cart-delivery').innerText = `$${deliveryFee.toFixed(2)}`;
            document.getElementById('cart-total').innerText = `$${total.toFixed(2)}`;
        }

        function toggleCart(forceOpen = false) {
            const drawer = document.getElementById('cart-drawer');
            const overlay = document.getElementById('cart-drawer-overlay');

            const isOpen = !drawer.classList.contains('translate-x-full');

            if (forceOpen || !isOpen) {
                drawer.classList.remove('translate-x-full');
                overlay.classList.remove('opacity-0', 'pointer-events-none');
            } else {
                drawer.classList.add('translate-x-full');
                overlay.classList.add('opacity-0', 'pointer-events-none');
            }
        }

        function applyPromo() {
            const code = document.getElementById('promo-code').value.trim().toUpperCase();
            if (code === 'ROYALE10') {
                discount = 0.10;
                showToast('10% VIP Discount Applied!');
                updateCartUI();
            } else if (code !== '') {
                showToast('Invalid promo code. Try ROYALE10', true);
            }
        }

        function simulateCheckout() {
            if (cart.length === 0) {
                showToast('Please add items to your cart before checkout.', true);
                return;
            }
            showToast('Order Received! Directing to Concierge Payment...');
            setTimeout(() => {
                cart = [];
                discount = 0;
                updateCartUI();
                toggleCart();
                alert('Thank you for your order with Waffle Royale! Your artisanal creation is being prepared.');
            }, 1500);
        }

        // --- Interactive UI Helpers ---
        function toggleMobileMenu() {
            const menu = document.getElementById('mobile-menu');
            menu.classList.toggle('hidden');
        }

        function subscribeNewsletter(e) {
            e.preventDefault();
            const email = document.getElementById('newsletter-email').value;
            if (email) {
                showToast('Welcome to the VIP Guild!');
                document.getElementById('newsletter-email').value = '';
            }
        }

        function showToast(message, isError = false) {
            const container = document.getElementById('toast-container');
            const toast = document.createElement('div');
            
            toast.className = `px-4 py-3 rounded-xl border ${isError ? 'bg-red-900/90 border-red-500 text-white' : 'bg-royale-cardBg border-royale-gold text-royale-lightGold'} shadow-lg backdrop-blur-md font-sans text-xs flex items-center gap-2 pointer-events-auto transform transition-all duration-300 translate-y-2 opacity-0`;
            toast.innerHTML = `
                <i class="fa-solid ${isError ? 'fa-circle-exclamation' : 'fa-crown text-royale-gold'}"></i>
                <span>${message}</span>
            `;

            container.appendChild(toast);

            setTimeout(() => {
                toast.classList.remove('translate-y-2', 'opacity-0');
            }, 50);

            setTimeout(() => {
                toast.classList.add('opacity-0', 'translate-y-2');
                setTimeout(() => toast.remove(), 300);
            }, 3000);
        }
    </script>
</body>
</html>
