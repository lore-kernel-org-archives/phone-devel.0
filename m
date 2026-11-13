Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596889;
	b=bJW/krjwaikngmsh1qY8h1Q113CD/xXiUueZcqMtIjNBiV77pBasHXMjk5OVl3oa5GPI
	 Gh/6FSPyljIs50t49kAU7Hr9WOr3gpqxGoE/Klj2z6ShY+sMw/+Cv5U01DS+hBxbjeWhe
	 VzmZImM2DEoG4dh5p4dUs6jrlHYflcif8eQ/gkvrjl3KvwIcA2yN9mrR+9Vb9uTVTMO3/
	 krGkFkePclhx02gvQMKCMztMKoiV9q5cnndCsA+GvTF0VZF8hqIvMSPJbu2xRKVheyjGF
	 zEQM3328QedTyDhYi3T9G/9LHcaRhdkIrokqeWSkv6Bi1b52mt4JeUNOB143KO04E4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gbvwDyU+Acc05Vuh8BWsHE5JqO4e+EP9kLEpKSKS7JE=;
	b=S0+svdBbLrckRJEBOrEEy+FvS2BPjCkUGBIjJCWbtmjznlijveEIBbbVnk7OrDGDDVbS
	 Ts5ZCVmdbagLPjaMifRzg+iVrptbWvJdmSorCV2bOPYTVyEdJBoDxxYifscMB8zP73dxr
	 WBcIG8jHbvdAPfpyorXUa2+5o7ihktJO2Zn6fI1lvljlwfXKZQugw205/c+QSPQATLZAD
	 iykNRKVDCTACH/Wq04z16hLX36WeuIo2hrc1S4DdTyy46p8q0KyHmfCNlSI5inIL9WGsO
	 aO0Oh52GDgHaisMMjgTiq68NMMq05QfYxOL/TT9aWd1Nq2IQkGiOPmX8bg9FWwOK64g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G4tedKCr;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD0A60A5BC3
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 19:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BD0A60A5BC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G4tedKCr
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d473cfff6so224247566b.0
        for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 11:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596888; x=1795201688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbvwDyU+Acc05Vuh8BWsHE5JqO4e+EP9kLEpKSKS7JE=;
        b=G4tedKCr9dTUHeL0osYHCYyb5sGhRprlJVyaCfkJKrgkZ5BdLEMGrYCpKPoiw3xGZE
         x4wRFsryhr1u1jHmsxGRUOKaVgDvUO4AVRmCeUMx9wzbAg0704GjQ6NKSUpUYXOEo4Dr
         OrO/R/o+d0heYsjmowV2I/rmWTmSUNqQa5XX7lVolvGkT4RCo3jKYaYjkK/TAkYRX/2v
         877stSoQ+3S9I9peB61iNcUnGWiDacUURczzYPOiv1+pztlIgF1kc9mvqJrOIqRp52TM
         AMxZWGQvbSW4A+weNKZq7Kj5NR4tGAj0T5HlFjLqtx35nCTxzVYBk+6lbsZ+fYOO5gkA
         asyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596888; x=1795201688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbvwDyU+Acc05Vuh8BWsHE5JqO4e+EP9kLEpKSKS7JE=;
        b=gc+i9Cx3nPLjvv8GvvUPU9rp+eXJW37H5tOBsAao42LMyWaTY2cwQvDJQdmQwwjVWI
         Zokve28faGquQjTkM+ItLApxiPLfoe3uRgV4hfluLm3vHGmr2vLG4p4/3SZITyJyTaq8
         9GVEi977niCihSYYc0C9kgE2lVrFh8HMMrcZ6sfEWOHH4ZMmu1AsKdutYO0otWBSRVv1
         ZScu/Nru4LFaQJUVJwk8qnR9BnzvsEsi9HxHXreW2hKVbrfdZjXx4uLCRvWEC+sVAnAq
         6B0eMZkmBA+d9UqnHF76JRTHwFRC0wqTfcpnrIhNEOrCzWqDbTrPZ029r4TSKqu5i/Ss
         K8aA==
X-Forwarded-Encrypted: i=1; AL+hErFsvv9UJnZVfqrBNTHMiXCaTFalVb10BD6LqgUhl8xGtRx6rnS0OpYAev7aJ2jfkx52I9gK4jKUyu2TAA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9LN0bIsJ5FiefPTOKhqHlVrnda9hLnz/HWOxMQ+CEgZffqY7fb
	Bk2ma/mFpRRj1gCkz6byucHftiuBEznyxJN7zg3qdGdOM1urdjTf0d4Y
X-Gm-Gg: AYBFou0wpqPqB8wNeUuGqk8Vt73zpyzpPlU+mlQ6QZtJQkRH982+iXuJ64m62DSqwK6
	EFbjgpPHDUEBRnglvuCNU+UVk16/s3RpuGYIS+DWqHQJQCOn2NidSZof5pzkS9HOa3FA6PZdZIV
	xP1yJUXuAtEXbP1fqcFbNvUbzR43EVTMkDYTxualP3T/czG0NjZWTBqWjKmOXgg98PaEpuC+7h1
	BQ5Is/0LDhoBoZ+0737e+Ok95bOg/WYlkmYB1X44Jfnk/1aMD5nhYo8HtN2Puwuzs/neV/jDSvT
	d04kMgV+Uf+N9d9g6DjHKmdgtdY03JD7EbFPbwUblQS56dc5VaOADs8q3ZD1HMIQ0CYeHWvVIKD
	xlhaC/Xviihfv4ZLxDPPNEso0PdXPDGJmuuPFckWgEK+GCglIx4glyoxTxCOXfUnjPmhID17Mct
	DpzGzJSev3KE2lNKQj0I9OrdybPOibdn+FrqGdcH8/X86YRYBaEO1PrdqrJ68IPQcBRW1aZ2Har
	wltVWTJGImxfop3IPOU1Ih6mRsMb5vYaRXAaaS7ihoL7Ffe62KnBUiOKx0KZCYM1JwojwOdQ1+y
	dwrEWVBNvSQRftTWHF+kJMvVJ29hyLrjNiLoejW3uzTOqgw69h+24R+p4muCiWpH
X-Received: by 2002:a17:907:8687:b0:c46:7645:86c with SMTP id a640c23a62f3a-c509641d1eamr287876866b.47.1794596887578;
        Fri, 13 Nov 2026 11:08:07 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:08:07 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:05:05 +0300
Subject: [PATCH v2 9/9] arm64: dts: mediatek: Add Xiaomi Poco X4 GT
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
Message-Id: <20261113-initial-mt6895-v2-9-4ab0aa9fa391@gmail.com>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
In-Reply-To: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
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
index 000000000000..8d529062eea1
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
+		/* The size is updated by the bootloader. */
+		reg = <0x0 0x40000000 0x2 0x0>;
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
+			record-size = <0x10000>;
+			console-size = <0x40000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x10000>;
+		};
+	};
+};
+
+&keypad {
+	pinctrl-0 = <&keypad_pins>;
+	pinctrl-names = "default";
+	debounce-delay-ms = <32>;
+	keypad,num-columns = <1>;
+	keypad,num-rows = <1>;
+	linux,keymap = <MATRIX_KEY(0, 0, KEY_VOLUMEDOWN)>;
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

