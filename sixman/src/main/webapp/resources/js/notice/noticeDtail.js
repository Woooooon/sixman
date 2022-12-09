function deletePage(no) {
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {

                } else {
                alert('Request Error!');
                }
        }
    };

    httpRequest.open('post', '/sixman/notice/delete');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`no=${page}`);
}