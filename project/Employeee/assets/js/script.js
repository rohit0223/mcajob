// Get all the elements
const profileAvatar = document.getElementById('profile-avatar');
const profileDropdown = document.getElementById('profile-dropdown');
const mobileMenuToggle = document.getElementById('mobile-menu-toggle');
const mobileNavMenu = document.getElementById('mobile-nav-menu');

// --- Profile Dropdown Logic ---
if (profileAvatar && profileDropdown) {
    profileAvatar.addEventListener('click', function (event) {
        event.stopPropagation();
        profileDropdown.classList.toggle('open');
        // Close mobile menu if it's open
        if (mobileNavMenu && mobileNavMenu.classList.contains('open')) {
            mobileNavMenu.classList.remove('open');
        }
    });
}

// --- Mobile Menu Toggle Logic ---
if (mobileMenuToggle && mobileNavMenu) {
    mobileMenuToggle.addEventListener('click', function (event) {
        event.stopPropagation();
        mobileNavMenu.classList.toggle('open');
        // Close profile dropdown if it's open
        if (profileDropdown && profileDropdown.classList.contains('open')) {
            profileDropdown.classList.remove('open');
        }
    });
}

// --- Click-away Logic for both Dropdowns ---
window.addEventListener('click', function () {
    if (profileDropdown && profileDropdown.classList.contains('open')) {
        profileDropdown.classList.remove('open');
    }
    if (mobileNavMenu && mobileNavMenu.classList.contains('open')) {
        mobileNavMenu.classList.remove('open');
    }
});


// --- Modal Logic ---
// Get all modal elements
const modalOverlay = document.getElementById('modal-overlay');
const postJobBtn = document.getElementById('post-job-btn');
const closeModalBtn = document.getElementById('modal-close-btn');
const cancelBtn = document.getElementById('modal-cancel-btn');

// *** UPDATED HERE ***
// Check if all modal elements exist on the page before adding listeners
if (modalOverlay && postJobBtn && closeModalBtn && cancelBtn) {

    function openModal() {
        modalOverlay.classList.add('open');
    }

    function closeModal() {
        modalOverlay.classList.remove('open');
    }

    // Add listeners only if the elements exist
    postJobBtn.addEventListener('click', openModal);
    closeModalBtn.addEventListener('click', closeModal);
    cancelBtn.addEventListener('click', closeModal);

    modalOverlay.addEventListener('click', function (event) {
        if (event.target === modalOverlay) {
            closeModal();
        }
    });
}