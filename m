Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A74371899
	for <phone-devel@vger.kernel.org>; Thu,  7 May 2026 08:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142826; cv=none; b=ExJG08LZ/4pqSEEeovIZnBwFtgYMaLKM5gVf2jn0zvGFHk805LTp9y1RTtKID1JNcZxx4z1nt91A5rigoN+UHL0jY7TWFvwE1hd+JlGslvyf4/S9I+yLm5igYopoVltcP+vlFxR0kdDuWXR5qu5QGCFx6OCljY+13YHwdY40K9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142826; c=relaxed/simple;
	bh=hz+cNuphYh6KctNuqq/sr0jPhnDlQYgLMJefeaQQJQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KOKwF7VaIQd/rt4+HFoSp0i7pUexuGZRTfl+Ejzj3jxlHmFQocON6wBEr4GJBXQieiNsT8nzGSwqhbt4bxCSzj7fnSSyu2Lpgx5QgEh88F+qQ5krDvpOn6H3q35K6ai+rtJs+iqZ175uKMwUYXKVnUcsA/VWnFCxrqDSlp9j65Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQzrPws0; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQzrPws0"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7bd5e373d07so5229227b3.2
        for <phone-devel@vger.kernel.org>; Thu, 07 May 2026 01:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142821; x=1778747621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvsb4xAKNE4uvpqV7KegL5UeBwHdlxGrU0IdXDSSfC8=;
        b=cQzrPws0vQoL8Ol0o5jhHXB3lUmPUP+5BsXTh5gkChFo8TlyOyRJIpevwZE53SLlx3
         HqBKHB9ucdxVtNnuveD8zVoxO1qjzXhJ8mNpX72NOp2TmzOeSM3fFYRyOsGElbCJIFh1
         cUd5DSGympqBzL75EX5yICGhAm1YWxEOiwGWdF4a/16LDB5FvlpCdqgVDDK3TVlTdNfB
         lEmtFTWkTqxQTnml/mwOyIoQt6PZH2oOwJd3NXrQoVXWprDrXgZzee/Izz4QlQOtrQzH
         7bIFLcAShu3gLYjJDTRKCQaxIOgRGoiCI2Kk+7smkn0pcwKeZWmlwSprJRyAUMb28tb0
         tlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142821; x=1778747621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kvsb4xAKNE4uvpqV7KegL5UeBwHdlxGrU0IdXDSSfC8=;
        b=jB14T2o6fatjPepLJpniOjeQpDW0BkJcGXaT1IMOmQ24FdSfEgwtVqRZnmC68bQ+eo
         P5/RuqcbHQybIeNqPOLhWimSZ1q5qBIHKV+7FKJwg+KFedutLh50unb1H1ezcUsdPR6v
         azZPUfqjeGy5I5P6YLkCdYquOzxmc8jF79eQtghHcgKfmJuGkzWBpsvutKESbiywzC2b
         8LEzOu4OWX3VJwJNT44QSJS2Hmwrn54WCTzBo2qaIt15q+KWtcyR+sCoOQfZ0vdBfl6W
         vQ/yWfBf+X6olMD7CxwomTBdrABC34HKrFSVh0D/KzyEPcbu4D71tDlMk3BFzp2UJAIG
         kNHg==
X-Forwarded-Encrypted: i=1; AFNElJ8hrbaBsrd+f3ZiG9OMSmV3LgLxfnh81pheA8IUOfaTGTC9LzVQ1Lb14ruyzV75dCqE5SogxehrQmP5eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGlOChsO+WbUvYBO7LmykkT87bgIb+lMfMnkxPd/YzCc7cwy4K
	b+D/X1JYuTfzXrsWKhny3JwEdFzB+E8i2BYUUiMdag5SiXFNnB670u9/
X-Gm-Gg: Acq92OFi3j79fWHtTfQ9Xxlbve0tKavlzU3J+ROvsJCCUBY/EyuTGkTrvt6jFblcO9t
	IE1ffbaJOT6KAcpqKlGEvqlwN/k1qWkm5vpWf0Wguv5/plEHdkTB4LhM9RMiOAftL8R7iZwQbss
	fUdwCMtsU7wvUGPXlw4KQXhZnqrqy0AIk4h/Cqj0k9bPnPqrCeKSRv/g7d5CfSZTHp74b6JGX7D
	YWV61NmJMH7Zv5DwGqmH4mzAFxUKR0hrgX/YKGWYPXXXK1+mcwjZqmWWWgN/x8cap5KclqkI1bt
	PMVJ7K4rG5LWKNDcNiEj6wXDaHvMbd/hyZQDZYmvSlSLKtQPS1rDOJMFXFt2UDknwvPEOXPPVDp
	2z40lZYj3frJHxSptVZjOSxQk3NVB3CoVNJaiBCt501l2Yg8KNZ/wfPjZr8Riwlb+lojJJIXrEb
	XvVbAlEH7FV1BsDcg/RnYED8tUVNftGVrmhR+R9e1ZnkYUBaU=
X-Received: by 2002:a05:690c:38a:b0:7bf:f88:2e0f with SMTP id 00721157ae682-7bf0f88440cmr1443227b3.25.1778142821098;
        Thu, 07 May 2026 01:33:41 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:33:40 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:16 +0300
Subject: [PATCH v5 1/8] media: dt-bindings: venus: Add qcom,msm8939 schema
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260507-msm8939-venus-rfc-v5-1-d7b5ea2ce591@gmail.com>
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

Add a schema description for the Venus video decoder/encoder IP in
MSM8939.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
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

