<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계단 - 개발자 협업을 위한 첫 걸음</title>
    <link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon-16x16.png">
    <link rel="stylesheet" href="resources/css/board-write.css">
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
	 <div id="wrapper">
        <form method="post" action = "boardupdate.do">
        	<input type = "hidden" name = "b_no" value = "${dto.b_no}">
        	<input type = "hidden" name = "b_userid" value = "${b_userid}">
        	<input type = "hidden" name = "b_teamcode" value = "${dto.b_teamcode }">
            <section>
                <input type="text" id="input1" class="title" name = "b_title" value = "${dto.b_title}">
            </section>
            <div class="contentinfo">
                <div class="taglist">
                    <span>공개 범위 :</span>
                    <select class="select" name="b_category">
                        <option value="팀">팀</option>
                        <option value="개인">개인</option>
                    </select>
                </div>
                <div class="category">
                    <span>카테고리 :</span>
                    <select class="select" name="c_no">
                        <option value="1">회의록</option>
                        <option value="2">코드리뷰</option>
                        <option value="3">잡글</option>
                    </select>
                </div>
                <div class="tagcontainer">
                    <span>태그 :</span>
                    <div>
                        <div class="tag-field js-tags">
                            <input id="hashtag" class="js-tag-input" placeholder="태그 추가: Enter (최대 5개)" />
                        </div>
                    </div>
                </div>
            </div>
            <textarea id="summernote" name="b_content">${dto.b_content}</textarea>
            
            <div class="board-button">
	            <button class="button-cancel" value="취소" onclick = "location.href='boardlist.do?b_teamcode=${dto.b_teamcode}'">취소</button>
	            <button type = "submit" class="button-confirm" value="글 수정">글 수정</button>
	        </div>
        </form>

    </div>

    <script>
        var tags = [];
        var $container = document.querySelector('div');
        var $input = document.getElementById('hashtag');
        var $tags = document.querySelector('.js-tags');

        // $container.addEventListener('click', function () {
        //     $input.focus();
        // });

        $container.addEventListener('keydown', function (evt) {
            if (!evt.target.matches('.js-tag-input')) {
                return;
            }

            if (evt.keyCode !== 13) {
                return;
            }

            var value = String(evt.target.value);

            if (!value.length || value.length > 20 || tags.length === 5) {
                return;
            }

            tags.push(evt.target.value);
            $input.value = '';
            render(tags, $tags);
        });

        $container.addEventListener('keydown', function (evt) {
            if (!evt.target.matches('.js-tag-input')) {
                return;
            }

            if (evt.keyCode !== 8) {
                return;
            }

            if (String(evt.target.value).length) {
                return;
            }

            tags = tags.slice(0, tags.length - 1);
            $input.value = '';
            render(tags, $tags);
        });

        $container.addEventListener('click', function (evt) {
            if (evt.target.matches('.js-tag-close') || evt.target.matches('.js-tag')) {
                tags = tags.filter(function (tag, i) {
                    return i != evt.target.getAttribute('data-index');
                });
                render(tags, $tags);
            }
        }, true);


        function render(tags, el) {
            el.innerHTML = tags.map(function (tag, i) {
                return (
                    '<div class="tag js-tag" data-index="' + i + '">' +
                    tag +
                    '<span class="tag-close js-tag-close" data-index="' + i + '">×</span>' +
                    '</div>'
                );
            }).join('') + (tags.length === 5 ? '' : '<input id="hashtag" placeholder="태그 추가: Enter (최대 5개)" class="js-tag-input">')
                ;

            $container.querySelector('.js-tag-input').focus();
        }
    </script>
    <script>
        $(document).ready(function () {

            var toolbar = [
                // 글꼴 설정
                ['fontname', ['fontname']],
                // 글자 크기 설정
                ['fontsize', ['fontsize']],
                // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
                ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                // 글자색
                ['color', ['forecolor', 'color']],
                // 표만들기
                ['table', ['table']],
                // 글머리 기호, 번호매기기, 문단정렬
                ['para', ['ul', 'ol', 'paragraph']],
                // 줄간격
                ['height', ['height']],
                // 그림첨부, 링크만들기, 동영상첨부
                ['insert', ['picture', 'link', 'video']],
                // 코드보기, 확대해서보기, 도움말
                ['view', ['codeview', 'fullscreen', 'help']]
            ];

            var setting = {
                height: 500,
                minHeight: null,
                maxHeight: null,
                focus: true,
                lang: 'ko-KR',
                toolbar: toolbar,
                callbacks: { //여기 부분이 이미지를 첨부하는 부분
                    onImageUpload: function (files, editor,
                        welEditable) {
                        for (var i = files.length - 1; i >= 0; i--) {
                            uploadSummernoteImageFile(files[i],
                                this);
                        }
                    }
                }
            };

            $('#summernote').summernote(setting);
        });
    </script>
    <script>
        $(function () {
            $('.select').change(function (e) {
                var $this = $(this);
                var c = $this.find('option:selected').data('color');
                $this.css({ 'color': c, 'border-color': c });
            });
            $('.select').each(function () {
                var $this = $(this);
                $this.trigger('change');
                $this.find('option').each(function () {
                    $(this).css('color', $(this).data('color'));
                });
            });
        });
    </script>
</body>
</html>