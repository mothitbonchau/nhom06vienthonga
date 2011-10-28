<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript" src="js/fileuploader.js"></script>

<script>
    var flag = 1;
    
    function kk()
    {
        //flag = 1;
        if(confirm("DSFDSFDSF") == true)
            alert("SDFSDF");
        else
            return;
    }
    
    function createUploader(){            
        var uploader = new qq.FileUploader({
            element: document.getElementById('file-uploader-demo1'),
            action: 'process?task=1',
            debug: true
        });           
    }
    
    // in your app create uploader as soon as the DOM is ready
    // don't wait for the window to load  
    window.onload = createUploader;
</script>

<div id="file-uploader-demo1">

</div>
