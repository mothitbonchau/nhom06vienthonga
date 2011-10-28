<script type="text/javascript" src="js/fileuploader.js"></script>

<script>
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
    <noscript>			
        <p>Please enable JavaScript to use file uploader.</p>
        <form id="frm" name="frm" method="post" action="process?task=1" enctype="multipart/form-data">
            <input name="up" type="file" value="SDFSDFSDF"/>
        </form>
        <!-- or put a simple form for upload here -->
    </noscript>         
</div>