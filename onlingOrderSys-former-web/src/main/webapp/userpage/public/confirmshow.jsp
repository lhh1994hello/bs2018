<%@page pageEncoding="UTF-8"%>
function confirm(fun, params,info) {
    if ($("#myConfirm").length > 0) {
        $("#myConfirm").remove();
    } 
    var html = "<div class='modal fade' id='myConfirm' >"
            + "<div class='modal-backdrop in' style='opacity:0; '></div>"
            + "<div class='modal-dialog' style='z-index:2901; margin-top:60px; width:400px; '>"
            + "<div class='modal-content'>"
            + "<div class='modal-header'  style='font-size:16px; '>"
            + "<span class='glyphicon glyphicon-envelope'>&nbsp;</span>信息！<button type='button' class='close' data-dismiss='modal'>"
            + "<span style='font-size:20px;  ' class='glyphicon glyphicon-remove'></span><tton></div>"
            + "<div class='modal-body text-center' id='myConfirmContent' style='font-size:18px; '>"
           <!--  + <!-- "是否确定要删除？" --> 
            +info
            + "</div>"
            + "<div class='modal-footer ' style=''>"
           <!--  + "<button class='btn btn-danger ' id='confirmOk' >确定<tton>" -->
            + "<button class='btn btn-danger '  style='width:60px;height:35px;' id='confirmOk' >确定<tton>"
           <!--  + "<button class='btn btn-info ' data-dismiss='modal'>取消<tton>" -->
            + "<button class='btn btn-info '  data-dismiss='modal' style='background-color: #80ff99;width:60px;height:35px;color: #ffffff;font-size:14px;'>取消<tton>"
            + "</div>" + "</div></div></div>";
    $("body").append(html);

    $("#myConfirm").modal("show");
	var flag=1;
    $("#confirmOk").on("click", function() {
        $("#myConfirm").modal("hide");
        fun(params); // 执行函数
           
       	flag=2;
    });
    return flag;
}