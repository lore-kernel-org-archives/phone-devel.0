Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795077108;
	b=Hkn/g8/r0s+oNJto0SzI5R2Sse+P2LY2mdGuM+e72rh2oAAd5jWArfFXvL5SgF8kDDN5
	 Y+3BLIZcmAlLCt0tx3b3nHUUbksdxwvlE/nENgNtzaX3nlg1eTmRrI06T+G5Ndxlmg3rx
	 huc2cosV9kEKyU2Bgvv1+FrP3LrJrgrjRTRXfE7JcAN+zIsDg5Sj9JWvULIZxCBgC9avY
	 CHPtdF0M9tRgXv3uQIbwqvoEzAzqXRRym9tC8WFITMXEUizIbdWO7p3TA99FQny+zFMQX
	 A1KK9gc0Fgka9TwJ2dQB0xoLLlBYfY4XD1ztSq228o7KvrPGvnrRvuGN7dJjVFTUnxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077108;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EJKBi0Eo8jI4ozru69hppl0oykD0+2YIq+pwumylrps=;
	b=keEzJHNa3psGgGR0lCFj4SacNXVCLVcf0P5Y3/oO4MefV6qV0fLDgTvKqE3SpbzhveUG
	 gZiGS8ZEQQkgbCqsbnrlf7dNoyG3N0OPkwg3sSARrIaZ7Ma8kXrqkEuxYD6tSz/ENTBC0
	 aFx9LHrqT1qnzNSIGgbnmDDdgAQRn1IcQzyGU4bAQBHlkTnkrXm/7f17ioqD/Peg2xE1u
	 k/SICRIQFdr1KCh5C33xL400Gf1M3z0jyOd8P27aLlpNDJVRm86qaPMytevRfl0qw1LF7
	 PyYGM4qi8sQNOEfPYYScIDEx2lwKBGKI5hukccv2+CjW5l58/p3ZenXKMN088sUpnCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MwOuJVni;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D2D60A2600;
	Thu, 19 Nov 2026 08:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MwOuJVni
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795077108;
	b=mRHHW9xVm1CHXHx3QANFt1qWG8wedBq2/KZ1ff5T8uGk/J51k9WD4K9gAz6tgkgg9YtQ
	 RVCvjtQw/bxsJ5oRPX17wM0dhvrxQHtxi9fxcS3+KssJ2EWIlpjLnyYUid1JN5iMTNNep
	 N0i7uAWkw4F9cxl7tiFtn1DorAywRmaLtIOtmK2uFCxpPPmaCmhTwz/V7clLJVuEgguyH
	 nUGXMPJYh4tPYJbTA3DZEjzj+lRl/MdnLAu5rJsVmnr0V43hObqdHKAgkpnaHa0UI9/E6
	 Wa4G/Y3SYcRNcSvwEokXwyknjUazdVF2D2vLh7KqnlGcEhwQd74jJ+V14aHxxpMmsGw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795077108;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=EJKBi0Eo8jI4ozru69hppl0oykD0+2YIq+pwumylrps=;
	b=OexqTasosVpd3jD1jA6p1euJXzxiYLaPC8Q9Op9apOHFx1C8HcY/Tp1ezDB0yQOKNi64
	 kf0vvvGCYn0deb/IajTdO5+e1obLg5ARmUuhOnD3ajlMbMgpCkPy0EVJZSExSsg8+y6Sr
	 o/tnwK4HvGrfSDgWn+j4kU34I3FsjRtF8kd0tkULz6MVHUXkzpIPZbEldS2A3Npri6sQ2
	 6ZsKja+pnq/wrJKQcAOpciLEGRJeZuu3z6lR7tjFWddwDKpB38jJZP8hnjiEw9XnZ+R/L
	 evRwk+X6OYCWN2U7Eb+NK5uSC3TwxJb0nH+pf39BzNQNgZuThgQpnB+ke032kpqL2yA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B5371F000C5;
	Thu, 19 Nov 2026 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795077108;
	bh=EJKBi0Eo8jI4ozru69hppl0oykD0+2YIq+pwumylrps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MwOuJVni/dKb7eYp5QG0KXwskINofXdDvTHT5o4qUxAFEvKghu9tls/OVrPRnAg7z
	 P/5T0TOTdr7sBWRah2a+sOgCIKotvAdX85n+5AMpYRdg6+TIcpJ5nC9oZ/1i1cBWqi
	 M1jyBcUE1qsFn0wBA5nOZ1IXZzlPNJsstzh8276JoL9dqQiVzXV7407YpfYzPcuucZ
	 VyHoEc7qXRUgRGdKcto99RebRYkQwdLHCE4tzBYI/CWATY1mJ12UuewjVWDrglrEFt
	 ngwookTqrIG7ZPT32GZmItEbDeDeXPunRSrq5ZvojVX0S2aMX1fE9jyhzscssuas9D
	 VqYR/+c2mHehQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8F8E34B179;
	Thu, 19 Nov 2026 08:31:46 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Thu, 19 Nov 2026 14:01:46 +0530
Subject: [PATCH v3 1/2] ASoC: dt-bindings: Add NXP TFA9865 amplifier
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-vantage-tfa9865-v3-1-5257fa45df57@yahoo.com>
References: <20261119-vantage-tfa9865-v3-0-5257fa45df57@yahoo.com>
In-Reply-To: <20261119-vantage-tfa9865-v3-0-5257fa45df57@yahoo.com>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, phone-devel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795077105; l=2798;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=clpAsQwAhx2GufbyRotHi6YglHtWhSHyZbTP5u+hrn4=;
 b=/w+ia3EORqiN+fnnjmEraObbtwY6JW5F27rGABNfYWmN9b8kUKHywwGI/Xs/SCkqcfDFZP6iE
 n8pnbpAG8kGAAmTIrValDCJfY/qj+dm4z6BO0LdFgaGBI3Zyi+9aDpk
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

The TFA9865 is a mono class-D speaker amplifier with a boost converter
and voltage/current sensing but no DSP. It is controlled over I2C and
receives audio over I2S/TDM.

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 .../devicetree/bindings/sound/nxp,tfa9865.yaml     | 63 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa9865.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa9865.yaml
new file mode 100644
index 000000000000..ff8fd35d9d10
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nxp,tfa9865.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nxp,tfa9865.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP/Goodix TFA9865 Audio Amplifier
+
+maintainers:
+  - Venkat Yadlapati <venkat.yadlapati@yahoo.com>
+
+description:
+  The TFA9865 is a mono class-D speaker amplifier with an integrated boost
+  converter and voltage/current sensing. It is controlled over I2C and
+  receives audio over I2S/TDM.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: nxp,tfa9865
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vddd-supply:
+    description: Digital supply (1.8 V)
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@35 {
+            compatible = "nxp,tfa9865";
+            reg = <0x35>;
+            interrupts-extended = <&tlmm 201 IRQ_TYPE_EDGE_FALLING>;
+            reset-gpios = <&tlmm 183 GPIO_ACTIVE_LOW>;
+            sound-name-prefix = "Speaker";
+            #sound-dai-cells = <0>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..bbe812e4257c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20386,6 +20386,13 @@ F:	drivers/gpu/drm/bridge/tda998x_drv.c
 F:	include/dt-bindings/display/tda998x.h
 K:	"nxp,tda998x"
 
+NXP TFA9865 AMPLIFIER DRIVER
+M:	Venkat Yadlapati <venkat.yadlapati@yahoo.com>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/nxp,tfa9865.yaml
+F:	sound/soc/codecs/tfa9865.c
+
 NXP TFA9879 DRIVER
 M:	Peter Rosin <peda@lysator.liu.se>
 L:	linux-sound@vger.kernel.org

-- 
2.56.1


