<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Happy Birthday, Youssef!</title>
    <!-- Tailwind CSS for modern layout & design -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Google Fonts for premium typography -->
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Montserrat:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #000000;
            overflow: hidden;
            user-select: none;
            -webkit-user-select: none;
        }
        .cursive {
            font-family: 'Dancing Script', cursive;
        }
        /* Custom neon pink glow effects */
        .pink-glow {
            text-shadow: 0 0 10px rgba(255, 105, 180, 0.6), 0 0 20px rgba(255, 105, 180, 0.4);
        }
        .pink-box-glow {
            box-shadow: 0 0 20px rgba(255, 105, 180, 0.3), inset 0 0 15px rgba(255, 105, 180, 0.1);
        }
        /* Soft continuous float animation for elements */
        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-10px) rotate(1deg); }
        }
        .animate-float {
            animation: float 4s ease-in-out infinite;
        }
        /* Pulse for tap CTA */
        @keyframes pulse-text {
            0%, 100% { opacity: 0.6; transform: scale(1); }
            50% { opacity: 1; transform: scale(1.05); }
        }
        .animate-pulse-text {
            animation: pulse-text 2s ease-in-out infinite;
        }
        /* Background star twinkle */
        @keyframes twinkle {
            0%, 100% { opacity: 0.2; }
            50% { opacity: 0.8; }
        }
        .twinkle-bg {
            animation: twinkle 3s ease-in-out infinite;
        }
        /* Scrollbar styling for the letter */
        .custom-scrollbar::-webkit-scrollbar {
            width: 6px;
        }
        .custom-scrollbar::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb {
            background: rgba(255, 105, 180, 0.5);
            border-radius: 10px;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb:hover {
            background: rgba(255, 105, 180, 0.8);
        }
    </style>
</head>
<body class="relative w-screen h-screen flex flex-col justify-center items-center text-white px-4">

    <!-- Interactive Canvas Layer for Hearts Explosion and Floating Particles -->
    <canvas id="particleCanvas" class="absolute inset-0 w-full h-full pointer-events-none z-10"></canvas>

    <!-- Starry background decoration -->
    <div class="absolute inset-0 pointer-events-none opacity-40 z-0 overflow-hidden">
        <div class="absolute w-2 h-2 bg-white rounded-full top-[15%] left-[20%] twinkle-bg" style="animation-delay: 0.5s;"></div>
        <div class="absolute w-1.5 h-1.5 bg-pink-200 rounded-full top-[45%] left-[10%] twinkle-bg" style="animation-delay: 1.2s;"></div>
        <div class="absolute w-2 h-2 bg-pink-300 rounded-full top-[25%] right-[15%] twinkle-bg" style="animation-delay: 0.8s;"></div>
        <div class="absolute w-1 h-1 bg-white rounded-full top-[70%] left-[30%] twinkle-bg" style="animation-delay: 2s;"></div>
        <div class="absolute w-2.5 h-2.5 bg-pink-100 rounded-full top-[80%] right-[25%] twinkle-bg" style="animation-delay: 1.5s;"></div>
        <div class="absolute w-1 h-1 bg-white rounded-full top-[10%] right-[40%] twinkle-bg" style="animation-delay: 0.3s;"></div>
    </div>

    <!-- Active Audio Context Unmute Overlay (Ensures AudioContext can play sounds immediately) -->
    <div id="interactionOverlay" class="absolute inset-0 z-50 bg-black/80 flex flex-col items-center justify-center text-center cursor-pointer p-6">
        <div class="animate-float flex flex-col items-center">
            <svg class="w-16 h-16 text-pink-400 mb-4 animate-pulse" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path>
            </svg>
            <h2 class="text-2xl font-semibold mb-2 pink-glow text-pink-200">For You, Youssef</h2>
            <p class="text-sm text-gray-400 max-w-xs">Tap anywhere to begin your beautiful surprise.</p>
        </div>
    </div>

    <!-- MAIN APP CONTAINER -->
    <div class="w-full max-w-md flex flex-col items-center justify-center relative z-20 text-center select-none">
        
        <!-- ================= STAGE 1: THE CAKE ================= -->
        <div id="stageCake" class="flex flex-col items-center justify-center transition-all duration-1000 ease-in-out opacity-100 w-full">
            <h1 class="text-3xl md:text-4xl font-semibold mb-2 tracking-wide text-white uppercase">
                Happy Birthday, <span class="text-pink-400 pink-glow cursive capitalize text-4xl md:text-5xl">Youssef</span>
            </h1>
            
            <!-- Cake Container with custom interactive tap area -->
            <div id="cakeButton" class="w-64 h-64 my-8 flex items-center justify-center cursor-pointer transition-transform duration-300 hover:scale-105 active:scale-95 animate-float">
                <svg viewBox="0 0 200 200" class="w-full h-full filter drop-shadow-[0_0_15px_rgba(255,105,180,0.5)]">
                    <!-- Candles -->
                    <rect x="96" y="25" width="8" height="25" fill="#FFFFFF" rx="2" />
                    <path d="M96 25 Q100 15 104 25 Z" fill="#FF1493" class="animate-pulse" />
                    <rect x="76" y="32" width="8" height="25" fill="#FFB6C1" rx="2" />
                    <path d="M76 32 Q80 22 84 32 Z" fill="#FF69B4" class="animate-pulse" />
                    <rect x="116" y="32" width="8" height="25" fill="#FFB6C1" rx="2" />
                    <path d="M116 32 Q120 22 124 32 Z" fill="#FF69B4" class="animate-pulse" />
                    
                    <!-- Cake Top Layer (Pink frosting) -->
                    <rect x="60" y="55" width="80" height="40" fill="#FF69B4" rx="8" />
                    <rect x="60" y="75" width="80" height="20" fill="#FFF0F5" />
                    <!-- Frosting drips -->
                    <path d="M60 75 Q65 85 70 75 Q75 85 80 75 Q85 85 90 75 Q95 85 100 75 Q105 85 110 75 Q115 85 120 75 Q125 85 130 75 Q135 85 140 75" fill="#FF69B4" />
                    
                    <!-- Cake Bottom Layer (Chocolate/Base pink-white stripe) -->
                    <rect x="40" y="95" width="120" height="55" fill="#FFF0F5" rx="10" />
                    <rect x="40" y="115" width="120" height="15" fill="#FFB6C1" />
                    <circle cx="55" cy="110" r="4" fill="#FF69B4" />
                    <circle cx="80" cy="110" r="4" fill="#FF69B4" />
                    <circle cx="100" cy="110" r="4" fill="#FF69B4" />
                    <circle cx="120" cy="110" r="4" fill="#FF69B4" />
                    <circle cx="145" cy="110" r="4" fill="#FF69B4" />

                    <!-- Plate/Stand -->
                    <rect x="25" y="147" width="150" height="10" fill="#FFFFFF" rx="5" />
                    <path d="M60 157 L140 157 L120 170 L80 170 Z" fill="#E2E8F0" />
                </svg>
            </div>

            <p class="text-pink-300 text-lg font-medium tracking-widest animate-pulse-text pink-glow uppercase">
                Click on the cake
            </p>
        </div>

        <!-- ================= STAGE 2: THE GIFT ================= -->
        <div id="stageGift" class="hidden flex flex-col items-center justify-center transition-all duration-1000 ease-in-out opacity-0 w-full">
            <h1 class="text-2xl md:text-3xl font-semibold mb-2 tracking-wide text-white uppercase">
                A little something <span class="text-pink-400 pink-glow cursive capitalize text-3xl">for you...</span>
            </h1>

            <!-- Gift Container with custom interactive tap area -->
            <div id="giftButton" class="w-64 h-64 my-8 flex items-center justify-center cursor-pointer transition-transform duration-300 hover:scale-105 active:scale-95 animate-float">
                <svg viewBox="0 0 200 200" class="w-full h-full filter drop-shadow-[0_0_15px_rgba(255,255,255,0.4)]">
                    <!-- Bow Tails -->
                    <path d="M100 55 Q70 20 60 40 Q80 50 100 55" fill="#FFFFFF" />
                    <path d="M100 55 Q130 20 140 40 Q120 50 100 55" fill="#FFFFFF" />
                    <!-- Ribbon Bow Loops -->
                    <circle cx="70" cy="38" r="16" fill="none" stroke="#FFFFFF" stroke-width="8" />
                    <circle cx="130" cy="38" r="16" fill="none" stroke="#FFFFFF" stroke-width="8" />
                    
                    <!-- Gift Lid -->
                    <rect x="40" y="55" width="120" height="25" fill="#FF69B4" rx="4" />
                    <!-- Gift Body -->
                    <rect x="48" y="80" width="104" height="75" fill="#FFB6C1" rx="4" />
                    
                    <!-- Vertical Ribbon -->
                    <rect x="90" y="55" width="20" height="100" fill="#FFFFFF" />
                    <!-- Horizontal Ribbon (Under Lid decoration) -->
                    <rect x="40" y="63" width="120" height="8" fill="#FFFFFF" />

                    <!-- Golden / Pink Sparkle Dots -->
                    <circle cx="65" cy="105" r="4" fill="#FFFFFF" opacity="0.8" />
                    <circle cx="75" cy="130" r="4" fill="#FFFFFF" opacity="0.8" />
                    <circle cx="135" cy="110" r="4" fill="#FFFFFF" opacity="0.8" />
                    <circle cx="125" cy="135" r="4" fill="#FFFFFF" opacity="0.8" />
                </svg>
            </div>

            <p class="text-pink-300 text-lg font-medium tracking-widest animate-pulse-text pink-glow uppercase">
                Press on the gift
            </p>
        </div>

        <!-- ================= STAGE 3: THE LETTER ================= -->
        <div id="stageLetter" class="hidden flex flex-col items-center justify-center transition-all duration-1000 ease-in-out opacity-0 w-full max-w-md">
            
            <!-- Beautiful Glowing Letter Card Frame -->
            <div class="relative w-full bg-neutral-950/90 border border-pink-500/30 rounded-2xl p-6 md:p-8 pink-box-glow max-h-[80vh] flex flex-col">
                
                <!-- Envelope Ribbon Stamp Design -->
                <div class="absolute -top-5 left-1/2 transform -translate-x-1/2 bg-pink-500 text-white rounded-full p-2.5 shadow-lg border-2 border-white">
                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M10.894 2.553a1 1 0 00-1.788 0l-7 14a1 1 0 001.169 1.409l5-1.429A1 1 0 009 15.571V11a1 1 0 112 0v4.571a1 1 0 00.725.962l5 1.428a1 1 0 001.17-1.408l-7-14z"></path>
                    </svg>
                </div>

                <!-- Scrollable Content Area -->
                <div class="overflow-y-auto custom-scrollbar pr-2 mt-4 text-left space-y-4 text-neutral-200 leading-relaxed text-sm md:text-base font-light">
                    
                    <h2 class="text-xl md:text-2xl font-semibold text-pink-400 pink-glow mb-4 text-center cursive border-b border-pink-900/30 pb-4">
                        Happy Birthday, my love! 💖
                    </h2>

                    <p>
                        If you're reading this, then first of all… <span class="text-white font-semibold">Happy Birthday, Youssef! 🎂</span>
                    </p>

                    <p>
                        I hope today brings you nothing but happiness, peace, and everything beautiful.
                    </p>

                    <p>
                        Congratulations… you’ve survived another year (<span class="italic text-pink-300">proud of you honestly 😭</span>), and this is actually the first birthday I get to celebrate with you, so that makes it even more special for me.
                    </p>

                    <p>
                        I just want to thank you for everything you’ve done for me — for your support, your reassurance, and the love you give me even in the smallest moments.
                    </p>

                    <p class="font-medium text-pink-100 pl-2 border-l-2 border-pink-400">
                        You make things feel easier just by being there.
                    </p>

                    <p>
                        And I also want to say sorry… for my shortcomings, and for any time I may have said or done something that hurt you. You matter to me more than my pride ever will.
                    </p>

                    <p>
                        Anyways… Happy Birthday again, my love 💖
                    </p>

                    <p>
                        I hope you enjoy your day to the fullest. You deserve it all and more.
                    </p>

                    <!-- Signature -->
                    <div class="pt-6 border-t border-pink-900/30 text-right">
                        <p class="text-xs text-neutral-400">With all my love,</p>
                        <p class="text-xl text-pink-400 cursive pink-glow mt-1 font-semibold">Pepsi <span class="text-white not-italic">&lt;3</span></p>
                    </div>

                </div>
            </div>

            <!-- Tap to celebrate again option -->
            <button id="replayButton" class="mt-6 text-xs text-neutral-400 hover:text-pink-400 transition-colors uppercase tracking-wider underline cursor-pointer">
                Replay Celebration 💖
            </button>
        </div>

    </div>

    <!-- Background music option info or controls if wanted -->
    <div class="absolute bottom-4 left-4 text-[10px] text-neutral-500 select-none pointer-events-none">
        Made with love • Pure Pink & White Theme
    </div>

    <script>
        // --- Web Audio Synthesizer (Vibration Sound Simulation) ---
        // Generates a realistic low-frequency physical buzz/vibrate sound effect
        let audioCtx;

        function initAudio() {
            if (!audioCtx) {
                audioCtx = new (window.AudioContext || window.webkitAudioContext)();
            }
        }

        function playVibrationSound() {
            initAudio();
            if (!audioCtx) return;

            // Trigger physical haptic motor vibration on supported devices
            if (navigator.vibrate) {
                navigator.vibrate([150]);
            }

            // Create low oscillator for vibration feel (simulate physical hum)
            const osc = audioCtx.createOscillator();
            const gainNode = audioCtx.createGain();

            osc.type = 'triangle';
            osc.frequency.setValueAtTime(65, audioCtx.currentTime); // Low bass buzz
            osc.frequency.exponentialRampToValueAtTime(100, audioCtx.currentTime + 0.15);

            // Modulation to simulate a mechanical buzzing motor
            const modulator = audioCtx.createOscillator();
            const modulatorGain = audioCtx.createGain();
            modulator.frequency.value = 40; // Buzz frequency rate
            modulatorGain.gain.value = 15;

            modulator.connect(osc.frequency);
            osc.connect(gainNode);
            gainNode.connect(audioCtx.destination);

            // Volume Envelope
            gainNode.gain.setValueAtTime(0, audioCtx.currentTime);
            gainNode.gain.linearRampToValueAtTime(0.8, audioCtx.currentTime + 0.02);
            gainNode.gain.exponentialRampToValueAtTime(0.01, audioCtx.currentTime + 0.18);

            // Start sound
            modulator.start();
            osc.start();

            // Stop sounds
            modulator.stop(audioCtx.currentTime + 0.2);
            osc.stop(audioCtx.currentTime + 0.2);
        }

        // --- Canvas Particle System ---
        const canvas = document.getElementById('particleCanvas');
        const ctx = canvas.getContext('2d');

        let particles = [];
        let screenWidth = window.innerWidth;
        let screenHeight = window.innerHeight;

        // Resize Canvas
        function resizeCanvas() {
            screenWidth = window.innerWidth;
            screenHeight = window.innerHeight;
            canvas.width = screenWidth;
            canvas.height = screenHeight;
        }
        window.addEventListener('resize', resizeCanvas);
        resizeCanvas();

        // Heart shape drawing helper
        function drawHeart(ctx, x, y, size, color, rotation) {
            ctx.save();
            ctx.translate(x, y);
            ctx.rotate(rotation);
            ctx.beginPath();
            ctx.fillStyle = color;
            
            // Scaled drawing of a heart vector path
            const scale = size / 24; 
            ctx.scale(scale, scale);
            
            ctx.moveTo(0, -10);
            ctx.bezierCurveTo(-15, -25, -30, -5, 0, 20);
            ctx.bezierCurveTo(30, -5, 15, -25, 0, -10);
            
            ctx.fill();
            ctx.restore();
        }

        // Particle Class
        class Particle {
            constructor(x, y, isExplosion = false) {
                this.x = x;
                this.y = y;
                this.size = Math.random() * (isExplosion ? 24 : 12) + (isExplosion ? 8 : 4);
                
                // Color variations: Pink and White shades
                const colors = [
                    'rgba(255, 105, 180, 0.95)', // Deep Pink
                    'rgba(255, 182, 193, 0.95)', // Light Pink
                    'rgba(255, 255, 255, 0.95)', // Pure White
                    'rgba(255, 240, 245, 0.95)', // Lavender Blush (extremely light pink)
                    'rgba(255, 20, 147, 0.95)'   // Deep Pink
                ];
                this.color = colors[Math.floor(Math.random() * colors.length)];
                
                if (isExplosion) {
                    // Explodes in all directions
                    const angle = Math.random() * Math.PI * 2;
                    const speed = Math.random() * 8 + 3;
                    this.vx = Math.cos(angle) * speed;
                    this.vy = Math.sin(angle) * speed;
                } else {
                    // Standard floating particles
                    this.vx = (Math.random() - 0.5) * 1.5;
                    this.vy = -(Math.random() * 1.5 + 0.5);
                }

                this.alpha = 1;
                this.decay = Math.random() * 0.015 + 0.008;
                this.rotation = Math.random() * Math.PI * 2;
                this.rotSpeed = (Math.random() - 0.5) * 0.05;
                this.gravity = isExplosion ? 0.08 : 0; // slight fall down for explosion realism
            }

            update() {
                this.vy += this.gravity;
                this.x += this.vx;
                this.y += this.vy;
                this.rotation += this.rotSpeed;
                this.alpha -= this.decay;
            }

            draw() {
                ctx.globalAlpha = this.alpha;
                // Draw glow around the pink/white shapes
                ctx.shadowBlur = 10;
                ctx.shadowColor = this.color;
                drawHeart(ctx, this.x, this.y, this.size, this.color, this.rotation);
                ctx.shadowBlur = 0; // reset
            }
        }

        // Spawn explosion of hearts
        function spawnHeartExplosion(x, y) {
            // Spawn 65 gorgeous pink/white hearts
            for (let i = 0; i < 65; i++) {
                particles.push(new Particle(x, y, true));
            }
        }

        // Standard ge
