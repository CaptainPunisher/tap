param (
    [int]$TotalMinutes = 30
)

# Define the Windows API signature for system-level keyboard events
$Signature = @"
[DllImport("user32.dll")]
public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, UIntPtr dwExtraInfo);
"@

# Load the API into PowerShell silently
$User32 = Add-Type -MemberDefinition $Signature -Name "User32" -Namespace "Win32" -PassThru

# Windows Virtual Key Constants
$VK_F16 = 0x7F
$KEYEVENTF_KEYUP = 0x0002

# Timing configuration
$IntervalSeconds = 180 # 3 minutes between clicks
$TotalSeconds = $TotalMinutes * 60
$ElapsedSeconds = 0

# Main execution loop running for the specified duration
while ($ElapsedSeconds -lt $TotalSeconds) {
    # Simulate a global F16 Key Down event
    $User32::keybd_event($VK_F16, 0, 0, [UIntPtr]::Zero)
    Start-Sleep -Milliseconds 50
    
    # Simulate a global F16 Key Up event
    $User32::keybd_event($VK_F16, 0, $KEYEVENTF_KEYUP, [UIntPtr]::Zero)

    # Pause execution for 3 minutes before sending the next keystroke
    Start-Sleep -Seconds $IntervalSeconds
    $ElapsedSeconds += $IntervalSeconds
}