Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3CB3BB138
	for <phone-devel@vger.kernel.org>; Fri, 18 Sep 2026 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742415; cv=none; b=s9SsK4/8N4A9Djp0bm/LIwzOAQQWZ2cPG6rosYh5GLJv6snGek3u8tOWKf42oWFQwep75rv+tF0T5Kil1wXQ8q90s5bk1aCaNAKaGHG/bTyl1E+jBV/uziJS2WcT/9XSCFxkTEC3koZXfOQJS/NhdZk6YC+SXHUOTAKrpJmuP2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742415; c=relaxed/simple;
	bh=XhMyap36SF3JF1+9wLSfeQ7OCyB4xUGjcggtykCnHpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U5bGVCwSRVd0M7V3vE+/j50XEyTFPz1VFjwlH2a+uV1ol+ocvCJmUWAx10oaqk5UCz4GNiwMqI8FAXEKMxwOXW9ormsEi0Z6M75uXcdEKcAPGqkh/xS0+DngeURIqKw0EUwQhRtYQitrviy4uWS8nuU2q2i6Si09RVy2uhl5F8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Lr4+E6QG; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Lr4+E6QG"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99391ffb2so1335909a12.0
        for <phone-devel@vger.kernel.org>; Fri, 18 Sep 2026 07:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789742409; x=1790347209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/IatM9vHTABSDwa1SOgukfIbmpJsWxfSXbs/7yaZiE=;
        b=Lr4+E6QGWWu2UyI5DQXyE3lTeH3MBcczStDEM26fyP2TNbqObSpXt4udDpGDW2uQfM
         tMp9TD558mYQqWR4GmcKJIYoiMMXccPDNi6Oo7iD+ox0Z4Jt2b5pwsY3uAlwedIcp9VK
         yuhb6qj+1xs+YmylcDPvU2z7VFE3shW5jqiTXQ7INB23zEgEOTD2z5gkaIAP5LpzpjZk
         H2nyEq+yGHrJlw/yIwG5Et9oPosnDrgKJCoRUb5lSco+DJDqwwjz/1X+XcMuu6k+PRbK
         5CSVqrt4EIgQskIKKrOeH3fE/mIujC50dtuFqP/PChAnOsNEc+OqWFw5HXwPMzJiIMs1
         Dtsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742409; x=1790347209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/IatM9vHTABSDwa1SOgukfIbmpJsWxfSXbs/7yaZiE=;
        b=bNSWIxflFRA4t8erlzL9e4/SWb6TbkZVcM7YbD4maHNRBkoUKAZsqqtcfcSRc985YK
         cTSvVUN7o8HWz+QeRwiFZulvMP/7fBK0n5ymfD+3E7VwIWLJVOhVVAnuoeXeGhXLLFLM
         uJ5iDQCpzgmhqp9BhcNqdCn5xyJneIcfRt2w9WfYHQdQoXFZltOsdU4dBKbe44c8LreP
         I9Fue8bS/+MlgvN2kXeH7VubUeWVgcjXUQsGbiUjswHONVIbH+r9UqlaNn2f1gwy0PTG
         63hqE1ZFNPSEWMJeqbIJp7xXXvF4EPuc5/G0Q/EttwxMOL6UWM75qGKACbowBXb4E1zc
         yZAw==
X-Forwarded-Encrypted: i=1; AKwUvBxvopHF3OTmnuytyhZ+q1xU9Gwu7T3WqM5MJfbKlxW7dRpSZwjn7RPzsP6CsErwWf+bIWOFVgML7rud6w==@vger.kernel.org
X-Gm-Message-State: AFuF++mDJbEC05CJMdUycORemXPqtmNfxsdMqHB2vFZ+gIvdjwaDi8il
	sG6JAPOzXg2NcK8+aaSYkQ6ua/AKHWtavW4edGWK9Yl9MfOP/ouuhXETbwjqPTFXYNdVbDd2EhL
	SqmUn
X-Gm-Gg: AYBFou01/pA6CT0S6X7ctcjWL6gy3uA0FFvk/18wzCN9HP65a5FHXeYxXYp1hOJEWma
	Obkm3+ogszFGAuVfhptVmWRwPGTIKKzj0Ps4CWHvHGy2kXAtj0tjZd8383QxBVvFPxB9JpKzldZ
	/Ao2j3eb4LAciM0J+Yhhz6VvrG0saz7q1oKNiSCFUn1YoeaxbqfJkAcB2riwDyVIrdU2Uvs2Oo2
	uFbxIT5Ti7FDO1mbzb1anjclQJRk2sD7oAmsTAs95h77TWLlvFfdRpjdfzWdlly/ey/RTKDVE7n
	QfR2i+eLBpeeQElCI1plbA90UOaCk6JDZl8oqO05Fyte4hl8xve+/lVwF97eGcQL4/7E7HJua/S
	LoCR8SBIdYPKc3RO6dpmT3FeyP7NseG/YR0jHQJrHXW5KByEJaLqv6df6jeSmPANitWplJzhUs9
	hRWZGZvKh23E4H+X2V42dFQ3lktT8+9If5FEM/lHGncS7LtQUE83yu+ki/MBJ4gwslm4/QoFpCc
	fCGo1MPLeC+t6x+9YYl+E6Q5tGXacH3ZoCN8xFXW9GW95mITjGl
X-Received: by 2002:a17:907:3f24:b0:c29:439b:d5c1 with SMTP id a640c23a62f3a-c2a1585a618mr282179166b.16.1789742409410;
        Fri, 18 Sep 2026 07:40:09 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1b7a369esm64244966b.9.2026.09.18.07.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:40:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Sep 2026 16:40:04 +0200
Subject: [PATCH v2 1/4] dt-bindings: display: panel: Add Novatek NT37705
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-fp6-panel-v2-1-6695c4008920@fairphone.com>
References: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
In-Reply-To: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789742407; l=2372;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=XhMyap36SF3JF1+9wLSfeQ7OCyB4xUGjcggtykCnHpw=;
 b=zDpWdXo+ogYNi4ESfbfwF3oJmTY6LAq8995rP1tN3uxmV+O2gFbbKUT8WcCAAYO84wGfj3gmo
 ZGbpua155biBy68yvD0D4ykBtKSEAE2seq6/VmZvCjM/RGc0JEsb4OB
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Novatek NT37705 is a display driver IC used to drive AMOLED DSI panels.

Describe it and the panel in the Fairphone (Gen. 6) (BJ631JHM-T71-D900
from BOE) using it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://lore.kernel.org/r/81a3c207-4d8f-490f-8e2a-6f3f4c2acd35@kernel.org/
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/display/panel/novatek,nt37705.yaml    | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml
new file mode 100644
index 000000000000..1c796599f6fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt37705.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT37705-based DSI display panels
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  The Novatek NT37705 is a generic DSI Panel IC used to control AMOLED panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    contains:
+      const: boe,bj631jhm-t71-d900
+
+  reg:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O voltage rail
+
+  dvdd-supply:
+    description: Digital voltage rail
+
+  vci-supply:
+    description: Analog voltage rail
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vddio-supply
+  - dvdd-supply
+  - vci-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "boe,bj631jhm-t71-d900";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+            vci-supply = <&vreg_l19b>;
+            vddio-supply = <&vreg_l9b>;
+            dvdd-supply = <&vreg_oled_dvdd_1p2>;
+
+            port {
+                panel_in_0: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.55.0

