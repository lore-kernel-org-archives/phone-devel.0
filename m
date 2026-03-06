Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FA33624C2
	for <phone-devel@vger.kernel.org>; Fri,  6 Mar 2026 13:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804926; cv=none; b=avYATOA5qVIAj07nVjhWQ7T8sos48Td61ErIOa91fMzR8TPbfiJttrm2kq9YqsuJpSbcItH7y4P8XmGMRjdiMWk0tprHiz+u/vXJsz6Rz6bdefYRmYANsBcATyay5ltqi7RGkI3BIDVGAzN9rs8q7ZIQlEVsT/BPxlU22WmSDYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804926; c=relaxed/simple;
	bh=S4AYyFcTsusx6JymB78ndk1LzxPjBUj/RxkWMGbPmis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JThXjyKA2mzpFpk8OjaAzlVotbEFY2aP+FHYlMZm3TL6nUaAMUFE5QeInOg8tRcLoYmvnC/5qV2NjP+YKpfWAAL43I2xXnRzBoxMv+v7ER040iv9V5/NNpEldUiCK0Y7Lujimy3iFXM0cNhkg8rjWQnpByCGuijSDAZhVp1sKxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=z+axEiQK; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="z+axEiQK"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b9b190easo3752634f8f.2
        for <phone-devel@vger.kernel.org>; Fri, 06 Mar 2026 05:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772804923; x=1773409723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ix3uV33RQkJIwlvd9fVLf03DEoMJ43/Z6jDu2eagGtM=;
        b=z+axEiQKsxnQ517nvve/uhAJapQ7CMCQEyCeDQ3MdFAqjR++TUU1Q+woOwN/F6zEpN
         z8R0iJn+Hpor4agBzVj+ZfX5hOzhO1d/wfMswIjBKyIF47OZZdIGzhckPWucdMXJbkus
         P3yz/2qNiopibjBJDPkXQgKRo//Qxfx/RwXWS/1/Zvi8F8ujLgv5vmwpi6Fx35LvDV+0
         VLgwOkKpbsOixER+ZljUGEpaz1l0WrSAIZMqdnLpZ7L5KGjoJc/+BfucRMC8q9rmOgz5
         cdL5mblYSCRERnCqdj8HA+i5WhQggaGRnTZ+jJmoM4dhoo7nS9kbMxsKbQr+4Z+TmZSU
         nwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804923; x=1773409723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ix3uV33RQkJIwlvd9fVLf03DEoMJ43/Z6jDu2eagGtM=;
        b=wr4ARpKkxODpgvXbAi3XhvWKZWm/8xN2VR9xO2ERVDAUExGPcGHfz0gYUsJHjAtndt
         NUzKNBrM7hKF/bNaJBhQeby+wklizQUzaiO+dX1U6zORL8FOkrRNOvt2Wl13yGr86gvX
         Z32t8wlkFFhVteFuUC4ap8y2dHwqZdDbX6badPX52BBtC9zxQsSIJOubswdLub5ZsDV3
         pAs5HnqpUpKdlvwDuz532ib15LAXKU6024HsUmFC4VNWgnQvzmfPW0fi7fAZeUqj8REU
         RKuPJexVH5CqTOHFqrlVneKO7TpS10hI3gr0tz7n9VnnuA4CeTZJzfKNU17qouWfXLWW
         XsgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXopwC84626el1MDqSQJO61OxBnZwfVpnZyJY+5JWIjh76KJiGFuSEhNDJXtXwY8g+ylN8KErRaQPVV/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YycsQo6iuY1Psy3g97trtyXMM5/nh5i4JriHNn2XmKdFYXyHp9J
	qnf0JmKBpueKuWyoLAlIvqfn1uX8iXQZ9x4Rpda8nI1B4SWA6pKp2uia4s02etREg6U=
X-Gm-Gg: ATEYQzwh4Wg3VcHeYl4HsMi7BlpQrRmLJg0dcM0TbYQfFQkNLowbybMq0yLMa5C5KGd
	6i0wCDP8F1Bswf6it2HMGCcbAxfS5UcOIBQD+L9w+ZIYXfQ3tMpqNHVu6mhi2vWsVDyyXyG2jg7
	WZwvfQyjB5V28mS3W46dsyQK6v1N1NwY7mClnaKxCrNOg/HOCNUmqz2MZxZR4QCOd6AoKopWC0N
	hJ84K+hQ5fTzeRusW/LLyXKDJtdERUuE6XAsvjC0FFZINo5h5mcp8kRfkmZ9xEuC8DEGdazpX53
	jwymGO+2Ng0Iz7d9LvoQ2k6mkqrAC2bG9R0XgsU5+ZuxMP9f/UBdk+7npMDf/+BBdJdM6ZbV0P5
	9AClGHHjv9TZgtk1p42HNNASYpbrbQphmHzoX5Bdo7XaxVFLnjFGZMM9VWeiDnWjk/DuEXZZhIA
	8VKaMp7DAJF/k4XLSC0q8XihagGCAJwhTZBPinCRywel0xeXwzq/cg5uX/kf0mSOqkaBTpHQ+xo
	TwEpzUGwBu4jJk=
X-Received: by 2002:a05:6000:2911:b0:439:beee:43aa with SMTP id ffacd0b85a97d-439da351b41mr4056912f8f.16.1772804922768;
        Fri, 06 Mar 2026 05:48:42 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8daf2sm4304767f8f.2.2026.03.06.05.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:48:42 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 14:48:37 +0100
Subject: [PATCH 1/3] dt-bindings: clock: qcom: document the Milos GX clock
 controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-gxclkctl-v1-1-00b09ee159a7@fairphone.com>
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772804920; l=2517;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=S4AYyFcTsusx6JymB78ndk1LzxPjBUj/RxkWMGbPmis=;
 b=kTbKHsy8jRCEnPD2m5k97hP71fQLFbaGxDIxGv0EHdi8iyAguyE0P3/OXLbhWgeCUxmf6Letx
 C6vAaAw7wgHAHz6VS+U+eRiZmOrn0Q3QwZXfYemKr7ZsfwtKizk9pHi
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
Power domains (GDSC), but the requirement from the SW driver is to use
the GDSC power domain from the clock controller to recover the GPU
firmware in case of any failure/hangs. The rest of the resources of the
clock controller are being used by the firmware of GPU. This module
exposes the GDSC power domains which helps the recovery of Graphics
subsystem.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,milos-gxclkctl.yaml        | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml
new file mode 100644
index 000000000000..47dc6bb66120
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,milos-gxclkctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics power domain Controller on Milos
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
+  Power domains (GDSC). This module provides the power domains control
+  of gxclkctl on Qualcomm SoCs which helps the recovery of Graphics subsystem.
+
+  See also:
+    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,milos-gxclkctl
+
+  power-domains:
+    description:
+      Power domains required for the clock controller to operate
+    items:
+      - description: GFX power domain
+      - description: GPUCC(CX) power domain
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - '#power-domain-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@3d64000 {
+            compatible = "qcom,milos-gxclkctl";
+            reg = <0x0 0x03d64000 0x0 0x6000>;
+            power-domains = <&rpmhpd RPMHPD_GFX>,
+                            <&gpucc 0>;
+            #power-domain-cells = <1>;
+        };
+    };
+...

-- 
2.53.0

