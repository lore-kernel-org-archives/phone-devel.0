Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605F127BF6C
	for <phone-devel@vger.kernel.org>; Fri,  7 Nov 2025 16:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762531739; cv=none; b=D83mdgpbjCqAUY5zQfRl+Se5lMUzhdSsHWXLTyhX4b1UmG7Yg4wpVB7O33ZQJtHdnruGrt8a5RX8kvPaGcT2vJFz+4/1kPsqpkDhLQ3SoJJSCA3pfTuTKTQvPh+Z2BkCToZIcw+qNREledFwtIuJz72FlraY3tFoiLNPBFIlR/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762531739; c=relaxed/simple;
	bh=i/zVTdeMZ54Xl+f6Uuj7idYd+OZeYrqPQPp6jVP3UlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I8DfXI42R/dCaKt7lWGk4MB060GPAo5vQpzUk9K1jw/0zP6YKhS8U2dPp8Nt9XtIRavw+QkPxZ2qD+1T6F5JFsOxUC4lm+MbwNzD5KzSU7yzA48yp9Qwspyv7Rn9t1spb+5XeyPYc09VngURde1m/OljarF4C2VWUikav4PtisU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=A0pxNnp/; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="A0pxNnp/"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so1568910a12.0
        for <phone-devel@vger.kernel.org>; Fri, 07 Nov 2025 08:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1762531734; x=1763136534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMnJBfQ+JcAHBt+A0k4m4Y2IWS16rpzOGX2Y0e5bHG0=;
        b=A0pxNnp/5WoH3GCQwqTypCgkx/ftR3V6uYuZG23OoewFUrog4QRkT8WGTck6SkEn3o
         +wiiueXb+ZXDYSJS2JBDtxD39l6hV+DSrMbU9niMexVU+Sbik5O4aKfj6WjGNI0uADQA
         pa1VmeiJaY/rLXYvbr9M4ttrHX9OCRqCvwHXlrD97sP8fAgyiOIwQo9y/zsldIfdxwXB
         +luWsqsA73E6z4WaI6MSu79KD0u8SA2RZiwmesoGtabfIJa/IBKZNayXopc7RCS8WlFo
         DvBFZSYlx7QLHtMZpnAltzVrQvwa35B/K9oKou4aMedo0TSD0HM4FW/8Is969McL1GBi
         7Dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762531734; x=1763136534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WMnJBfQ+JcAHBt+A0k4m4Y2IWS16rpzOGX2Y0e5bHG0=;
        b=Nyb+gJXcBWPClcNJbLT5+j0baUqARGDrYspfDlUR2Hm+uI9PS5LPPIj7RrX2AvCc4b
         Bw6orq04cHdHYXjFIQUMRifdcwHim1jJ4wujrHJys2nmBOlQKPw8uLPffruBHjsOG+LP
         vp6aFvjptXfuL/rS7FH9X/z50n10UBUud6gUD5diQ30Jkz+I/kOFlwukQDVOOj/JqKSn
         cab7ZKfktz1gnsmI67jnWqF5X3fKZzezmAGhF8DGVtzbkV7mqC2dUK9iXSSqzstR4NkV
         IMF9QQWgmJfw2wVBETfqbDTWhDwcaANpdQfqXyMYEWDrXgeFjOYQmIlSdphKWs9lvDyM
         XG7w==
X-Forwarded-Encrypted: i=1; AJvYcCWLqISw4uQAdevn1vrHEW4yM4nm9mIb+WPeoDH4dsV5QJguYivxyOuRsv9L/WsOLvTzUZJ5NIy71syjrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx30nemcoqmYgGjFuYORII0M6FHfnk3VWFKIBusoXBElzS6OnQO
	xPJBdbq8P1Y0MTDGgbH/PKb6YnplnDSoCxa984kkv4R+btj8RFYlDBg8/GYZtqiK/dk=
X-Gm-Gg: ASbGncuvQnE9RDpaVZEq6rUTzK2S/Kn0vJJTLqrIwl+uBwhbJ4fAj6ekws5qTK3pM1B
	LIdvVwq6GMJowbFePTzaxrkjxBMqdQoXKnksWKh+B9x7+ZUlbyHmeAasNYwl/lDpHLzsWbV8IFq
	ikF3MosWIb8Voj/Eyxecq0upEPFSsCrRSzgUrfHrx6FjNQWA6pDn6qdOR3IdTyI6bedrEV8SXuS
	aZNg9Fd08s/bTi0h5dBBC9JCNVjAhcv7zlAQZrceyX03xw0SG/m7b4Qikvp8o3olLEwSiWQZo+f
	7LhdlhU6oUAV1XU9cZvoBif4Tj7lOg/aupMMnNhRl3Xt//MzCQEQmaPm2Z3tw4jN5BG4h/gGk6Q
	JObRFYdfZXRELX+4a0l/m6TWlUtuNGSXCIu7yIhz9FhYOOOsLqE58sSAgIN1EEI/+APadZSxXJU
	s5BZyoREIc7DksUbxrnQkjA+t70Ex1YCFtz2ohbaniwsynszByUWhDCg/LGYbwud8LpQ==
X-Google-Smtp-Source: AGHT+IEGN1YqULo6BeVvW1SEuQeF0QBYa7kxAWMnbouxC/PnpzFufbpWQvOCzdHSkpyFakInFAEjXg==
X-Received: by 2002:a05:6402:2793:b0:640:b9c5:8c7b with SMTP id 4fb4d7f45d1cf-6413ef033efmr3827798a12.15.1762531733607;
        Fri, 07 Nov 2025 08:08:53 -0800 (PST)
Received: from [172.16.220.100] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f713959sm4444376a12.5.2025.11.07.08.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:08:53 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 07 Nov 2025 17:08:51 +0100
Subject: [PATCH 5/5] arm64: dts: qcom: sm6350: Add clocks for aggre1 &
 aggre2 NoC
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-sm6350-icc-qos-v1-5-8275e5fc3f61@fairphone.com>
References: <20251107-sm6350-icc-qos-v1-0-8275e5fc3f61@fairphone.com>
In-Reply-To: <20251107-sm6350-icc-qos-v1-0-8275e5fc3f61@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762531729; l=1111;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=i/zVTdeMZ54Xl+f6Uuj7idYd+OZeYrqPQPp6jVP3UlU=;
 b=PiC3z4QTLZs98rmiEeLKQeKe7Tx7B7T3YjwsMCoa58NO85pAHVrafZ7ofCkKZne2/b+dgR8Da
 6rRb2VnmUQmA7T9eGbSGozCVKcu3EOy/cmKQgdC5w3MldBXuk2dh1z8
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

As per updated bindings, add the clocks for those two interconnects,
which are required to set up QoS correctly.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 0c9dc596aa2b..c9a812bc256b 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1117,6 +1117,7 @@ aggre1_noc: interconnect@16e0000 {
 			reg = <0x0 0x016e0000 0x0 0x15080>;
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
+			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>;
 		};
 
 		aggre2_noc: interconnect@1700000 {
@@ -1124,6 +1125,8 @@ aggre2_noc: interconnect@1700000 {
 			reg = <0x0 0x01700000 0x0 0x1f880>;
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
+			clocks = <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&rpmhcc RPMH_IPA_CLK>;
 
 			compute_noc: interconnect-compute-noc {
 				compatible = "qcom,sm6350-compute-noc";

-- 
2.51.2

