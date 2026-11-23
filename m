Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795440504;
	b=dalYgHJ3Kt6x7CZXJNNfRAqBt7eZU3DoAkEJo728ntuLHv2fxThMLONe/yfEtB0Amwvg
	 hA6sWUrD2wNmK3VgTJ8EZyNN1h4btbeE6C/651tcP9N9FnyLIIeY0RUJFUDelq2pBk3l1
	 JU3IzAzbYFsoo4VUqkwpbalf4yRswB01WnWjhIiLfo32fOSxHj0cs7izGFI4zDOvf9b78
	 dXyvPmb9hMuvp/wJzVNWS67ZNtYctZC45MEz5I2Ibn0Ywj27I+poprphNT/UbiyP6bndb
	 6XjNhoVqSfa+JO8tAYIboA3aw7ZHyQy3M6blAo6u6tCF5vE0N71s9IVbCJv2kBe3mfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440504;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=G/taQXBwoIqNqn0V9uROp2Xr7eAeTMBxy+qngLdA9Fc=;
	b=aI1OXC/iXqD9suhlJO4HMQAVUrAZs6w+R9kIMgyXmstyaCu2iMpc49TI1f5S8FkzMg6R
	 Mh1uuqY/LazES8m5bwdV/E/fdmL9ccwfSWmnlT3a2PNbu7w5wiS8rIuo1hln34+TvEglz
	 38Kau0aBZCDetQIC0j93DAwJ2sLmdeKJLwqymuZYKeIcE23SI5coDIu7TpJnp3H2In8WG
	 9sm1/Lpc9+Rm3mnceb2xHodYkLKCRxZrdTa9lZ/G6wA31s2O6G1BSYhmhJplgNE+TNTth
	 APXVz9YMhZav4M+LPn3vts8PN18Vi9FZzOdmsv2CEPVURWg2jgnlwbj84E096HDCsSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CmAY+25d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDB0606A31A;
	Mon, 23 Nov 2026 13:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CmAY+25d
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795440504;
	b=yH6O1caavM+BNd+pRkvrXLvINjINk35hEb9iTI32qtWzdXTCg2dAys8ISk0W/ZLvkH1q
	 bVr34BUL8UaF8K70XZoc9wW/+VqpwzVCom0TYQynze+glb+KlsaxCt8pigb1YMc1xiBmn
	 E+NkQf+a/qDJInA+/UHD28yIQD8RELvbNZ3pxXKEd1AoqLxuj5ivJHto3x2YvKuJj5CqR
	 OUD/MFjSi7DssPdQ/OF1V36+1tr7aEQ1mZ29Q9l5JJqwUCsfYbG1WPBBY2mgIsr4iyaZ8
	 BrWFN0g9USSASsIcW5k7LfJgPhIplPCUjr5pb/oH3twXvqLKguWisTUVj2whCeSm7kA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795440504;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=G/taQXBwoIqNqn0V9uROp2Xr7eAeTMBxy+qngLdA9Fc=;
	b=CJxuuQeNXcHhKzxaUmNabcDkV4Vvm/ae9yGtIckl3kuBlhhgke3TDc/MCy3AcNzmvyIw
	 JP1NkEB4owdQv4Y7UE5zwkVv8evAt4y7GpNRQHTM9CFdhVXXFSyXRmklNVU3CI+p/MCW8
	 y02jNFyojrr9HohCD1pmzF1GbyElqYuT/wKL5Pqm3EnURKFnNsDe7yev4zgllWLAXaYcw
	 JoxC9sVUld0f0gLMxTWe3bKaNv7gF7yS0cI/Z9q0UCAMVPJ0LIdCQAyixTzklp9RPPzgP
	 VCKlu6TUfhVG4sc56gHo9QjNMhaDBss/Si7rXxZAvqa3y70z+LxFUDpaMMmj7ypzDtA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5062F1F000D3;
	Mon, 23 Nov 2026 13:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795440504;
	bh=G/taQXBwoIqNqn0V9uROp2Xr7eAeTMBxy+qngLdA9Fc=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=CmAY+25dJusctYntOP9iuNNMlOWU6c9hL0hK19hiVPPkIhEYCXPiAxa/rnue9Nl2d
	 L78kBfo3//xThIpaqaMul6bCTmY+oIPgS7v5nXMZK4V+ONlYMRUfYx4ZMa3GWuwtcy
	 Ka+IaV8m0unZFBZ6of9uAFRaM5yiO9rkG244GthN6sefCp8/WmT1IM4Y6ZeQ97FWwx
	 brjg5VD1a1yn/7CfqOtqJ3M8Tf22mKJVMR9LrGyvuA6G/QxkB1iUfJ0mnpYUjbjGuo
	 OLH/hmmGjUPVovRsp3tySKgUWUUkurCmOu+X48Jn4cyF8/b352eAeOx2ID5E5oJddO
	 Sr9D/tWlft12Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C05174C48E;
	Mon, 23 Nov 2026 13:28:12 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v11 0/2] Add initial dual front camera and rear flash
 support for Pixel 3 / 3 XL
Date: Mon, 23 Nov 2026 14:28:09 +0100
Message-Id: <20261123-pixel3-camera-v11-0-d00195d180dc@ixit.cz>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33SzW7CMAwH8FdBPa9TnE+b095j2iFJnRFpA9ayi
 g3x7kthEm2QOMbK72/L8qkZuM88NOvVqel5zEPebcsD4GnVxI3fvnObu1JopJBWKDDtPh/5Q7X
 Rf3LvW0+EFJJBYm6K2fecyocp8PWtvDd5OOz6n0v+CFP1mqQBqqQRWtFKZ5wV1oAJ9iUf8+E5/
 jZTzigfWlmshoBIPgTQcWnV3MraqmJZ2iBIeAsgllbfrAOqrZ76YvQBpLJo5NKah9YUS2RIJQg
 dcjWznVkpamuL9Yk1UOCkXbUrN7d3u3LFouyUVNFG01Uz482SuLN4mTmBIUSlNC4tza2rLRUbg
 BDS1JxgaUHMMNxhEEV3ySqQjoKi7qbP17Pr+eu7nO/h//bO5z85gaYN3AIAAA==
X-Change-ID: 20260315-pixel3-camera-a9989bf589ee
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3355; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DnyxK+CH29aGE0/NgvGyExF9hEYwCx25ThxaJ/VBTS4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrBD9rd1lGXz5HexqJr0ncrOeM9r6BGzvaYBGtI
 iRDuFXj8a2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawQ/awAKCRBgAj/E00kg
 cugPD/98BJK3uoN4L489lXay+FaAzYEZyJbWMnHZdXjaSq68CTxlrQ620F6xg8DIoZ1MwKJggBr
 gO2EBkhO2+lDSXVPZ+Skkq0AYH2jycQqsbdWdNh/eTq+ERHbmQfuF3nReYrF0D1u1jnqX88G/r6
 6sBq0WOfi9piwPWTSFRgFMSX6AKhEOj55O0vPdx7PhHOKMlpsCkwY1rVg3NLhTjHWsCKhF5JrHT
 CI/rHlmC5TCJAuPgvKRG2VzE9JlNWLH3yJfUNSU4MHp5w4qhGVyDEfh+81M1Abmo66pQJwFCgbb
 q6VMjtRfQgfmXt/RYJXE70mONsda2VMVi4H+TB+0yfew7Co0f3Nes6pVxnwfE0xVTc6fWDXHfDP
 APv/5uWwb6VU3CoMbEbXXtUNO0rLWLqAoq2IMoIfU8SAlUYE/PKUn0FURCPruBQFWoOhddI8mCF
 W8MLgNfaBDoZ74l1vYuiaAHFg+zD2kXrIsFD3YLZJA5sLG9zwNTt5Woo5D/75NBqpFeN5LnDmtw
 EaAZv5qwDsNGpZC5qzCZfcvOh58vfGD7bFP2f+9E0BM+e4L36uj+NcDyWcyLqDqZU+KdyZYH0gb
 unw9sF2e2/WBE7+e7UpRE/vNXEeIJM1RjywJq5zY/bR8sQOBAyOiiAgHswQ27BzCRWs2Av6mseE
 e7X6WdwWF+2tfXQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Describe the dual front-facing IMX355 sensors (standard and wide)
and enable the PMI8998 flash LED with hardware-accurate limits.

This brings up the basic camera topology and flash support in DT.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v11:
- Reverted to the v9 (as the merging didn't occured yet, and now header
  file is in the place).
- Link to v10: https://patch.msgid.link/20260917-pixel3-camera-v10-0-df631279b39d@ixit.cz

Changes in v10:
- Removed the (not yet met) dependency. I'll apply fix after it gets
  merged. Feel free to pick between v10 and v9 for merging as what you
  think is the best way.
- Link to v9: https://patch.msgid.link/20260907-pixel3-camera-v9-0-b1981f2d3291@ixit.cz

Changes in v9:
- Dependency merged, no longer depends on anything.
- Link to v8: https://patch.msgid.link/20260901-pixel3-camera-v8-0-99f159883348@ixit.cz

Changes in v8:
- Fix ordering of includes. (Konrad)
- Link to v7: https://lore.kernel.org/r/20260721-pixel3-camera-v7-0-82d323c6c5d2@ixit.cz

Changes in v7:
- Depend on the
  https://lore.kernel.org/all/20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com/
  (Konrad)
- Sort the renamed regulators. Why Mr. Anderson, why. (Konrad)
- Link to v6: https://lore.kernel.org/r/20260720-pixel3-camera-v6-0-afe419bef476@ixit.cz

Changes in v6:
- Remove forgotten bias-pull-down property from cci0_sleep node.
  (dtbs_check)
- ..-regulator -> regulator-.. (Konrad)
- Rename camera -pin to -state and remove _pin from the labes. (Konrad,
  dtbs_check)
- Link to v5: https://lore.kernel.org/r/20260719-pixel3-camera-v5-0-99593f1bd8ec@ixit.cz

Changes in v5:
- Added function-enumarator to flash LEDs. (Sashiko)
- Dropped l22a regulator needed only for NFOV actuator. (Sashiko)
- Dropped vdda-csi[0-2]-supply, as it was unused. (Sashiko).
- Added previously omited cam_mclk2_sleep sleep state.
- Link to v4: https://lore.kernel.org/r/20260719-pixel3-camera-v4-0-48cab1236852@ixit.cz

Changes in v4:
- Use 24 MHz ext clock for the cameras, as the downstream does, since
  the upstream driver can now support it.
- Added additional LED, as the phone contains two separately controlled
  white LEDs flash (upper and bottom, in one module).
- Increase flash-max-microamp, as I took wrong "flash" from the
  downstream sources and dropped Dmitry R-b.
- Address formatting issues. (Konrad)
- Link to v3: https://lore.kernel.org/r/20260412-pixel3-camera-v3-0-e26b090a6110@ixit.cz

Changes in v3:
- Dropped cam_vio label. (Dmitry)
- Move the MCLK2 pinctrl from cameras to common camss. (Dmitry)
- Link to v2: https://lore.kernel.org/r/20260411-pixel3-camera-v2-0-41b889abb14c@ixit.cz

Changes in v2:
- leds.h include escaped the initial submission. Fixed.
- Link to v1: https://lore.kernel.org/r/20260411-pixel3-camera-v1-0-2757606515b6@ixit.cz

---
David Heidelberg (2):
      arm64: dts: qcom: sdm845-google: Add dual front IMX355 cameras
      arm64: dts: qcom: sdm845-google: Enable PMI8998 camera flash LEDs

 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 199 ++++++++++++++++++++-
 1 file changed, 198 insertions(+), 1 deletion(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20260315-pixel3-camera-a9989bf589ee

Best regards,
--  
David Heidelberg <david@ixit.cz>


