Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795798285;
	b=RPMGvwH2wm/76FyY/oGdEQsMkhYcIDUaPiG/d0BqTDyAC70vAagBxTP9/j9fCR9jn4uV
	 OucRW/jBXS1ddZxoMA8bdzknKPAaYJ4F5UafkMZXpLNRw1WKekecD+pKk607bo4s5sRqS
	 LaoKZ5jxCkgnN8mMPaSH0C/04bcHgRZcM4c5rYeXX1/L87UyowxQVp3dOEFzTOn0ZIYvH
	 eZZiZlCMiBhXkKpWb+/vpjchB2xHtyymuEQ4TGV6vQIE5zqSOyxtF4AUXXKp1wuXEDaZc
	 voQ9Q3XmLDL8yNIjY4HTzhlHanfHwC8XW8rWXOXVq6dOiOur/a9qrIwM43aRVuAamOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798285;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tPzq++25rZpLN7gnbHUwUk2EGIjC7lY29lr/l+RY2Hc=;
	b=XM2S3mo+c1QYm5eKr68gCx/zg3UJLV3pOYxwrEaB6jWoaKm5yKcBJ67uEExXmwafILGX
	 X6R+vcuvOrgKGq7Hj3SyA/RXQDyT8aHeo8gYtnzgpreohjGzvFa2PEdSpv5AmGFp4SyZO
	 NZeHWzcFrLH5o/LFXGBfdERvxZ/iza7Mw5VAhfyOihgmDJ0iMGoE90ovvyDDN0ndjZsiS
	 8cUqhd1vVGJFVEpy+ofMWBm9oU9AWYxnWACoNt3m4UQ/s1p+bMvnGXArSzxfYe2V9UCz0
	 OeAOQbZ1lxRedCPK4uonqupqOB0aTV3ElQjzlrz8BUitJ+GxYWeI7q+cVliiEqBpLvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oA3fbSvw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A55606A31C;
	Fri, 27 Nov 2026 16:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oA3fbSvw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795798285;
	b=T1S9/7BiS2gp7iEqwXg8aM7t3RbJkKV2C3/uWnTgY9vFf9ThhNadpOyPdNXkztb5MGgL
	 B859anEgIN76hXL8dlvloOZCPxWNwWjkUfjwR2dh5H3DN+1g+tqvlFwAxJCWzBMAasYDI
	 /NxrFXXIE6PRQ7z2u/LYZVkhtILZGyoyZRp5IZ/DG1Co61HRMIBgEAsnndRwgJCiSZA4C
	 2zEArmGD71EPEF7eOHCyua49ixNMiWed12XfZNWhtd51irKQ8sbIg6wWxYWnxilMUswbH
	 gJCsU1QL5NSUeb0kDiIswMbQwKp1ZMf+dRCNIWkANAd7pphZH8SOVDLt5EstJfWs86g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795798285;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tPzq++25rZpLN7gnbHUwUk2EGIjC7lY29lr/l+RY2Hc=;
	b=zbu+fSUQE88q8Q3/I6dPLUgF+sgB2go3lbCA+Pm4TyXe54iZIfPKAFyj234+1lMobbg6
	 Ij9fBKdBioK+83aNTWd1ML3p68bCCu7JprO2wI8t3dC8yNgGpfKfz0qCIZmbdRUDY8Ime
	 KDnWKfhjgUawX0FBcWnW7p4noXLvMqCId1NHaCRv9bgaLshJCjyv3YcHtFFBkhAiUvL46
	 NE3uiAX5R+WPw7ymS1Khs7/QK2ztrjzaXVO+vnunP6ULR0Gb+aUEVLeyengAOtUlkZ7d1
	 aHfZ3NrLmVCPN/TAd7J9JPFiual+u2yV50LOUZ27+vPrGsqSlJe4jXNcnFJ/ttxRZLw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA45A1F00897;
	Fri, 27 Nov 2026 16:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798285;
	bh=tPzq++25rZpLN7gnbHUwUk2EGIjC7lY29lr/l+RY2Hc=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=oA3fbSvw9MzIaoUjwMmU2DWreKl9XD/6p4okuGOoMm5qKocdkp656DEqu2XYySEa3
	 zCxArk6L8IzhlsFJye2VcgNE8EAKmnRPqNXKGtMKurx6xvBSqJ8MKb0kr6fcTZIf+i
	 LOnuZfk7+/YcHgXx5rTbH+rG/WeumIXvviwgsIYl8nrepSfFE5c2l8oaQ6tqVyRsAs
	 Fdz7pj0abS86T3WgNhXD20XmsaOMFwX5DdR++VW6a5IdU/y4NEwWkPwsgb58e/Mwtu
	 WPkVUFV/cBzN89rHTHzbSrHLsvIyhhyskfF3sBWh+lE2b09yxAYfVdVz/1EhH9/sD5
	 Z9aBYdTgRx3Fg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 69CAD4DCCD;
	Fri, 27 Nov 2026 16:51:21 +0000 (UTC)
From: Paul Sajna via B4 Relay <devnull+sajattack.postmarketos.org@kernel.org>
Date: Fri, 27 Nov 2026 09:51:14 -0700
Subject: [PATCH v2] arm64: dts: qcom: sdm845-lg-judyln: Drop qcom,te-source
 property
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
Message-Id: <20261127-judyln-panel-glitch-fix-v2-1-f47fd12a04d9@postmarketos.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7ZgORExceQ/DopQBRrFt2kIkh
 LtbuYB/937y398gchCOcCs2CLxIFGczlKcCzKjtwChdZihVWVMOPudunSx6bXnCYZJkRuzlg3S
 tSbVEF6oM5LUPnOvD/GgyjxKTC+txtNCv/e9cCAnZMFOvNLWVunsX01uHFycXzy4M0Oz7/gU/T
 Mz5xQAAAA==
X-Change-ID: 20261111-judyln-panel-glitch-fix-17610b11513c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Amir Dahan <system64fumo@tuta.io>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795798281; l=1790;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=QD858q0abRHms4/gLi2x4dtZ1gb3zWYst2XjfprddGA=;
 b=sxi2bspfe3pgmn1yvsCZD7dg/KW1GXBqTqovrrXDwD4TaUEaJRsLWe+03yfRGCEhvqC4wRGqV
 xvx1OTKrd3yCQgynZJ82mzl1cFWVlIU5544gmif09ApNmTSdVJmHPc6
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=ZFE/UBqiz9Wr8b+zBL27opOjw5x5ket5JFqks/VQGeM=
X-Endpoint-Received: by B4 Relay for sajattack@postmarketos.org/20250413
 with auth_id=1505
X-Original-From: Paul Sajna <sajattack@postmarketos.org>
Reply-To: sajattack@postmarketos.org
Content-Transfer-Encoding: 7bit

From: Paul Sajna <sajattack@postmarketos.org>

It was introduced without proper verification, and causes
graphical glitches on the display.

The default value of mdp_vsync_p is correct.

Fixes: c6c66aa3ef33 ("arm64: dts: qcom: sdm845-lg-judyln: Add display panel")

Reviewed-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
Changes in v2:
- Reword commit message
- Link to v1: https://lore.kernel.org/r/20261111-judyln-panel-glitch-fix-v1-1-ecee1f0a1b30@postmarketos.org

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Amir Dahan <system64fumo@tuta.io>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 349faa123ff1..e54e46a1a6dd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -111,7 +111,6 @@ &mdss_dsi0_phy {
 &mdss_dsi0_out {
 	data-lanes = <0 1 2 3>;
 	remote-endpoint = <&panel_in>;
-	qcom,te-source = "mdp_vsync_e";
 };
 
 &ibb {

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261111-judyln-panel-glitch-fix-17610b11513c

Best regards,
--  
Paul Sajna <sajattack@postmarketos.org>


