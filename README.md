# $pltr

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)

## Overview
### Description
Split checks via reading receipts through photo recognition.

### App Evaluation
- **Category:** Finance
- **Mobile:** This app would be primarily developed for mobile.
- **Story:** Users can take pictures of their receipts and split bill amounts to different people.
- **Market:** Any individual could choose to use this app.
- **Habit:** This app could be used as often or unoften as the user wanted depending on how often they go out to eat with others.
- **Scope:** First users can scan receipt and split checks, then perhaps this could evolve so that users can keep a log or history of their spending records. Large potential for use with other payment services like Venmo, Paypal, and ApplePay.

## Product Spec
### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [ ] User logs in to reciept recognizer
- [ ] User uploads a photo of the receipt
- [ ] User can add people to the bill and click and drap subtotals to these people
- [ ] Settings (Accesibility, Notification, General, etc.) ????

**Optional Nice-to-have Stories**

- [ ] Subtotal with item name
- [ ] Delegate to Venmo to request payments
- [ ] History of receipts

### 2. Screen Archetypes

* Login - users can log in
* Prompting Screen - users will be prompted to upload a picture of their receipt and we will use an OCR to parse the bill
* Bill Splitting Screen - Displays items and the costs, users can add people to the item in order to split the bill
* (Optional) Venmo screen - shows the people that the user requested money to and status of the payment

### 3. Navigation

**Tab Navigation** (Tab to Screen)
* Switch between adding people to bill items and individual tabs

**Flow Navigation** (Screen to Screen)
* Log-in -> Prompting Screen
* Prompting Screen -> Bill Splitting Screen

## Wireframes
<p float="left">
	<img src="https://github.com/CodePath-THETIPPY/TheTippy/blob/master/Images/Wireframes/Login.png" width=200 />
	<img src="https://github.com/CodePath-THETIPPY/TheTippy/blob/master/Images/Wireframes/Camera.png" width=200 />
	<img src="https://github.com/CodePath-THETIPPY/TheTippy/blob/master/Images/Wireframes/Main.png" width=200 />
</p>
<p float="left">
	<img src="https://github.com/CodePath-THETIPPY/TheTippy/blob/master/Images/Wireframes/Item.png" width=200 />
	<img src="https://github.com/CodePath-THETIPPY/TheTippy/blob/master/Images/Wireframes/Name.png" width=200 />
</p>

## Schema
### Models

Accounts
| Property | Type | Description |
| --- | --- | --- |
| username | String | unique ID for each user |
| password | String | password of the user |

Receipts
| Property | Type | Description |
| --- | --- | --- |
| receipt | File | an image of the receipt |
| item | String | name of the item |
| price | Number | the price of the item |


## Video Walkthrough

Here's a walkthrough of current progress:

<img src='http://g.recordit.co/MQRg4unZXS.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
