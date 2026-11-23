Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432760;
	b=K4vGYK/oLVwkV7FDUob7i8kkWKg0bKTyS6hvgImZh4FKaX8YNNHQnJuj+3fUTzeUz5r6
	 uTXcHAKDKECmjLVsGy5UpM5Z4YBnA8qQ/2+AfnBFqcCeINkVvbdrM3tINO6IzMhso15zV
	 aeZkiCpAt9hbkV/WdF+89AhtTa9iS7ziR0TMOkbg2jobyE1x+WVoQfa/jPWJWfHAaAOoq
	 ZQ9XjYaThcOFClL5z5JIMMvVbu4fYIChk3abi64wrGlCc5VeLwX79k0enP+OXIR8n/D1F
	 07RQdNOkHcon9TrpoauMQL2Bc3Ijih95FGGCYnLom+grfp2K+ZnjVN79miT69P/zx3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZTYyCf3yq+FPJgr8Karin0tCSx+qzJ4PS7WFFQlBVEg=;
	b=ukyWq3hfYL6IJd4Vh7sp4w+cJCr6HJCS40G2Uf7tEVERtuCMbFWqCRAtyUBjeqXyKW+3
	 zeNBz83Hu+7N9zdTCRxH+Ipt0aRTCZk86/YDETQv5oRqnujWMDTLV/JDxNc3VP3x5PTxN
	 J4xi5hZQkJqlFJLTNDAa1X6Lq8bs5ROUpEY5wKgeXKwzhKA+dCfUMHhZWmTyQ4yladqrg
	 Z8nbhk/T997ASDrhKSvLzvowrGryaOG061f2q6BOsUxjZzcsj8U93lIi0eaNr9TKLLeHp
	 rtDX8U2GhbzsuUtYwWsdjcAkZPQdoNH6eb702CS5S/FHef0EsZxkAUFnRCHpF08LFng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irj4LZ5k;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F97260A5BC1
	for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F97260A5BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irj4LZ5k
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so600621666b.2
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432758; x=1796037558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZTYyCf3yq+FPJgr8Karin0tCSx+qzJ4PS7WFFQlBVEg=;
        b=irj4LZ5kRy6yRgUhGg1kbm92HcmMCoMLneUJ1641AVWfolLANDiIf3OmqL1qK0R86g
         Ztg59feCeB4uIqZUKmoBPxBg/H4XEYVkaT/eYEZiltNrG1SOnYRgzj3YAfeFfVEoJIWK
         1V8zI8+9kody6xxnD1ow7f5yu/kMdzDAEOkfRvWDx1qaHJaU1uqD9tbt1X9kQ8FYZ0yz
         +FvAag8XgfIO+LISFHNN6d5eq9vULtLoT2Pe+xNlwSAzXonylDjoWKMEgxRgc7a3ZBZV
         HK/8SCrP+GMGX7FMKXF8E9mc9oPeOQdPThDbIVyMdZ6aouGkPUI2Ik7Zu7LDLThHuUfO
         Bxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432758; x=1796037558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZTYyCf3yq+FPJgr8Karin0tCSx+qzJ4PS7WFFQlBVEg=;
        b=f4SujAyvxrlLPe4X/PL0Nvr95+LoR1O5C9h3+/83fZEUxrfpDnZET/brYS6ust1O1C
         Pj6lceOLt/h1R3WdPByAKX41/W0gtBYEZQ6CQjD/PNoh7Gr8PISnKWFBRDQfF0xtCXy+
         ICyy/051eeeYHs/Cw0D4qOqsdG86TN6NidSVj0p5g++5cYXM5i525uEePtsOKEQotFne
         B+ozSJxqFFFPdCB1OdNwPNzb00WiMtSNRG84i+KWJhGcyI7sFq+BKc2RsvkjpL/3TD50
         XYcGoGKN3SaBX6ixUu9yl2wOx8j376ohypVKKtAtOMqTWzBAq5+GTcKglFwZH0pdWt2Q
         FQBg==
X-Forwarded-Encrypted: i=1; AL+hErGAErjU27onBQtvCvh2eWwnsgu2XtiSzxdTaEhdYcjb1j09GWeznnl+1GTxML5CqMqoxTcVTF7OCNlMsQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/bqfuXSM7gZ31rq9mcp9ebsg2IqvYVqJGPSgRdGZB7erxt81h1
	kYApVFAAnXK4+1utUoT6oyFoLGWRRZaRI9d8JjUzJcZ4aLOvyn29DPKF
X-Gm-Gg: AZFdTZd/EM16c3W+dFU6/yRxV/hWoJCowfW9JvrqezsdkNoBqc/LIsnVpxWOuCMHvGT
	jhgh9bqzyT16DFKDju6ub6kEJO1HG9YbxpR/0HxowWKucUncT0sImvLd7OU3IVuWrnpfWpbXg7D
	gpIp98PNSrYropmqmFwywyFDY9j4OcX1VgH0JK0PCZ7NzH82o0KiAkm5v0R3xLhyXrC7hNeAmhC
	mdPoPz3ykLxcgCbNZDeaUULUZ1BTSNDGYfCXHHlUUO+/z73v18q87SDEx6TxAte08vWvw9XcPcB
	vQc4MbM1BnjaOvJfGuJ4kJZhfKEbXiBnQSU9hqYJqRvV/YymIgSmueIH7Be9RPYWnsCOeb/5HTS
	NJiE0Oli0iIeZ6bo4KtsktVbA2o6G101ILKY/zVXFHdlibFa/JoRzhlNgsg91pd+EPXTpwrnSVl
	oGmbVAz6d+fPEdi1chLctsoo3ysDKR0iMU0ICAnxZ2QmPiJF1Fjd2kzYzvvOMGLu1lMT9HlRVrF
	MzsbvOyEfGlbt3XnI8jpr3V89LsFmfAfyDyx9cnE1QXvRLh8a1vKwlw8gXHIa+1TRD4g4A8lPkE
	dGtiA6KWDzIRQQBZy5n/HD5v6St/eh202MCQ7oqLegmYYMxJA6Z3aFw7z5i8Smqtug==
X-Received: by 2002:a17:907:1396:b0:c48:a838:c16d with SMTP id a640c23a62f3a-c513ab4925bmr609639066b.30.1795432758535;
        Mon, 23 Nov 2026 03:19:18 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:18 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:40 +0300
Subject: [PATCH v3 7/7] arm64: dts: mediatek: Add Xiaomi Poco X4 GT
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-initial-mt6895-v3-7-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add a device tree for the Xiaomi xaga board, which is sold as Xiaomi
Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i. It enables a serial
console on UART0 and the volume down key on the SoC keypad. The power
and volume up keys are connected to the MT6363 PMIC, which isn't
supported yet.

The DT only describes the memory that Linux itself uses, which is the
ramoops region. The bootloader updates the /memory node and adds the
firmware carveouts to /reserved-memory, so their addresses are not
hardcoded here. This DT must not be booted with a bootloader that does
not do this, as Linux would then use memory owned by the firmware.

The ramoops zone sizes place the console zone at the offset where the
bootloader expects to find it.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 arch/arm64/boot/dts/mediatek/Makefile              |  1 +
 .../arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts | 87 ++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a86fb313b1a9..d73489149ab5 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-sony-xperia-m5.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt6895-xiaomi-xaga.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-cudy-wr3000-v1.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
new file mode 100644
index 000000000000..7bfe0d438803
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2026 Alexander Letuchiy <asalde.le1@gmail.com>
+ */
+
+/dts-v1/;
+#include <dt-bindings/input/input.h>
+
+#include "mt6895.dtsi"
+
+/ {
+	model = "Xiaomi Poco X4 GT";
+	compatible = "xiaomi,xaga", "mediatek,mt6895";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		/* The size will be filled in by the bootloader */
+		reg = <0x0 0x40000000 0 0>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		/* The firmware carveouts are added by the bootloader. */
+
+		ramoops@48090000 {
+			compatible = "ramoops";
+			reg = <0 0x48090000 0 0xe0000>;
+			no-map;
+			console-size = <0x40000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x10000>;
+			record-size = <0x10000>;
+		};
+	};
+};
+
+&keypad {
+	debounce-delay-ms = <32>;
+	keypad,num-columns = <1>;
+	keypad,num-rows = <1>;
+	linux,keymap = <MATRIX_KEY(0, 0, KEY_VOLUMEDOWN)>;
+	pinctrl-0 = <&keypad_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pio {
+	keypad_pins: keypad-pins {
+		pins-col {
+			pinmux = <PINMUX_GPIO107__FUNC_KPCOL0>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			input-enable;
+		};
+	};
+
+	uart0_pins: uart0-pins {
+		pins-rx {
+			pinmux = <PINMUX_GPIO88__FUNC_URXD0>;
+			bias-pull-up;
+			input-enable;
+		};
+
+		pins-tx {
+			pinmux = <PINMUX_GPIO89__FUNC_UTXD0>;
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};

-- 
2.56.0

