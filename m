Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF5937C0EC
	for <phone-devel@vger.kernel.org>; Sun, 10 May 2026 09:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406475; cv=none; b=NagRFfK3X+uyz5MX0BfGZPtbWtiIx/l9wiyz1IToYR1R627uKVeUHVogwQ4hEPeT7OgItLj935bogmuOZw/AOJXRBb5PsOuPOT/CMTMyifKhWFkwzH3ykfZgr8UKKGfTUGAE9QnUk7O73WfJ78cOJv9Ut47gn1CV04V9vxxOj44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406475; c=relaxed/simple;
	bh=0YOIeEfM7VyMCOce1KEss0Hecntxk+HxQDlZl2XCTRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rvALn24RjFo9B3OmspOox5Tj1pDrZbpli1IrANrJ1FoUr6uhjRzA2NnspkjUQEr0sLyaoydDYejQi05rh9d5pJ+HUzygRmIfZtYenQZbuBhEilX0mn5mgfVRqc/3/moeWelZiYa2O5N2gjkainebZv6/uLGH4l2qdguB//c6MI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bv2N9VLl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bv2N9VLl"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48d146705b4so41252455e9.3
        for <phone-devel@vger.kernel.org>; Sun, 10 May 2026 02:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406472; x=1779011272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cJlB+8b3x/3rtxKDJ9m4uDjdrOStGjNFVxlZruzgDE=;
        b=bv2N9VLllYYGoUjktdwyhydbEnLd002Q2QI0nmjeS4n/pg8U9Fhmza/0QP9gTa52T7
         dsAoy4Vq2o5h7HW83aHNv82kjReEkEv0uWLue1p87JB4CCKRZyPjG1rJ0+yMW/cU+2Mx
         A0ohPovFEwxID323ugcgTQFkoJScL257m2ulxzMJNoqRTOsuiDLO5BQPeE8z7X+A/yeU
         wSzZSGTlILEumjM6LKJD8oL/OZUzcqgkPjrW4c5w4Y9+8sFOouOWCBLxMO/M+RIHT7st
         qr/0Ju4c89O06+RkNBZ8c8EvNEU43j/J+mOM9e98tbdpoks4I3iImJm9r0ciotzefLYS
         Lvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406472; x=1779011272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/cJlB+8b3x/3rtxKDJ9m4uDjdrOStGjNFVxlZruzgDE=;
        b=l9BZhqeocaTeGDVnO5I6co4WwegQ+88a8EjBTmPS5mWKblNlmvhb/34Ee1cUIHLDU6
         +DgWJ4/IUwdrK/Xz0XBUMYF2jcs0mVgW115Cp0XTLf948MlzoxNP/NqRgUlyQGCcugtq
         6HFCZ0YbnJY1QsmRv4dbIhEaZpl+LHPUPBRF6sEC/Vt3//oI19gnLXeZXP7F1DJmHIFQ
         VyNzvO7CAGtTnNmttP6KWxRzvpZWuZENS391ItV0wvuGvHSY41Z9+gZ/KK+7pvIVAP2B
         s6L1uKZOG/m39noWJCzQ1fUVLKumXX+nlhaxEw8+uaNojhtfC+EVte0+TcGiho1E0PQA
         wctQ==
X-Forwarded-Encrypted: i=1; AFNElJ9N75kug1tekXd63wyaX4mwvqgtHQjemFbF4u8XU/hDCYSmyRIah8KbVuM7bsAPd5VfwiOsBtzfxI9Ucg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPH1PjOvui7oXBzYAaLbYL3GSVJmfrvZ+xqv4J+yTF7ZZ2pXrX
	/nKGe1TH17yxLphrOrCcKN/doQoyXXw6CfdoGuUvyCKjJ7vanmn+PSqK
X-Gm-Gg: Acq92OFPMQUORpzZYD4K5c2W5ssogYR7z3vvcWg5HsqPD8Gbe/82GEayDzyqzSUvv8u
	kWw4JqRaPx6pBY0WDgsgRG+hJl6Vd+ISQrWCW2hy4hkY0HTYkeipgFvCDTRHpadFT0iOLSKpxF7
	1CJM45h6LWLAS/DFzhyHJlY2hPHt1NG8J/X9k9bkziJImriIwgRa4UgHC68Y1Mw2/Uj7ZYrF6Vi
	IfJ18PA4knU8Ql+RqjY70vZ+He3p2JjM5KlmOgKDUmgOfRBfevviCJZKzhwy8PjJhHUvBkIaNMC
	dd7Y+7q7h77Uh+vRJkVI+QGsLmZFM6zxFOJIrkd9vcdpkT2bSE5yeNwgvc4kyiJvxzVpeAvVtMl
	KsvyedJx+/kR+nOmV6FVrPuZfBoY+7z0ZMk9EGM6qdQR+BrW9UIudMny8kuG/rGLghlsrlg8wZz
	W+lR0vuWunn+HroQ8eKkStALEcsAmkkOWg4QBCOfE=
X-Received: by 2002:a05:600c:c494:b0:48a:592c:e632 with SMTP id 5b1f17b1804b1-48e51f42760mr305708305e9.16.1778406472049;
        Sun, 10 May 2026 02:47:52 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:47:51 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:39 +0300
Subject: [PATCH v6 1/8] media: dt-bindings: venus: Add qcom,msm8939 schema
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260510-msm8939-venus-rfc-v6-1-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
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
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
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

