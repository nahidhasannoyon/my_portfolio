// Tom and Jerry Cursor Animation with Images
(function () {
  "use strict";

  // Check if it's a desktop device (no touch screen)
  const isDesktop = !("ontouchstart" in window) && !navigator.maxTouchPoints;

  if (!isDesktop) {
    console.log("Tom and Jerry cursor is disabled on touch devices");
    return; // Don't run on mobile/tablet
  }

  // Configuration
  const CONFIG = {
    jerrySize: 50,
    tomSize: 60,
    idleTime: 1000,
    animationSpeed: 1.0, // Faster for real-time movement
    tomFollowSpeed: 0.08,
    fightFrameDuration: 200, // Duration to show each fight frame
    fightCycles: 2, // Number of times to cycle through fight images
  };

  // Image paths
  const IMAGES = {
    jerry: "assets/images/jerry.png",
    tomHead: "assets/images/tom-head.png",
    fighting1: "assets/images/tom-and-jerry-fighting-1.png",
    fighting2: "assets/images/tom-and-jerry-fighting-2.png",
    jerryOnHead: "assets/images/jerrey-on-toms-head.png",
  };

  // State variables
  let mouseX = 0;
  let mouseY = 0;
  let jerryX = -100;
  let jerryY = -100;
  let tomX = -100;
  let tomY = -100;
  let lastMoveTime = Date.now();
  let currentState = "CHASING"; // CHASING, FIGHTING, JERRY_ON_HEAD
  let jerry, tom, fightContainer;
  let isInitialized = false;
  let fightAnimationTimeout = null;
  let isExternallyDisabled = false;

  // Initialize cursors
  function init() {
    if (isInitialized) return;
    isInitialized = true;

    // Create Jerry (main cursor - follows mouse in real-time)
    jerry = document.createElement("img");
    jerry.src = IMAGES.jerry;
    jerry.className = "jerry-cursor cursor-init";
    jerry.style.cssText = `
      position: fixed;
      pointer-events: none;
      width: ${CONFIG.jerrySize}px;
      height: auto;
      z-index: 10001;
      left: -100px;
      top: -100px;
      transform: translate(-50%, -50%);
    `;
    document.body.appendChild(jerry);

    // Create Tom's head (follower - chases Jerry)
    tom = document.createElement("img");
    tom.src = IMAGES.tomHead;
    tom.className = "tom-cursor cursor-init";
    tom.style.cssText = `
      position: fixed;
      pointer-events: none;
      width: ${CONFIG.tomSize}px;
      height: auto;
      z-index: 10000;
      left: -100px;
      top: -100px;
      transform: translate(-50%, -50%);
    `;
    document.body.appendChild(tom);

    // Create fight container (for fighting animation)
    fightContainer = document.createElement("img");
    fightContainer.className = "fight-container";
    fightContainer.style.cssText = `
      position: fixed;
      pointer-events: none;
      width: 80px;
      height: auto;
      z-index: 10002;
      left: -1000px;
      top: -1000px;
      transform: translate(-50%, -50%);
      display: none;
    `;
    document.body.appendChild(fightContainer);

    // Add custom cursor class to body
    document.body.classList.add("custom-cursor-active");

    // Event listeners
    document.addEventListener("mousemove", handleMouseMove);
    document.addEventListener("mouseenter", handleMouseEnter);
    document.addEventListener("mouseleave", handleMouseLeave);

    // Start animation loop
    animate();

    console.log("Tom and Jerry cursor initialized with images!");
  }

  function handleMouseMove(e) {
    mouseX = e.clientX;
    mouseY = e.clientY;
    lastMoveTime = Date.now();

    // If Jerry is on Tom's head, start chasing again
    if (currentState === "JERRY_ON_HEAD") {
      currentState = "CHASING";
      showChasingMode();
    }
  }

  function handleMouseEnter(e) {
    if (isExternallyDisabled) return;
    if (jerry && tom) {
      jerry.style.opacity = "1";
      tom.style.opacity = "1";
    }
  }

  function handleMouseLeave(e) {
    if (jerry && tom) {
      jerry.style.opacity = "0";
      tom.style.opacity = "0";
    }
    if (fightContainer) {
      fightContainer.style.opacity = "0";
    }
  }

  function animate() {
    const currentTime = Date.now();
    const timeSinceMove = currentTime - lastMoveTime;

    if (currentState === "CHASING") {
      // Jerry follows mouse in real-time
      jerryX += (mouseX - jerryX) * CONFIG.animationSpeed;
      jerryY += (mouseY - jerryY) * CONFIG.animationSpeed;

      // Tom follows Jerry with delay
      tomX += (jerryX - tomX) * CONFIG.tomFollowSpeed;
      tomY += (jerryY - tomY) * CONFIG.tomFollowSpeed;

      // Update positions
      updatePosition(jerry, jerryX, jerryY);
      updatePosition(tom, tomX, tomY);

      // Calculate rotation based on movement direction
      const angleJerry = Math.atan2(mouseY - jerryY, mouseX - jerryX);
      const angleTom = Math.atan2(jerryY - tomY, jerryX - tomX);

      // Apply rotation
      jerry.style.transform = `translate(-50%, -50%) rotate(${angleJerry}rad)`;
      tom.style.transform = `translate(-50%, -50%) rotate(${angleTom}rad)`;

      // Check if Tom caught up to Jerry (distance check)
      const distance = Math.sqrt(
        Math.pow(jerryX - tomX, 2) + Math.pow(jerryY - tomY, 2)
      );

      // If mouse is idle and Tom is close to Jerry, start fight
      if (timeSinceMove > CONFIG.idleTime && distance < 30) {
        startFight();
      }
    } else if (currentState === "JERRY_ON_HEAD") {
      // Both move together following mouse - smooth movement
      const targetX = mouseX;
      const targetY = mouseY;

      jerryX += (targetX - jerryX) * CONFIG.animationSpeed;
      jerryY += (targetY - jerryY) * CONFIG.animationSpeed;
      tomX = jerryX;
      tomY = jerryY;

      updatePosition(tom, tomX, tomY);
      // Keep transform reset for JERRY_ON_HEAD image
      tom.style.transform = "translate(-50%, -50%)";
    }

    requestAnimationFrame(animate);
  }

  function updatePosition(element, x, y) {
    element.style.left = `${x}px`;
    element.style.top = `${y}px`;
  }

  function showChasingMode() {
    // Reset Tom to original image and size
    tom.src = IMAGES.tomHead;
    tom.style.width = `${CONFIG.tomSize}px`;
    tom.style.zIndex = "10000";

    // Show both characters
    if (!isExternallyDisabled) {
      jerry.style.display = "block";
      tom.style.display = "block";
    }
    fightContainer.style.display = "none";
  }

  function startFight() {
    if (currentState === "FIGHTING") return;

    currentState = "FIGHTING";

    // Hide individual characters
    jerry.style.display = "none";
    tom.style.display = "none";

    // Show fight container at current position
    if (!isExternallyDisabled) {
      fightContainer.style.display = "block";
    }
    updatePosition(fightContainer, jerryX, jerryY);

    // Animate through fight frames
    let cycleCount = 0;
    let frameIndex = 0;
    const frames = [IMAGES.fighting1, IMAGES.fighting2];

    function showNextFrame() {
      if (cycleCount >= CONFIG.fightCycles) {
        // Fighting done, show Jerry on Tom's head
        showJerryOnHead();
        return;
      }

      fightContainer.src = frames[frameIndex];

      frameIndex++;
      if (frameIndex >= frames.length) {
        frameIndex = 0;
        cycleCount++;
      }

      fightAnimationTimeout = setTimeout(
        showNextFrame,
        CONFIG.fightFrameDuration
      );
    }

    showNextFrame();
  }

  function showJerryOnHead() {
    currentState = "JERRY_ON_HEAD";

    // Hide fight container
    fightContainer.style.display = "none";

    // Hide Jerry as it's now part of the combined image
    jerry.style.display = "none";

    // Show Tom with Jerry on his head image
    tom.src = IMAGES.jerryOnHead;
    tom.style.width = "180px"; // Size for the combined image
    tom.style.zIndex = "10001"; // Ensure it's visible
    tom.style.transform = "translate(-50%, -50%)";
    if (!isExternallyDisabled) {
      tom.style.display = "block";
    }

    // Position at current location
    updatePosition(tom, jerryX, jerryY);
  }

  function stopFight() {
    if (fightAnimationTimeout) {
      clearTimeout(fightAnimationTimeout);
      fightAnimationTimeout = null;
    }
  }

  function setExternalDisable(disabled) {
    isExternallyDisabled = disabled;
    if (disabled) {
      if (jerry) jerry.style.display = "none";
      if (tom) tom.style.display = "none";
      if (fightContainer) fightContainer.style.display = "none";
      document.body.classList.remove("custom-cursor-active");
    } else {
      document.body.classList.add("custom-cursor-active");
      // Restore visibility based on state
      if (currentState === "FIGHTING") {
        if (fightContainer) fightContainer.style.display = "block";
      } else if (currentState === "JERRY_ON_HEAD") {
        if (tom) tom.style.display = "block";
      } else {
        if (jerry) jerry.style.display = "block";
        if (tom) tom.style.display = "block";
      }
    }
  }

  window.tomJerryCursor = {
    enable: function () {
      setExternalDisable(false);
    },
    disable: function () {
      setExternalDisable(true);
    },
  };

  // Initialize when DOM is ready and Flutter is loaded
  function tryInit() {
    if (document.body) {
      // Small delay to ensure Flutter is ready
      setTimeout(init, 500);
    } else {
      setTimeout(tryInit, 100);
    }
  }

  // Wait for page to load
  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", tryInit);
  } else {
    tryInit();
  }
})();
