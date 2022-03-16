{{--@if(session('success'))--}}
{{--    @push('scripts')--}}
{{--        <script>--}}
{{--            let elVal = document.getElementById("statusIdSuccess").innerText;--}}
{{--            $.toaster({ settings : {timeout: 3500}, message : elVal , title : 'Success' });--}}
{{--        </script>--}}
{{--    @endpush--}}
{{--@endif--}}
{{--@if(session('error'))--}}
{{--    @push('scripts')--}}
{{--        <script>--}}
{{--            let elVal = document.getElementById("statusIdFailed").innerText;--}}
{{--            $.toaster({ settings : {timeout: 3500}, message : elVal , title : 'Failed' ,  priority : 'danger'});--}}
{{--        </script>--}}
{{--    @endpush--}}
{{--@endif--}}

{{--<h1 id="statusIdSuccess" style="display: none;">{{session('success')}}</h1>--}}
{{--<h1 id="statusIdFailed" style="display: none;">{{session('error')}}</h1>--}}

@if(session('success'))
    @push('scripts')
        <script>
            let elVal = document.getElementById("statusIdSuccess").innerText;
            Snackbar.show({text: elVal,pos: 'top-center', showAction:false, backgroundColor: '#c3e6cb', textColor: '#155724'});
        </script>
    @endpush
@endif
@if(session('error'))
    @push('scripts')
        <script>
            let elVal = document.getElementById("statusIdFailed").innerText;
            Snackbar.show({text: elVal, pos: 'top-center', showAction:false, backgroundColor: '#f8d7da', textColor: '#721c24'});
        </script>
    @endpush
@endif
<h1 id="statusIdSuccess" style="display: none;">{{session('success')}}</h1>
<h1 id="statusIdFailed" style="display: none;">{{session('error')}}</h1>
