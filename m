Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E706C371D16
	for <phone-devel@vger.kernel.org>; Thu,  7 May 2026 08:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142832; cv=none; b=dfFcX2IqfwpKi9/V/PupAoYroQNJKfZsX4FHzlZtwbHoG8zwHKGaLsv1+T9vQrwoFUiQeiDNk+tU3xVqG63qmKgapDsUaavANudnZAGmu0vCiOsIQzYo/+Its6n1iFmAsCTLzdAIhi3CUaePVNXX7BLjoc1cd8RuqBRjGm2LvOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142832; c=relaxed/simple;
	bh=lEdP/gLqj9JlLEHbjI0fI3boaFBdOzlJrficJFhY4hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NSwc584mgwoczVOgVH+4fhL4scxVaiPX9BPQcrtbpO34075XzOJ6OTdKTo6WU3vwCLZK78SHZaToETjzusVdGmIHjwEc2xGJVpw2daTwKhjBqRuRdAUg6BR6xge5BvOsSq8cyeC1XgedFjLO4uiN+s2nnCqXpyanigMw26AQyOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBqjBGGO; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBqjBGGO"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7bd4c61765dso5637237b3.3
        for <phone-devel@vger.kernel.org>; Thu, 07 May 2026 01:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142828; x=1778747628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zxu6jfb8KQTr4q0ip95qIz9W/TDOwx+LsiVMhFYa06k=;
        b=cBqjBGGO6W5rgXKaRMmJV26oGDFrVsbVIffDclAXGQKRzf/zQP+AZm1Xg6xbm6eb6N
         nGtDrhc3hlZSw3o8k3yspUaz8wLJ/RIEMmZo4JBgMVXyCqPZd0Jkk+twoCAej50EH/6G
         vLR8Ly262PRKAYJHgnVoy4La7kJ30XE9QnoVsuJw/Ihv+boEwfD51q+uNOrVw9Bcas2U
         qBG7F8ZIHStyTBECem7Qcqq4fv/RBj+7u2/NeMBIWBnNdpeOaRDzD4lfNN40ZGHu863u
         vgHpzHeeGncq+ZciTs8R3PoZVyLYreFyJrENZEPFUIRjP1zhusT1jzHGif7I+tQCxnCN
         vEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142828; x=1778747628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zxu6jfb8KQTr4q0ip95qIz9W/TDOwx+LsiVMhFYa06k=;
        b=roU2rPZGRrnSV2wuIt3k/dn12n2lVyHeMdmIQtrbatwUwxZ3q0yKpbjwzqne3jMisL
         Hr8MQoWpo6pcJ7PSBERB96q1Aj6e45qMHXqN/1V/29B2sMKhrH6oFrNshk7YEpDwKsB0
         80u75ocdU1ixcD9diQQwgETA7+aw2Vx04+yj6q0azQkT7uvKsUn0xsdGhymIMgv5ow3X
         /4sW30LFeGLtbWTulWJtYb97lLBPXQWzGxFc8JPYEe5Jy0yYTVAf39zygJbhPQLq2lZe
         RvKt8w41wIfLYus34RjGq5taas+PxEENCMBVKhxhX0bEd98RFRaWTEP3J4bPc5igOVwu
         1oew==
X-Forwarded-Encrypted: i=1; AFNElJ8rbwVGlrYSPNsDkBtYlmu1LkyG+rYhnVpUP6uCcLbBtfXyXtKsuoqoXvqP7WNIKdMdhESsCwHGkwvMyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUt+Ouhzzp9ljTGTuwQ/PT6SS6ABsiPb/oUxjd/LDfeLE9XOza
	+uItz2QOEvPsjFn5ntACdAi7ZV3MRtoQKuicuGS6JniOVgfLyLEhsCmh
X-Gm-Gg: AeBDiesnwy4APWtAdJtgC/iiRF4oEhLrEnJUfuA/+V77K6KFg94/nGb7Unun1hunvvO
	aNSfEmXTAS48raxr6m+LB3dr3G8038b64aqTaqoPZ+9rde3p8QSeHmQ3qKnMlU3jNyJRamcFf9M
	9vMgkXQyIoDYf5FLDh4Ucd3tLA3v8I5hdfRE6j8VA87KP0KHIlJSbSdRtWHeweAQ/Bb1p/yQT0s
	CdA4TX+4nU1686yQjS6txKNk9B7W9DhwFl/zUxtqp8xVSy+DBwQ6DvtIyPw0MHJzQnOuQpP9aBK
	HhmjyX/WhGky7S36R6dGvSeL0BeAfKVsD6VdJ4vJMVK7COj7isE3pDp922J/8321QQ3FK3XfXkb
	cMHIMZYGX9UcvNkb3w8E/WHX/p8OJ0GjWwoXOdpnV0RkKPSfh5yjek8Oq6GRCaUlB+9LogoDRH4
	DB6UFP8XhFIOzXi0jpe65a1zOmMND/FNDdsF8tS3fd56DxlEc=
X-Received: by 2002:a05:690c:5c0f:b0:7bd:9391:b5ca with SMTP id 00721157ae682-7bdf5e7c904mr68027307b3.30.1778142827969;
        Thu, 07 May 2026 01:33:47 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:33:46 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:17 +0300
Subject: [PATCH v5 2/8] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260507-msm8939-venus-rfc-v5-2-d7b5ea2ce591@gmail.com>
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
In-Reply-To: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..71e22584a46b 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,29 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>,
+				 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "vcodec0_core",
+				      "vcodec1_core";
+			power-domains = <&gcc VENUS_GDSC>,
+					<&gcc VENUS_CORE0_GDSC>,
+					<&gcc VENUS_CORE1_GDSC>;
+			power-domain-names = "venus", "vcodec0", "vcodec1";
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.54.0

