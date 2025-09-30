Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DAF217F55
	for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759242758; cv=none; b=R7sA7j96sWySWUVRcq11TapYnO/laAonu3YrxECEIRxZC3KapbMh1K+7GO2gSfI57UIKDNxDIRdzHK8MjPGKoXHxA1LJTHZVBPqUJhsiog+uZQVi+PcCQNlOp5ZWmhXSsXIUieVKBFTFDYRwH5x0xgykbdjgLRHS+cuKaZCrxHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759242758; c=relaxed/simple;
	bh=e33Ua60plf36TGZ8AqkpnW6fFz1iOr2OCUIOOUwqFxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IZmVBhGiZB0McUu4erzjDILFXWEYrgbplsIzJyu7bgcO6zDIVOl12sfcoH1REsy0xsO4GsX4NRhqgpXlvw39InlOSLLEpIoXyTOqvtegWCNv3FGj8AdnwshBkOXhe1/z8pnz84qhs1/Up95dtuI6yOvYh0l1VDah0zmCqSGs7L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4yngYK1t; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4yngYK1t"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6364eb29e74so4097662a12.0
        for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 07:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759242754; x=1759847554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIXFkHTmTBNdoxIiGuiXY5Mb/iVkGyXh19PiQ5Z7rqw=;
        b=4yngYK1txH4CiwIHx7cTJTv8qMwBRP5wznfEtNYWAAWxDTExd1ieTWuQvp6mcLkqpM
         Q15XYAZ7GtE9WzwWhtAfZj8bMt0LhuuzGnaQp5+1wiDkrqCa/6JzMPbJzz9FbTga/0qp
         9/j+2H9e3Ve9dSvHF4yiiIzrhXXZ06WUYVHO/DQb8rqIQ7tekvWttW9Y7MWbDQ1/1UBH
         2hM75zMfneGfyvsWApdPQxm1ph0QzFwnV8yT2gvICe94nU42aaTiMJK8KtUyThP+ZRUu
         Q4jIitb1SgPUZhJhErUejthTkwCO41lk20Y/v8KUxdFX61BDMAcxTQfgOiHo/jIgpUXb
         /FWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759242754; x=1759847554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIXFkHTmTBNdoxIiGuiXY5Mb/iVkGyXh19PiQ5Z7rqw=;
        b=sC9T2m1pgUUPUQLhu8ZC8ewbW0gmf+GAHzVQQOqVHabD2+9xeTLnOCYaP1sljn/PBO
         UYdvQckDG9ZILc9gFJN2MQiBTmDrRrpDQY/K2XYolyx6/bhg44JsYhzmkFTmYA1Ki3/X
         0i945ymFeBiF7feh6f0tRfm1olMa9Vk3gcY2pZJbf1HvAPeTD+v5jhf4toql5PUIYz1J
         NwTcd7KrMH+A8VAq5KgeaKTQgtjbT3TZ65FiYCZcar5RgUsHCZqZcaj6GXgqm6lBND9Q
         82q4a3TikX285hBiwGFtlZcV+DRFLexM5CfnX5VTBMijLFBte+1URVACywtJ/CxiPryD
         oI6A==
X-Forwarded-Encrypted: i=1; AJvYcCXWCBxNU4ysbZ04JUPfNEqQAk57it8P+pbzJ3CCY+nwtn6fL0RrWCwyGtsOXjljU/jYrbTcoyHewP7UbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3m9oTFb1OTz2tkNBLbDbMlXkMxfcNS2FAFMB/I5W+wi4xNdx3
	o7L9cb9JS7HmLMjzuD1lDyOKSWrOx81Ef9OZUVxu+qgmGSDgZ6qkHxjnRsVUgcjCVaQ=
X-Gm-Gg: ASbGncsMJpxEJQFAUCbCCN2VWLi80Nl9IHwQW6T9AiFEoMlE03L5BHNfd6IGOfHYpSp
	y+GaxzwJOVNFRSnMJVrq61u0WV9Napaa5o/hm++4nxhQirTP5jdZSWDAF5vKrCi4iTqngOFMbeo
	LJOQzaT3tDcDiiVAX/v1tn7FI1QjeS6CAoGXhQjKDexvHHvKk+qc8KbLtu6SE0fJhwXhQhms+I3
	LN4Ud29N+fYhgdJ+H8zBgVH1YKRgOvvEBtuGIZa6PxAJii8g19SxdOAop1bm0EJdGAhHeyUGXxn
	ak3/wCrEj8YtlmL9thK9fkIgEMRP7w1IGrunVt916YJgcuv5gpKgAdzZan9whs2oHg+WKqDOLqI
	AVKhVFhcNWcK0zIn5ti9LavbFyid8x3RytYS3IsFoeo0UuUZjEEh3bcVawb3fbR4ThvMJNMIXRJ
	qDS4I65df15doH4sSSXqufvRQBJpwh
X-Google-Smtp-Source: AGHT+IF4zIeQ3qsHZ3+7UkuA/aOdurdD1kBt+SKdxxprt50KcUOpEsL/VmP3CuG2akjIJLRWC6zMMQ==
X-Received: by 2002:a17:906:9b52:b0:b3e:1400:6cab with SMTP id a640c23a62f3a-b3e140077cemr768626066b.17.1759242754466;
        Tue, 30 Sep 2025 07:32:34 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3dc2cf61dbsm499858466b.29.2025.09.30.07.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 07:32:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 16:32:19 +0200
Subject: [PATCH 1/6] arm64: dts: qcom: qcm6490-shift-otter: Fix sorting and
 indentation
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-otter-further-bringup-v1-1-7fe66f653900@fairphone.com>
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
In-Reply-To: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759242752; l=1473;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=v6xz/ZGwlg/QGlKUsUnQN36bAJwH/12cvFwX4EAV52I=;
 b=i4zuAYPuetFXrwGGozmgWJMqu0/p6T19lPn9Mw22TYB9UCGPqRugYCz9/k18mXnwUbkTDkMGp
 /WXsZdhO6SYC/NFQ30eCPSEPTu8dCpDT+g2/wr3ktFUkmwsMCKeGG+V
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Alexander Martinz <amartinz@shiftphones.com>

Make sure the nodes are sorted correctly, and the indentation is
correct.

Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index eb8efba1b9dda422dd0295db2a52420a1a23d070..8d45e6ac0e445b9e20bb9c1520f804623c505653 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -857,7 +857,7 @@ &uart5 {
 &uart7 {
 	/delete-property/interrupts;
 	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
-			<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
+			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
 
 	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
 	pinctrl-names = "default", "sleep";
@@ -920,10 +920,6 @@ &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
-&usb_dp_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -950,6 +946,10 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
 &wifi {
 	qcom,calibration-variant = "SHIFTphone_8";
 

-- 
2.51.0

