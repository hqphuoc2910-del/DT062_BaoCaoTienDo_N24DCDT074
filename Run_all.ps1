param([string]$Julia='julia')
$ErrorActionPreference='Stop'
$codeRoot=$PSScriptRoot
function Run-JuliaStep([string[]]$JuliaArgs) {
    & $Julia @JuliaArgs
    if ($LASTEXITCODE -ne 0) { throw ('Julia failed: '+($JuliaArgs -join ' ')) }
}
Write-Output '=== KIEM TRA PHIEN BAN JULIA ==='
Run-JuliaStep @('--version')

for ($caseId=1; $caseId -le 8; $caseId++) {
    Write-Output ('=== DEMO '+$caseId+' ===')
    Run-JuliaStep @('--startup-file=no',(Join-Path $codeRoot 'demo.jl'),('--ca='+$caseId))
}

Write-Output '=== CHAY BO KIEM THU TU DONG (12 CA) ==='
Run-JuliaStep @('--startup-file=no',(Join-Path $codeRoot 'test/runtests.jl'))

Write-Output '=== BANG CATALOG KIEM THU ==='
Run-JuliaStep @('--startup-file=no',(Join-Path $codeRoot 'scripts/test_catalog.jl'))

Write-Output '=== KHAO SAT BA QUY MO N=5, 20, 100 ==='
Run-JuliaStep @('--startup-file=no',(Join-Path $codeRoot 'khao_sat.jl'))

Write-Output 'END_TO_END_OK: Hoan tat toan bo demo doc lap, 12 ca test, catalog va khao sat quy mo.'
