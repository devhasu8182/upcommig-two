@if(session('success'))
    @push('scripts')
        <script>
            let elVal = document.getElementById("statusIdSuccess").innerText;
            $.toaster({ settings : {timeout: 3500}, message : elVal , title : 'Success' });
        </script>
    @endpush
@endif
@if(session('error'))
    @push('scripts')
        <script>
            let elVal = document.getElementById("statusIdFailed").innerText;
            $.toaster({ settings : {timeout: 3500}, message : elVal , title : 'Failed' ,  priority : 'danger'});
        </script>
    @endpush
@endif

<h1 id="statusIdSuccess" style="display: none;">{{session('success')}}</h1>
<h1 id="statusIdFailed" style="display: none;">{{session('error')}}</h1>
