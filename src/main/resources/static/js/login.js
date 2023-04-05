//FORM LOGIN - occhio password nascondi/mostra

iconaOcchio = document.querySelectorAll(".showHidePw");
inputPass = document.querySelectorAll(".password");

iconaOcchio.forEach((eyeIcon) => {
    eyeIcon.addEventListener("click", function () {
        inputPass.forEach((pwField) => {
            if (pwField.type === "password") {
                pwField.type = "text";

                iconaOcchio.forEach((icon) => {
                    icon.classList.replace("uil-eye-slash", "uil-eye");
                });
            } else {
                pwField.type = "password";

                iconaOcchio.forEach((icon) => {
                    icon.classList.replace("uil-eye", "uil-eye-slash");
                });
            }
        });
    });
});
