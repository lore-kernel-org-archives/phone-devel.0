Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7640492528
	for <phone-devel@vger.kernel.org>; Tue, 19 May 2026 15:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203607; cv=none; b=ARfOczwnr+/spkvISG6vIHkypzhR8GdORyoKclvLy1OILrowDLJGjk3LvDMp/iKq0dkrWEAEfoJIPOg4oVzd+4QgaAyfd7H6ckqtD/yY9/l5LNyyxe5XIidrDm277cw97+smegJ9YzuiZUJKwboWioM97FWjFz29hEXPB7Wgk80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203607; c=relaxed/simple;
	bh=TT2eyoTRfzWA6wV6jKgNOxATiT/ULKEb5pDlKZbjQaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GtVd7X/hYMZXA4+0nbTGdrVxiM876wYbPVbJ5UJ3eY7EZDi1QDonltnYM5mwyRPuwpRqMcLsLIpxXBEPH84qxEVPGnBMNsX7KQWtyznjI+VJekcjtcqhMruO+NGx9hJB4VgUrQKVEwbYS9jq/0G3GsYAj5h60aHGM2WbDJshfeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/zXWLni; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/zXWLni"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67e43a8996fso4666079a12.0
        for <phone-devel@vger.kernel.org>; Tue, 19 May 2026 08:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203602; x=1779808402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIHp7+5MbvYuooU2HjgAc6OMaVGphWri9A/MKFD+YlI=;
        b=Q/zXWLni9zV7OZAPcMo02S2vSF9XxuEnymI7vZYI5xKmUdOmKsUbVqschmhe71tWvm
         1Evff57IDxnMJfPMzcoMgQouhzo39zj7gHCwwiadeIa+3NBdmqMCXVtiIC9UigIW3yOU
         oFKW6BvlDp00sfH81WM7ekTAkWPVfpadAsdnKBX3vDAWUCOLuiKkYXuurbPHkhRxSTDe
         p2UANpqA8PNDhtwUQwpePoFAEcKVpPHJTjFlLTm5GP+S5PdthtZIbkYVqTKXisUsZLT0
         hH1e9mMUP8lTdzWDSPmdrAWUeJXdD1B4OlGQVS7teuo9of2LlJJxDrU0phQE3+1pMZns
         Xd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203602; x=1779808402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LIHp7+5MbvYuooU2HjgAc6OMaVGphWri9A/MKFD+YlI=;
        b=VUccJ8T+1d6iwGu8vEzfplHg4/u8DcEghkuUwR7UQ/des4OwRuM4Tngre/BgJsCLKk
         Vac1uttX202tXOHDdFOSMHtScmPCdyY/kc3+YhC9OCuwB1JHglj1m6a8L+XJV2KTA5tX
         hxM5AMN+iLSmYYv4eGSQbECVGGTjE28M10p3TvckD0IfNFC+uoR6nZTpE6vNm+DUBxZr
         6ieF3syHjLIWBYjE7O2Z3K0cUVaP+ForshghRXOjyD1GmzxQS1Ul5Zc8EcrSm+n0AQTk
         NlVFe2dkmZhKaosMvS3kQNFFb+5nM2kGIgR/xwzcZytFJpV8FatrLGizBcw6K1sbjGW8
         bm6w==
X-Forwarded-Encrypted: i=1; AFNElJ9voeFKbjehGCphewOpx1l/eNpDLfHDX290idknLVTHvo5Tq8mLCOPHVSbm691r9hzKVMvj7H6QnEfkFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YweGYuxQyJyHP9wGEgP8O2E/uZWY8fLs+5eOHjmWJFNz/y+/eRy
	lTgMn5zskuPybbcMPgYTFDMbSqbNWjDvckJ+bzJh0ybJOhibDHktfMXW
X-Gm-Gg: Acq92OHsALGmZCYmb6S5CGzjPi3eAOjk2ld8W/eqWkos/+aqY5QLaZDlgQ3s3S7ym1j
	UwN48fSyH1pD93TaVZrboaq9OjRm9yVOjnZ9GLLqiNws2wD9pdyF1aWlhRVtaA7jWqRRM60qM2W
	sz0qhYgOSKHIkVfPgd4k2VUU4LnUQynSoKbtSuz60+nup2XHbkdMqWV48MR72hrT5K2Q56NSFtL
	zq/Qd5cbdAcU3BVFqjg/5uNOQDaTFatgrL9YiYznvez5TbQqfTg7dhJ/5AlVpUybsywaI2C9JnB
	pmSaAkhrhXuGI5DVThDTRN+9p48euo7x9PlBpjq3BpCj/FtSWFo2HdbBiHybHmjXfH+6Fr3M1dE
	/GU7y172Qptz+XWgpz0HwKaCHPeyiba7moBscxo1cKhRbxeZQAUmDWOcxduQOxBCmCFEyLqL4a8
	7LuoKbHsBkLarIZH2HdxjEFuy4Pg==
X-Received: by 2002:a05:6402:a583:20b0:676:9c6d:7448 with SMTP id 4fb4d7f45d1cf-683bd38a310mr7764909a12.22.1779203601809;
        Tue, 19 May 2026 08:13:21 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:20 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:46 +0300
Subject: [PATCH v8 1/9] media: dt-bindings: venus: Add qcom,msm8939 schema
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-msm8939-venus-rfc-v8-1-542ec7557ebc@gmail.com>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
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

