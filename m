Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94650394EA7;
	Sun,  2 Aug 2026 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785674567; cv=none; b=MQGJ467H6Rkv22kZ5sB0QW/bta5HPpzw+/FTeFib3sm6Mpj8QaMfO8GqBhU7ZnkjRl28YO9z8zwBocZ9HJ8xwEmvlwEXXDWUXE4Pi2Zagap8Ti+QK2GzomNfFg4U1LUw8upOBaLyT3gsA0XR8T9NokpuptsxTD2TYA5+pvN4O4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785674567; c=relaxed/simple;
	bh=gMz6c1u7vOhvnOY9ulQRhpy2xb4L/wbzVkIxYSZQCTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QVoYBmZ9zkGYeXo2xa8ZAt/RCnmjHUUvp6h43CiZZX8D4NCw0BeQly4sFtZ8xv8OfqWyaaDUqwiOoRmaqd2R4fH5QU1RHbXfcCOJyInfQiZZjRKOgWJmywJPW0pcXU2g0O1EnPRdW0gVabZP2wS8SldJY0MApVZGnuuwbpgStqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tXro9iJy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tXro9iJy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17B89C2BCF7;
	Sun,  2 Aug 2026 12:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785674567;
	bh=gMz6c1u7vOhvnOY9ulQRhpy2xb4L/wbzVkIxYSZQCTs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tXro9iJyrljHF4Czg0o/jkUn3DOT/9/sPyYHNX4fW0+Vz7lrf7MisDEy6lvXGErnG
	 D2MqdjZQzBY49TjVwNQzxKT3EBWdxQvyEMQwAzMH2Vu0IEp8U7ID2oEQSHysEJtFTW
	 eMJd2QdFH/fEV9cQGp8W8NrGwN0tkkypyALXuqqWQ8QK6bf59UtG0zAMbGZfKntRaO
	 P1/wqg9UXL2BAvtywIlcp2eiNA3MOTPbpvrK1bowXs3TJGpKgm9gAgZwrGc3c4gRWC
	 iaSDk6S1ZsMDpp/D38cF6pdlMxk/PzhRwiJLdPC6Ds2C61Px8ivnypQrAwHS4VDcat
	 en9rNCmkIC6gw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC84EC55171;
	Sun,  2 Aug 2026 12:42:46 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 02 Aug 2026 14:42:40 +0200
Subject: [PATCH RFC 1/3] dt-bindings: sound: Add NXP TFA98XX TFA2 amplifier
 binding
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-tfa98xx-upstream-v1-1-4dd55cdd658a@ixit.cz>
References: <20260802-tfa98xx-upstream-v1-0-4dd55cdd658a@ixit.cz>
In-Reply-To: <20260802-tfa98xx-upstream-v1-0-4dd55cdd658a@ixit.cz>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1851; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ViUxE0LC3t90pmsmZSY5+bZF4yD/3WG8f30yBWITCnw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqbztFvRluDR502lw7/NRrEIgLQC8sh6Ek71XsZ
 KJ5ZupFntWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCam87RQAKCRBgAj/E00kg
 cqA9EAC3OE2BeZ1AqxbrtO7HUJMae20TUw2B+T7GH0/Jb0n7YF0GznXb20tw+/pmLxx/NG6zx9m
 dmh+aphYXRhoEUn2rXsxLcRn/t24DYiYV+hJ9R8qHCf1HuEZoh5LssODei9PV4G2wpW1kfQfWgP
 20k56fREItfh9gy5OLAIEieYrjsn2yWghPpP8WrlSh9T9cxikj46tj4SQBSO0xTN36hLqVO1Cq4
 SmtdSNIVLtheR04tcqHsclcMMX976B9AtuSjKxADuxAvj4vb5lg92Nfczy8L7/NetJiPpPLjAUD
 iPdhmz68WU6BRCigOtceqlVlSRLCKDIx29ChAoFuF05d8v6zvw1iogWBvrJ/CXJjIyDxkx64Gpg
 xm7RCFKOZde+9NmH23IGYBFd723uu/3aOFbg+mhErJAg2qZLY+UylfAL7MOjIICswuiIY+LrF2x
 S4o227Um7/LPcTxOZjnObBTLKyFV1jBB2bV6gIlpGH6nUVlojNcLlApgpwF0UjS3bMyd8yBbgMh
 TwOqTuaRh9PWLn2aHRKrimiVG7HmdIAbNytKAA2HoOw1Vp6xwz4OEgeP8hhRgZe4FHmjlAzspFR
 X0+yG5gf8gdNhMPe8arbn9t4oz9vas7KfSYAqOEdvzlr6o5CevuLMzcvKTGDm/t7uTgitgJFYTa
 l4JRlZ1Wba33U0g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Add a YAML devicetree binding schema for the NXP/Goodix TFA98XX TFA2
family of I2C-controlled smart speaker amplifiers with on-chip DSP.

The binding covers supported chip variants (TFA9872 through
TFA9912) and documents the optional reset and IRQ GPIO properties.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/sound/nxp,tfa98xx.yaml     | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa98xx.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa98xx.yaml
new file mode 100644
index 0000000000000..e80c046894454
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nxp,tfa98xx.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nxp,tfa98xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP/Goodix TFA98xx (TFA2) smart speaker amplifiers
+
+maintainers:
+  - David Heidelberg <david@ixit.cz>
+
+description:
+  The TFA98xx (TFA2) family are I2C-controlled class-D speaker amplifiers
+  with an integrated CoolFlux DSP.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nxp,tfa9894
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@34 {
+            compatible = "nxp,tfa9894";
+            reg = <0x34>;
+            reset-gpios = <&tlmm 69 GPIO_ACTIVE_HIGH>;
+            #sound-dai-cells = <0>;
+        };
+    };

-- 
2.53.0


