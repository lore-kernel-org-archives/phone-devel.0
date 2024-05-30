Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E81117D8B1
	for <phone-devel@vger.kernel.org>; Thu, 30 May 2024 15:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717081578; cv=none; b=gvrA9pwFgjitOA4qfyWcX3QknLtnJYlx/xDqIj/d52hLojRMiSLhPTfbIMvJ9uDo4bmUBw2PCZeHSO6eu9vbiKZqZT0h7Uzdrk1kCqlRc5RuVJp8fShtAL8wBrcu8qO+IPDhRES3Xs40P62JeLk5lU5Ol9Sg36B84RdRU1Lb+BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717081578; c=relaxed/simple;
	bh=GO53uI6GUbwjaW8cPhjYVSZiLvFTBXg7wMm8WUSxda8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CCPgkRZh6gJ0sizw0PaVmPoVQ0FjyRWofibweHZzNU0gerLstjRZ1kDlbfRsdhjBV8sQeqd9HEHz2Bhw60rc4awWRN6HW64N6QTSqya2P4WPj+mGZuorrPR4NFhpYmjZeky4fUXG06gLifp9xchzHnLfMzXHGub1d8R1MuXKwc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=aUwZM3OV; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="aUwZM3OV"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57a1fe639a5so868701a12.1
        for <phone-devel@vger.kernel.org>; Thu, 30 May 2024 08:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1717081575; x=1717686375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnQFmGhNvzydRfpbiP3XVw/UozOoI6Olw9DBXg7NZ5A=;
        b=aUwZM3OVIGiEOYv40kXCLtxUHPUG5cLuIG7KXEoUSjM1RmnRge/v5BhYuWRqZOPHUo
         iXyS0dCblYzg1O59IL7QQZUY2iFdjM2r09uYGJPvepXFyIhuk8BxyEukr2dNTuYyWCic
         bfTlVbsc4nBOA6m1/4FyAbJzANG/Pmk/ItdJRCPXQss9usHQvn63pDZ75aCUckNv6p9t
         oEkdkMfMm7GFlP8a9zS4PbjT32Xzpy7r1rJnTTZd2EvSQ1riOYfAX3CE4hsCCsXokfEL
         VwvY67TDf14uMVvNm9mCkc+a+tXgaEqrwhkAA3yfYdMSARqXyYcKTA7qbfldHML9fEhZ
         rFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717081575; x=1717686375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnQFmGhNvzydRfpbiP3XVw/UozOoI6Olw9DBXg7NZ5A=;
        b=X1lK2yu+rkOBnAErPs2OozctY0HX7O10gFEZbsYYO18yWAH9zUM9SoSJE3SjHsGW1h
         koUPVkuzo+sA90VCBeLVmXll92P7/853PHA8QmP+kCnRRhKqP8IhcqlMrYDUcoL1INe8
         FtdyJgSQxenA0c08k62NpVKIOn0cX8pxkUdffCDAyZS/29ONqqm5uoF9Tn/4Fm6V69oj
         arfXa+Dcgx1NUkS7uonI7JnFEuPW6R0nDlRLkxwmCWr0OtqXkVens+xuwA55V25dm86k
         l1r0bTztOVDGhCJBlsjorrhMKSIajvHI85f7iiTExDdYIrmPisuhGgWZOFt9dytvi+xv
         ZKAw==
X-Forwarded-Encrypted: i=1; AJvYcCX3ukk7GD+XeANUQ1gCoTWy6nxVSnluwIEPWOm5SoQmPYoNwxyc/xXeLKEZ9oknXCbQ+/kULb4bd8IrrhAihjF+w0Uf/B5rAKvzvas=
X-Gm-Message-State: AOJu0Yy5PFNAn4w6TC4+RFvvD+TyczSC0VJI4oMo17lywZOl80vfAkA3
	stNdJr+dOcTp6k4Gn2zADwDXUsnwjVfh8V1ec088EPBiibYntDQGPaEZjRHJDuk=
X-Google-Smtp-Source: AGHT+IHBv+u67ofhYHZYMyXJnaNkoyAVZQqwsp7v4/MrGjYuiauM2L/f+UvdpmMs40e+H+xC8NG6Gg==
X-Received: by 2002:a17:906:4913:b0:a67:403a:4bf0 with SMTP id a640c23a62f3a-a67403a4d73mr30681166b.3.1717081574410;
        Thu, 30 May 2024 08:06:14 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67430f8457sm13531066b.122.2024.05.30.08.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 08:06:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 30 May 2024 17:05:48 +0200
Subject: [PATCH v3 2/3] arm64: dts: qcom: pm7250b: Add a TCPM description
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-fp4-tcpm-v3-2-612d4bbd5e09@fairphone.com>
References: <20240530-fp4-tcpm-v3-0-612d4bbd5e09@fairphone.com>
In-Reply-To: <20240530-fp4-tcpm-v3-0-612d4bbd5e09@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13.0

Type-C port management functionality lives inside of the PMIC block on
pm7250b.

The Type-C port management logic controls orientation detection,
vbus/vconn sense and to send/receive Type-C Power Domain messages.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 4faed25a787f..7dc7262f1537 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -51,6 +51,46 @@ pm7250b_vbus: usb-vbus-regulator@1100 {
 			status = "disabled";
 		};
 
+		pm7250b_typec: typec@1500 {
+			compatible = "qcom,pm7250b-typec", "qcom,pm8150b-typec";
+			reg = <0x1500>,
+			      <0x1700>;
+			interrupts = <PM7250B_SID 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
+				     <PM7250B_SID 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
+				     <PM7250B_SID 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
+				     <PM7250B_SID 0x15 0x07 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x00 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x01 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x02 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x03 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x04 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x05 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x06 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x17 0x07 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "or-rid-detect-change",
+					  "vpd-detect",
+					  "cc-state-change",
+					  "vconn-oc",
+					  "vbus-change",
+					  "attach-detach",
+					  "legacy-cable-detect",
+					  "try-snk-src-detect",
+					  "sig-tx",
+					  "sig-rx",
+					  "msg-tx",
+					  "msg-rx",
+					  "msg-tx-failed",
+					  "msg-tx-discarded",
+					  "msg-rx-discarded",
+					  "fr-swap";
+			vdd-vbus-supply = <&pm7250b_vbus>;
+			status = "disabled";
+		};
+
 		pm7250b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;

-- 
2.45.1

