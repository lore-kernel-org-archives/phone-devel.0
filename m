Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84078313E34;
	Sun, 12 Jul 2026 03:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783825963; cv=none; b=VRXjVFVSWyQRgIUdz1bWCh+2KOG7xfubAXxtGbuNiRr4zjEyy4ecQ5XHpDrjxkLALftV2IL58woqms/hICjuSV6d6193+yDDPwkWHTJCgDvOzOtOE3qoHUCNdtdi342gqjjfOeXpsJH4pP8bcpRxv+jUbrIU6KYTjE8Ddqn6PVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783825963; c=relaxed/simple;
	bh=540jWl1AxpLCfe0j/auVKISieH2sqdBaIOXvTByk7sM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iOe7QVMmhathC++X/cmKQMMAqGi4HxQKIPE5Z5t5PHJ3nttmzYeZXT9zafaTQdZ0djGBor7+LWifA3nR3fTt+KsYf3/pakNk+iqYrza1WhDMctr9bwJ+toLOQz/jWXFaCzDmfMMp+/rMHkd+i2WltB0djDWT3rFNToplvl5TugY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0w6p5Mm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0w6p5Mm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B22AC2BCF5;
	Sun, 12 Jul 2026 03:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783825963;
	bh=540jWl1AxpLCfe0j/auVKISieH2sqdBaIOXvTByk7sM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U0w6p5MmJhBdPiheMaAfyhtqNknVOb/SjAMFdYCHIXBOhk0lU6JKGuvqP0lV/yeao
	 2twPxTjZTCHmouLtgFI7hEa8Isjz12nkl0gPpSw0TNIZc+NV1AlB97PrrLD+Y624Vb
	 pnuRPFZHZnoihXPDpfWxbiExJCt3ytGuWwPCrfP9cYS4IkHeTTvWZ5jKR2cA31uWt1
	 u9dSMJ3nXAXgO2AKXNQ3OYeFFIU5GZO331k3mulBnRQ3M+NYJqSw6gNk9jAe/g5Ssg
	 7S2DchDAPHiVuXBKcFMup3Cl33UmJxqh4MMItv4JlvbYxVb1aspGYtzcEfBaZqROzE
	 G/DSFzSg1OPdg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE91C44507;
	Sun, 12 Jul 2026 03:12:43 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Sat, 11 Jul 2026 23:12:28 -0400
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8450: Add mode-switch property
 to qmpphy
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-sm8450-qol-dts-v2-2-5eb2e86468c5@proton.me>
References: <20260711-sm8450-qol-dts-v2-0-5eb2e86468c5@proton.me>
In-Reply-To: <20260711-sm8450-qol-dts-v2-0-5eb2e86468c5@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783825961; l=627;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=/uZn04C0kV47S2j5bmHfyQGfe1zYRTmHGF4aZTBxrpI=;
 b=0y+nRtRBoDAdvBLUykNBy/aaD/2cK4MgWbAcUDXX1FBWEBEkayA70cmwmjrhkqyVEE5QTrFoZ
 M85G6G3cnffCQprIRLZYg6/s3Xyay/K6IVkNlb3R4vMC3c/7sGLBWam
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

USB QMP PHY is a possible handler of altmode switching, so add this
property.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index cf7c8f831fb0..e51babc1cf7a 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2654,6 +2654,7 @@ usb_1_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
 			orientation-switch;
 
 			status = "disabled";

-- 
2.55.0


