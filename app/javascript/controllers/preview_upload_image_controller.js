import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="preview-upload-image"
export default class extends Controller {
  static targets = ["show_main_image", "show_images", "uploader_main", "uploader_images"];

  connect() {
    const self = this;
    const images = self.uploader_imagesTarget;
    const imagesPreview = document.querySelector("#images-preview");

    images.addEventListener("change", function() {
      const files = images.files;

      // 清除預覽區域
      imagesPreview.innerHTML = '';

      // 遍歷每個文件並顯示預覽
      Array.from(files).forEach(file => {
        const reader = new FileReader();

        reader.onload = function(e) {
          const img = document.createElement('img');
          img.src = e.target.result;
          img.classList.add('w-16', 'h-16', 'object-cover', 'rounded-md', 'm-1');

          // 將圖片添加到預覽區域
          imagesPreview.appendChild(img);
        };

        reader.readAsDataURL(file);
      });
    });
  }

  uploadImages() {
    this.uploader_imagesTarget.click();
  }
}
