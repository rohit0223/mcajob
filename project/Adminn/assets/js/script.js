document.addEventListener('DOMContentLoaded', function () {
    const sidebar = document.getElementById('sidebar');
    const navLinks = document.querySelectorAll('.sidebar-nav .nav-link');

    // Get the Bootstrap offcanvas instance
    let sidebarOffcanvas = null;
    if (window.bootstrap && sidebar) {
        try {
            // Re-initialize the Offcanvas element with Bootstrap
            sidebarOffcanvas = bootstrap.Offcanvas.getOrCreateInstance(sidebar);
        } catch (e) {
            sidebarOffcanvas = null;
        }
    }

    // --- Navigation Handling (Simplified to only close the offcanvas) ---
    navLinks.forEach(link => {
        link.addEventListener('click', function (e) {
            // DO NOT call e.preventDefault()
            // Allow the link to navigate to the new .aspx page

            // Close the offcanvas sidebar on mobile after clicking a link
            if (window.innerWidth < 992) { // 'lg' breakpoint
                if (sidebarOffcanvas) {
                    sidebarOffcanvas.hide();
                }
            }
        });
    });

    // All previous logic for showPageById, active class, and header update is removed.
});