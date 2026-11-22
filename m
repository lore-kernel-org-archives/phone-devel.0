Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795375225;
	b=DAaFG/Tac4D0OcP8jyig8JnHa1VQfbVpxO40YmTnemlqdu6QddXMNC/Y/IfvTu7WSCgl
	 fzoi9SmXDvWocL7GHqkiGQioEefiQwfsbuJRd2JeM+a/T4WMaeQMhdnM2wFhALSrmVFuL
	 S/X3LWpAPcqys04p8ydCaCaR1+RaNcdykm1Jhovkauu3R/+JNGu2gLWexDIrMyxsnJUQK
	 Y761yHU8xFPdHmOyjV3ln4hROvhjWPJmDSoNWy7U3R8Na7VTn5V7/mm0ZX0Vdb0aVgNIH
	 d0e0bvcGTfGsWugLHrZ7c4pjD8pbXmAcLR/3Gka7ikCJij8Bkzq4bTwfRINuHzZEqPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795375225;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RbhHn0ijg5qDMRvXVqnUii7Cq4S9tFcX1wIY34cE0z4=;
	b=DtsJckHIFSRzwVP8xrXc32oH+PNZ5/rDrSxAPL4MQOSF4xAuiDl+nW7aYp14cRnjszma
	 mVCFuLqIyzq2dzCCyXsVPfH2Fem/GeZwOGnOgtaYKtfCoVbVfBKYDcFCk46CSuKMimtBA
	 m6PZ6zvHP42pMDX+iwu6eipQ+//dgXl2VTltHz75PnccGc5XduiGcTXsP9d2tR9RYg0BE
	 OwWeuBJBGpnLNqQXqHOy302nDwFy0g/CQ7q9gtkO1tNImpC/RYQO9nmQkIa7UWRG63E/c
	 m5CCCVSLN2E12C6wtzhw2fh7JAbkRRTrkHZtxL04M6RNtYku3nAoaLOelh0cSJYRGDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jVo/Lu6u";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688C7606A32A;
	Sun, 22 Nov 2026 19:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jVo/Lu6u
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795375224;
	b=A1sp1FWxU8gUJ+wnUmOXSrVIhZsOnR09sT9dLo1uLFN8ZigmR90ZySmSD/48sJQBP16m
	 cPU3XbtGxEAL9Bd2CsNsy4b1Fq55/jigC59fbAYmqnmjGWLhCf9eyqtmBb6EbrkIR2u95
	 JlU0FMmZnmcrlaesyNG520RINjmOTLGojEW47G3veWHPYAA86+A5XYYvbfzpJx2k0qs5A
	 oUW65hyRk9oVtpo8zPoTL+UyDzkE2//upa+OXgBS9feWlp7i19jYMLR/UWQFdVVROjx8F
	 V1BfNlsE+Pf4Tt9QhfQS4dNWnZRoUtiEpv+c+zl5jqVxIxBXLwYded4NCnwIwTXVgHQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795375224;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RbhHn0ijg5qDMRvXVqnUii7Cq4S9tFcX1wIY34cE0z4=;
	b=fEQIaOsS/P5c8roK2BD/pTCaVR13Yw7iEThry5TAXp/icCXmOGUTgEfHI8hrrSV0zqOW
	 F3TMDkC2Y4+b1DuviunoVlLLEKh5DFUmyzQM6rgyXwxE4TTzv2NVZVrB7UvzwlEyn/zH2
	 amhZnq4Yc12TyOfJkL/G8jXClwrAq8Fb3vBHCg6Ly51flXvXHlsc5Flojgvw8ZpwY8ODl
	 D9L8CMqnhW9ufKUIIWdWe/PVaw71/wizyl6QpO6ymuNA0l/cyuFx0ZROTrRegt4pfolj9
	 NOimWJs+LPvaJm8XCXWJNux0irUCouCSfkBtFzB5zzAN2Rm9j8ZZSB6+D2GrQKtBzog==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26C3A1F000D3;
	Sun, 22 Nov 2026 19:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795375224;
	bh=RbhHn0ijg5qDMRvXVqnUii7Cq4S9tFcX1wIY34cE0z4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=jVo/Lu6uXorDXQUpC+bviNDzjTkXbQVlIsN7C0PBzrz+I4FRb6fTwl+7xLyEgitkp
	 xGPOv46+qNTr1X23Xm21XKQ2KnJxwmJeca+1mSGf4RSNGqsyrqjiDKD0t9WjwLUEHN
	 9SCLl41Ta494twf95+WbtdS0YA6VXXkvlm+mz3LssYbyp1SSnbWsTQhIvOn0Nw4PgW
	 xiuuXjabEPfmmGBSb4lCdw3pbj5HTzE8M66wpyetMKzbH2ndZOBWZXbbAQNOGMC4o/
	 ABMqheXB46eD7oHRiplESdty3durkTttIHVss15eAB2dy5olsagPPDLIxdMxp7UcPX
	 xBcBr1TC1VrzQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A601D4C1BD;
	Sun, 22 Nov 2026 19:20:18 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 23 Nov 2026 00:50:18 +0530
Subject: [PATCH v2] dt-bindings: usb: snps,dwc3-common: Document
 usb-psy-name
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
Message-Id: <20261123-vantage-dwc3-v2-1-2e741a834411@yahoo.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ7CIBBEf6XZs5guRJp48j9MD3S7tZhYDCDaN
 Py7UM8e32TmzQaBveUA52YDz8kG65YC8tAAzWa5sbBjYZCt1IioRTJLNCUe36QEE5GcUKpREZT
 J0/NkP7vu2v84vIY7U6yO2phtiM6v+1/C2vujTihQaDMMJ6Nk103tZTWzc0dyD+hzzl+j2yrnu
 gAAAA==
X-Change-ID: 20261116-vantage-dwc3-eccc2f123d3c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795375217; l=2646;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=UVWhSLAPePZ8e1Iapxx51B9VAvYDZtSIXNZrGl1F++A=;
 b=LjXwV7r79U8KqLx/vldf3Mc/6A/BgjP6EzZ6jS8G5dTdt4sOEiNqEnmS/Ui+hP5aYL2bg3XyZ
 05OKvisLHdHBFh5IqFbzVln+XVooaG1+C1lpR4/ExGWW6ZwD7/OIikM
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

The dwc3 driver reads usb-psy-name since commit 6f0764b5adea ("usb: dwc3:
add a power supply for current control") to tell a power supply the
current the USB host grants, but the property was never documented.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
The dwc3 driver has read usb-psy-name for a long time, but the property
was never documented. The Motorola Signature uses it to tell the
qcom_battmgr USB power supply the current the host grants.

Checked with dt_binding_check and with dtbs_check on the Motorola
Signature devicetree, which sets the property.

I used an LLM (Claude) to help write this patch and its commit message.
I reviewed it.
---
Changes in v2:
- Drop the Assisted-by trailers and the LLM notes from the commit
  messages, the LLM use is stated in this cover letter.
- Move usb-psy-name after phy-names, it split the phys/phy-names pair
  (Sashiko).
- Sashiko also asked whether a power supply name belongs in the binding
  rather than a phandle. The property is not new: dwc3 has read it since
  commit 6f0764b5adea ("usb: dwc3: add a power supply for current
  control") and this only documents it. A phandle based description
  would need a new dwc3 interface; I am happy to do that instead if it
  is preferred. Its other point, that qcom_battmgr cannot take the
  limit, no longer holds since commit be5e7367bceb ("power: supply:
  qcom_battmgr: Allow setting the USB input current limit").
- Link to v1: https://patch.msgid.link/20261116-vantage-dwc3-v1-1-6abb5a3277f0@yahoo.com
---
 Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b653824..41e8537b34d5 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -51,6 +51,13 @@ properties:
       - items:
           pattern: "^usb(2-([0-9]|1[0-4])|3-[0-3])$"
 
+  usb-psy-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Name of the power supply that is told the current the USB host
+      grants to the device (e.g. after enumeration), so the charger can
+      draw it.
+
   snps,usb2-lpm-disable:
     description: Indicate if we don't want to enable USB2 HW LPM for host
       mode.

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261116-vantage-dwc3-eccc2f123d3c

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>


