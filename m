Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE7B3F86FE
	for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802299; cv=none; b=sWm8Cd6ugdOXJWXtW92pw35JYVlbNicCK+DvEsj3EW6farVumw9qIMlJIfFjtv/rrAx/e4cPO1ceIhT6zjdPeosuWYm8yjMmUDXt7QMyHnL35R/ptmV3YL0H5ZVL+n0LYQpHXywpPTeEE+J/E4LAFXLZe2df4a/DcGZKfYg++bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802299; c=relaxed/simple;
	bh=TT2eyoTRfzWA6wV6jKgNOxATiT/ULKEb5pDlKZbjQaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NN2FC3cCx1wWanEjyd2k3cMlaEAjmU2t7y3WcyXNOoOHQONeSD/CEjtL9Vu3QsoPi2UjZy/xF6ivFUayEdx/rgbWBWV6rkl7JNYySGfRk1Q7rY8S1N6QmIqj8JEr9M2N9UjESDjhDQ1VHJSU3NMlfXAeqP/Hdjpo2N87XyW8qDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2SAPNrc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2SAPNrc"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4904c1ce4c1so42511595e9.3
        for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802294; x=1780407094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIHp7+5MbvYuooU2HjgAc6OMaVGphWri9A/MKFD+YlI=;
        b=K2SAPNrcWjwcHM53Km6lRgGSLgVVXV+Ebo7NwYY4otcgvghtjG4MeyZD/gCJlxU2eQ
         HEmUfJ5gxmcIScHh75y8DdMEP0KY/FJdlz1oIYdAZ4wp8SGCfsUiMY4VpaZftV4Dngnj
         D4SsK1QnNis9RiUZHkNzgyFK1QFC6PJdbsPTAs8Hh0bOo/RENtgmiwAO6KmPWHjww7T0
         QB6sbY9phyFUwjE61x/mcZIK0MvTJoVEItd4IE4IWBkiybNskeZbkPmfzTpHX+1O+MJ/
         YginCyy1rC8gljIpnPJF/xtsyUVOXI8J43tfBcFiCa5oFJ/QErFajrxTJGl2uG6/VKaP
         +iTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802294; x=1780407094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LIHp7+5MbvYuooU2HjgAc6OMaVGphWri9A/MKFD+YlI=;
        b=G+CIQnR9cD0sZ3muJmQ9Idoht5pgU/MYbiNJU8K1KEup0NcW+7otXgB0y2vK4DOfvO
         Auxl05T+PdPv2Ltdf9RCEAH/P8iFW/0GbeoSiuYrX9q7/ozTW2hmPcsIoOcCbApnqG1Q
         QG2nYuRqxIEsmkhCsOFMNtSpo0bHzSmjwFByDkF3txE/7Ksxx0oQsxa2tG8keEccfDCN
         R2LDQ6uEyklt9Cs6aglNu2sOmIkleK+DK0+lNqSCkERtiXlPjewE/qeCxhrTyTFZyDxf
         Jm66rMkO8g6+Ik7DwsCWLyA5Y5Z7W/eAGdMnz3iOEAw+qUc+vZlPf3dWdWkHHZXxtd+G
         aijw==
X-Forwarded-Encrypted: i=1; AFNElJ8X16hrzTK7+18hRWwlTcFC5nxfTDYU5+VdaFT00G5dABZjWxdUTqyayf1drJnjjEWRPap/KsMLoZCISw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRQyskh4IK/e9oTQTVFrBoawM/X2EvtjRYTZnEqKc1ZmgDq7QN
	zKYcko0X1FzHXOqGHKUCEzI5VsrExYpnnjlPPg4bjkOiT9av1OgzOeyP
X-Gm-Gg: Acq92OH9VAmUHozHraisb0cCyboC4AyAkFavnOF+PU1sAfhj33r3YuyntjD5V2p5xkV
	5TtS/gGvCHbRsXXhYSKcQa4fu7hNznFfAGq7YXO71kfqCZvNlFvt9LagXyHcsSLGaHtCWUId0hB
	RcKAum0aiHhAf+keprR0Y3B9KVlIkXnXwZ2LQ+xFCBQHi0mtMl32QI/JYJTjEryLVqFxK3kcRLN
	ZopjtydEcYX1g8hLIatYY9Kq6WRIxVT4LIlC8r2K1ko8OHDFhfd5ai/lOP3Q4i22czSZ94uSWQk
	ym3UVziIFo0NGwZpjWE9qJk7DXoLBCxgdkHTxF5EFt0X9RXkhiXKRK5YTAHJSfwQfQWDK81+tBd
	2VBS+vRtoQH5jLPeoiTxygaO1YvV7KdHjiabF16HjbN53JIs4ym/Y9is9gJD2wcSxydDAAxhi+q
	YyEHjEIACmHTiGxeMLIjzeQPEDuQ==
X-Received: by 2002:a05:600c:468a:b0:490:3d62:f5df with SMTP id 5b1f17b1804b1-490428e5a6amr320764595e9.30.1779802293866;
        Tue, 26 May 2026 06:31:33 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:33 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:24 +0300
Subject: [PATCH v9 1/8] media: dt-bindings: venus: Add qcom,msm8939 schema
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-msm8939-venus-rfc-v9-1-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
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
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add a schema description for the Venus video decoder/encoder IP in
MSM8939.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 .../bindings/media/qcom,msm8939-venus.yaml         | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
new file mode 100644
index 000000000000..10a50a410748
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,msm8939-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8939 Venus video encode and decode accelerators
+
+maintainers:
+  - André Apitzsch <git@apitzsch.eu>
+  - Erikas Bitovtas <xerikasxx@gmail.com>
+
+description:
+  The Venus IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,msm8939-venus
+
+  power-domains:
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: vcodec1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: vcodec0_core
+      - const: vcodec1_core
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - iommus
+  - power-domain-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
+
+    video-codec@1d00000 {
+      compatible = "qcom,msm8939-venus";
+      reg = <0x01d00000 0xff000>;
+      interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+               <&gcc GCC_VENUS0_AHB_CLK>,
+               <&gcc GCC_VENUS0_AXI_CLK>,
+               <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+               <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+      clock-names = "core",
+                    "iface",
+                    "bus",
+                    "vcodec0_core",
+                    "vcodec1_core";
+      power-domains = <&gcc VENUS_GDSC>,
+                      <&gcc VENUS_CORE0_GDSC>,
+                      <&gcc VENUS_CORE1_GDSC>;
+      power-domain-names = "venus", "vcodec0", "vcodec1";
+      iommus = <&apps_iommu 5>;
+      memory-region = <&venus_mem>;
+    };

-- 
2.54.0

