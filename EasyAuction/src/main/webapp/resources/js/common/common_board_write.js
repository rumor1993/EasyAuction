	$(function() {
		//전역변수선언
		var editor_object = [];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : editor_object,
			elPlaceHolder : "eb_cont",
			sSkinURI : "./resources/editor/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부
				bUseModeChanger : true,
			}
		});

		$("#save").click(function() {
			editor_object.getById["eb_cont"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		})

		$("#madein").change(function() {
			$("#eb_madein").val($("#madein").val())
		})

		$("#bigcategory")
				.change(
						function() {
							var categoryname = $(this).val();
							str = "<option value=''> 소분류를 선택 해주세요 </option>";
							$
									.ajax({
										url : "common_product_write.nhn",
										data : {
											"categoryname" : categoryname,
											"state" : "ajax"
										},
										success : function(data) {
											console.log(data)

											$(data)
													.each(
															function(index,
																	item) {
																str += "<option value="+item.ey_categorynum+">"
																		+ item.ey_smallcategory
																		+ "</option>";
															})
											$("#ey_categorynum").empty()
													.append(str)
										}
									})
						})
	});