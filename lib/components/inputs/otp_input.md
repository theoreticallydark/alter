# OTPInput

**Version**: `1.0.0`  
**Base**: Custom Digit Cells using Alter Tokens

---

## Overview
`OTPInput` is a PIN / OTP verification component featuring individual digit boxes (56px width, 64px height, 20px radius) with auto-focus progression, backspace auto-retreat, clipboard paste handling, and optional obscure mode.

---

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `length` | `int` | `4` | Number of digit slots (e.g. 4 or 6) |
| `type` | `InputControlType` | `gray` | Surface variant (`gray` or `white`) |
| `obscureOtp` | `bool` | `false` | Masks entered digits with bullet characters |
| `onCompleted` | `ValueChanged<String>?` | `null` | Triggered when all digits are filled |
| `onChanged` | `ValueChanged<String>?` | `null` | Triggered on any digit change |

---

## Design Tokens Used
- **Background**: `AlterSemanticTokens.baseGray` (`#F9FAFB`) / `AlterSemanticTokens.baseWhite` (`#FFFFFF`)
- **Border**: `AlterSemanticTokens.stroke200` (`#E5E7EB`), `stroke1000` (`#111827`, 2px focused), `textDanger` (`#EF4444`)
- **Typography**: `AlterTypography.h3Bold` (20px Bold)
