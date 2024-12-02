$(document).ready(function() {
    $(".mainSection-best .cate_tab span").click(function () {
        var category = $(this).data("cate");

        // AJAX 요청 보내기
        $.ajax({
            url: "/oho_main.ajax", // 서버의 AJAX 처리 URL
            type: "GET",
            data: { category: category },
            dataType: "json", // JSON 형식으로 응답 받기
            success: function (response) {
                // 응답 데이터를 기반으로 HTML 생성
                const html = generateProductHTML(response);
                $(".common_list_box2 .items-swiper-wrapper").html(html);
            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
                alert("상품 데이터를 불러오는 중 오류가 발생했습니다.");
            },
        });

        // 카테고리 활성화 처리
        $(".mainSection-best .cate_tab span").removeClass("on");
        $(this).addClass("on");
    });

    // 색깔 고르기
    $('.find_color_list span').on("click", function() {
        $(this).toggleClass('on');
    });

    // 서브밋 버튼 클릭 (추후 추가할 서브밋 관련 코드)
    $('.find_color_list div.find_color_btn').on("click", function() {
        // 서브밋 관련 로직 추가
    });
	
	// 이미지 호버 효과
	$(".items-swiper-wrapper").on("mouseenter", "li", function() {
	    $(this).find(".thumb_img").css("opacity", "0");
	    $(this).find(".hover_img").css("opacity", "1");
	});
	
	$(".items-swiper-wrapper").on("mouseleave", "li", function() {
	    $(this).find(".hover_img").css("opacity", "0");
	    $(this).find(".thumb_img").css("opacity", "1");
	});
	
	
	
    var swiper = new Swiper(".mySwiper", {
        loop:true,
      pagination: {
        el: ".swiper-pagination",
        centeredSlides: true,
        clickable: true,
        renderBullet: function (index, className) {
          return '<span class="' + className + '">' + (index + 1) + "</span>";
        },
      },
    });

    var swiper = new Swiper(".mySwiper2", {
      slidesPerView: 'auto', // 자동 너비 조절
      scrollbar: {
        el: ".swiper-scrollbar",
        hide: false,
        draggable: true, 
      },
      
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });

    var swiper = new Swiper(".mySwiper3", {
      slidesPerView: 'auto', // 자동 너비 조절
      scrollbar: {
        el: ".swiper-scrollbar",
        hide: false,
        draggable: true, 
      },
      
      navigation: {
        nextEl: ".swiper-button-next2",
        prevEl: ".swiper-button-prev2",
      },
    });

    var swiper = new Swiper(".mySwiper4", {
        loop:true,
    });

    var swiper = new Swiper(".mySwiper5", {
      effect: "coverflow",
      grabCursor: true,
      centeredSlides: true,
      slidesPerView: "auto",
      loop:true,
      coverflowEffect: {
        rotate: 50,
        stretch: 0,
        depth: 100,
        modifier: 1,
        slideShadows: true,
      }
    });
	
});


// 상품 데이터를 기반으로 HTML 생성 함수
function generateProductHTML(products) {
    let html = "";
    products.forEach((product, index) => {
        html += `
            <li id="item${index + 1}" class="item-swiper-slide swiper-slide">
                <div class="container-complete" data-prd-num="${product.pdtid}">
                    <dl>
                        <a href="/product/prd_detail_view.htm?product_no=${product.pdtid}&cate_no=121" class="viewlink"></a>
                        <div class="base-img">
                            <div class="thumb">
                                <img loading="lazy" alt="" class="thumb_img" width="800" height="800"
                                     src="/resources/images/prd_image/imgs/${product.pdtimgurl}.jpg">
                                <img loading="lazy" class="hover_img" width="800" height="800"
                                     src="/resources/images/prd_image/imgs_hover/${product.pdtumgurl}.jpg">
                            </div>
                            <span class="soldout-img" style="display: ${product.pdtcount === 0 ? 'block' : 'none'};">
                                <a href=""><span>coming<br>soon</span></a>
                            </span>
                        </div>
                        <div class="base-mask">
                            <dd class="name-container">
                                <p class="name"><span>${product.pdtname}</span></p>
                            </dd>
                            <dd class="price-container">
                                ${product.pdtdiscountrate !== 0 ? `
                                    <p class="normal-price">${formatNumber(product.pdtamount)}</p>
                                    <p class="sale-price">${formatNumber(product.pdtdiscountamount)}</p>
                                    <p class="discount">${product.pdtdiscountrate}%</p>
                                ` : `
                                    <p class="sale-price">${formatNumber(product.pdtamount)}</p>
                                `}
                            </dd>
                            <dd class="prdRegiDate">등록일: ${product.pdtadddate}</dd>
                            <div class="prdInfoBot">
                                <div class="rvCount">
                                    <div class="rvWrap">
                                        <p class="rv_count_wrap">
                                            <span class="rv_count_value">${product.pdtreviewcount}</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="cart-in">
                                <img src="/resources/images/btn_list_cart.gif" data-pdtid="${product.pdtid}" alt="장바구니 추가 버튼">
                            </div>
                        </div>
                    </dl>
                </div>
            </li>
        `;
    });
    return html;
}

// 숫자 포맷팅 함수
function formatNumber(number) {
    return number.toLocaleString("ko-KR");
}