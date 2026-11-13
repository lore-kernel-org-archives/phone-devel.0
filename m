Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596864;
	b=217wrjT9OgLj+LaEOINL5ChPvtj5D9wCG9YhOu9xRIMGLN/gD34boaByoU16uFrQEvLF
	 A50rYRFeYP7cN6j560DIt8KpmZQcvXJd7uMigL6nrcNigoVMObIUYoNd8/LVeJ3JZXHOW
	 Vsh3l61PySHvxbeAFOAxuULeCrF7gKoPwsn1FI1WsxeFK0Q76FbVpFxN5GRRWmCRuUwFL
	 TZ98a7bkXT2BHxWVF3nfMVHUhclEtoUBN11fchtbRrXyQ0olN8CDgl6szMOoSDsCzeNoh
	 yggm8i3574PObN9P6zbLb6yj0IFUODBQzFDeQgc+q1lRgQ8NlNM14OhJa/iwOUP8HbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=+au4NSAQlywMAWAnW8gI9v9WGhRbYIokFF+zwZ5t/v0=;
	b=K/8X2Yp5Ku1E+u8bziQpAHsf96QPAKFOWRloiVyP/5penPsuzlkLRhjp2imhUlqPTNK5
	 9FkjwKfbMsSitLYqobh6cmNsiM58Y4j2oqMiBlxV6bz7YsywKi4+GL5aMRsrPUEyIrGiZ
	 M9NQjdVCSCUxHyXpNQdZ/iIILn8pKuupkOzM3nRuy6HlY4PTRVJwOY+8kh0T5GPdJHivl
	 YOSg9AfoN7eLnEcYE3K4SUdQ06z9rlZzrX6S1FpHlLPk8rRvv+Ll5EeFEyIcJmeoPeIG/
	 +5l8GvupUibimjaFsN1hhw/UzK6b7uS5ydmlajujkIXcnak5b0H4yInpLgf/3+IJ/fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oSLT48Xv;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F187606A336
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 19:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F187606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oSLT48Xv
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50604721c8so289831966b.3
        for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 11:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596862; x=1795201662; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+au4NSAQlywMAWAnW8gI9v9WGhRbYIokFF+zwZ5t/v0=;
        b=oSLT48XvEteheX6VpqJzbrrn6VfEudoajN4Z+DlXI0aT1DjUA67jiBZsifrslf5ked
         +QbQNVA1Y3c5aKKPNCe1Z7H+e1CsoJE0vdbAkf8Qqyacogk9YYB5MXF8y9Xvk888yOqp
         eExPG7q68igBfSXDuO7jo+zJeJwtqo0wdmfrsOeENTWTzTCr25dcjjMxYZjuSF3nGiaU
         lEc7vvXCP5+MVC0Vc9CSzFbN3l8obRPLqOCUvn1r7GCYE8oSOmSNmfxuq6LXBplZIMzx
         ol1ch6J54ohRdboVes3cegcwE+kTRGGvWoSJIXAY57vkApGtfLBN4tAGZ5QQNKJE682d
         ptTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596862; x=1795201662;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+au4NSAQlywMAWAnW8gI9v9WGhRbYIokFF+zwZ5t/v0=;
        b=ZGlkuB1RiCrj0c0Ncxjvr2W1isLp5Pz6AUhIn+LyfgglbJJ0fQz1t5uSdz25SBnL1J
         GXh/c3eFtgq8B7ehVZhRD6tnjAHCHNSRLrg2eqJrcUa+k2MLkMD/uq4/HZJ7POu7pigk
         cBz1ysARUHeMay2j5lEhRYA6QxZH8fGGk65s2kpPGwCfhvvCD0GK/y2wXbEld0bJtzy3
         IdUKWQaHysCr12GN1nZvqMCVVcnPFysmZi8CByFjF5RVIOo/pFJpaMAsC1DZWNnD3mmM
         ettiqvZaLk7pGpM7OeRfrUDaxKfTTqAdlOWUlKkfhboP7XcuqKfDnxJmq6TN69l8I0/g
         6NqA==
X-Forwarded-Encrypted: i=1; AL+hErF3v3H0mUqLM0m+fdhZrVMu981kqBfrRRKVAD3wdHNmFxQzFdA8BaQxlG+QyiRvR0kiIgvYK6yYm30UnA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9MN+LgBdyDq9z3MoIjMPziiakf/DYZhd6184vvUDxfJUBjbRYU
	KQFh7e7N0hjJ66Ft/JVE5If6vOOoWxOtcmrSFi4Yy43TJnpFbey1LQB3
X-Gm-Gg: AYBFou3VYTlSp7JhnK4w5WpbO7Ti4t7y3RPTNc/xobTG05B7a2bmEOTtnplH6e2w9Rb
	8aBPCneXi5cOJm+B2G+JueKdzgSNaly0MTiEfMFpoK+eT6wk0ORmr3gqDEYzfDdGJIDwifg3YXt
	KxUg/zFIRuS7DG/NKSi24EyrMY1W+vbY4fH82eOX6Fo2DFNoSy4OQSS33rQAQxm/QKziOW/nnAm
	iPWx+ftk65L65NibqTFXk8E+yQ98HrakdaHk/6Kl4cL4ajE0xs0Hy4OevpSsdbYArYiv3riOUnR
	UjDbtD7qA53TY3KbNAeWkqWkYQrcdQrR8OilWM68XR1W+34CbK+A2PqKeKl4RMuYKkXtx85wZUE
	FJTAzBPBz7gxmbVJi8GHTd+tN/MUy71VMmFpNiek6FGET7yrg8gxT2dkpQVkWvMLsDXNRIBzpqY
	QQ1jBiXIGtY+nRXgH4wsC/DJdLjRuoyYA+A8UQJwmENfs3gfoOCRuAWw4BCTI2H5vt7jDR8XGDr
	Yg+RBIsuvzrxLxqz14KuUQHNLZSIvd0OwAa+MLAm6/Mt0KBhgGWrVLadctbp89TrWqN6AfRmJ55
	m1Ifw+8v4oiB3xRssXlBCDaHPbgj92hYN+A7GH6brpvrCH1CvFtrRLKvrJRcBF/0
X-Received: by 2002:a17:906:7c49:b0:c4d:167d:dcee with SMTP id a640c23a62f3a-c509641047amr235459366b.40.1794596861569;
        Fri, 13 Nov 2026 11:07:41 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:40 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Subject: [PATCH v2 0/9] arm64: mediatek: Add initial MT6895 and Xiaomi Poco
 X4 GT support
Date: Fri, 13 Nov 2026 22:04:56 +0300
Message-Id: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WOzW7DIBAGX8XiXCwWg7Gtqup7VDksZEmo/JMCs
 VpFefdiJ2qPI+3ONzeWKAZKbKhuLNIaUljmAvKlYu6M84l4OBZmUsgWAAQPc8gBRz7ltus1h5Y
 8WEDyWrPydInkw/cu/Dg8OF3tJ7m8WbaLc0h5iT/74grb3VMutATRSllr2RhlOHBMOB6pHgneT
 xOGsXbLxA73hzbS17Xk5scWmygl3HOH6vUp7PglzC7Hv9oVuODeCOWUamwD+O9929osJuIFppC
 HqlNoba+1BQFaGYMIgH1L0jfowPZNZ43xqitF919F2EzfSAEAAA==
X-Change-ID: 20261110-initial-mt6895-16ef1b1aef55
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

This series adds initial support for the MediaTek MT6895 (Dimensity
8000/8100) SoC and the Xiaomi xaga board, sold as Xiaomi Poco X4 GT, Redmi
Note 11T Pro/Pro+ and Redmi K50i. It is enough to boot to an initramfs
with a serial console, CPU idle, the CPU and DSU PMUs and the volume down
key.

Dependencies
------------
The SoC DT describes the pin controller and the board DT uses its pinmux
macros, so this series depends on the MT6895 pinctrl series:
https://lore.kernel.org/r/20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com

Bootloader dependency
---------------------
This was tested with a modified LK bootloader that is not public.
The stock LK cannot boot this DT, as its Android fixups expect nodes
that are not present here.

The DT relies on the bootloader to:

 - update the /memory node
 - add all firmware carveouts to /reserved-memory
 - pass the command line from the boot image

The carveout addresses are therefore not listed in the DT, as the
bootloader allocates some of them dynamically. I can describe the
fixed ones in the DT if that is preferred.

Firmware behaviour
------------------
Two things in the stock TF-A affect what the DT describes, but not the
DT itself:

 - TF-A rejects CPU_SUSPEND for about the first 40 seconds after boot.
   The vendor kernel lifts this earlier with a SiP call, so with this
   series the idle states only start to be used after that time.
 - The DSU PMU registers are lost when the cluster powers down. TF-A
   can preserve them (PRESERVE_DSU_PMU_REGS), but the MediaTek firmware
   does not, so DSU PMU counts are only reliable while the cluster stays
   powered up.

Testing
-------
Tested on a Poco X4 GT with 8 GiB of RAM, using a minimal config and a
script in the initramfs. The results were:

 - All 8 CPUs come up and match the DT (A55 on 0-3, A78 on 4-7), and
   CPUs 1-7 can be taken offline and brought back through PSCI.
 - The cache sizes and geometry in sysfs match the CCSIDR registers on
   every CPU.
 - The redistributor is found for each CPU, and timer interrupts reach
   every CPU.
 - Once TF-A accepts CPU_SUSPEND, every CPU enters the CPU and cluster
   power down states, and the system timer wakes them up as the
   broadcast timer.
 - Each core PMU counts only on its own CPUs, and its overflow interrupt
   arrives on the right CPU through its PPI partition.
 - The DSU PMU counts, and its overflow interrupt arrives on SPI 18.
 - The pin configuration of the UART0 and keypad pins matches the DT.
 - The volume down key reports presses and releases, with no bounce
   through the 32 ms debounce.
 - UART0 output works at 921600 baud, and its TX interrupt fires on the
   expected line.
 - About 7 GiB of RAM was written and verified with no errors, with the
   carveouts added by the bootloader.
 - The watchdog resets the board once it is no longer pinged, and the
   ramoops console log survives that reset.

UART1 is disabled and was not tested. Only a minimal config was tested
on the device, not defconfig.

Tool use
--------
The commit messages, this cover letter and the test script were
drafted with Claude Code (Claude Opus 5.5). I reviewed them
and tested the result on the device.

Based on next-20261113.

---
Changes in v2:
- Describe MT6895 as Dimensity 8000/8100 in the commit messages.
- watchdog binding: drop the mediatek,mt6589-wdt fallback, as the
  MT6895 reset layout is not known, and drop Conor's Acked-by.
- New patch: add the MT6895 compatible to the mtk_wdt driver.
- New patches: system timer and keypad bindings, pinmux header.
- SoC DT: add the cache nodes, CPU capacities and idle states, the CPU
  PMUs with PPI partitions, the DSU PMU, the system timer with a 13 MHz
  clock, the pin controller and the keypad.
- SoC DT: use IRQ_TYPE_LEVEL_HIGH for the architected timer PPIs.
- SoC DT: order the nodes as required by dt-check-style.
- Board DT: add the UART0 pins and the volume down key.
- The series now depends on the MT6895 pinctrl series.
- Link to v1: https://patch.msgid.link/20261105210622.523747-1-asalde.le1@gmail.com

---
Alexander Letuchiy (9):
      dt-bindings: arm: mediatek: Add MT6895 and Xiaomi Poco X4 GT
      dt-bindings: serial: mediatek,uart: Add compatible for MT6895
      dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6895
      watchdog: mediatek: Add support for MT6895
      dt-bindings: timer: mediatek,timer: Add compatible for MT6895
      dt-bindings: input: mediatek,mt6779-keypad: Add compatible for MT6895
      arm64: dts: mediatek: Add MT6895 pinmux macro header file
      arm64: dts: mediatek: Add MT6895 SoC
      arm64: dts: mediatek: Add Xiaomi Poco X4 GT

 .../devicetree/bindings/arm/mediatek.yaml          |    4 +
 .../bindings/input/mediatek,mt6779-keypad.yaml     |    1 +
 .../devicetree/bindings/serial/mediatek,uart.yaml  |    1 +
 .../devicetree/bindings/timer/mediatek,timer.yaml  |    1 +
 .../bindings/watchdog/mediatek,mtk-wdt.yaml        |    1 +
 arch/arm64/boot/dts/mediatek/Makefile              |    1 +
 arch/arm64/boot/dts/mediatek/mt6895-pinfunc.h      | 1524 ++++++++++++++++++++
 .../arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts |   87 ++
 arch/arm64/boot/dts/mediatek/mt6895.dtsi           |  461 ++++++
 drivers/watchdog/mtk_wdt.c                         |    1 +
 10 files changed, 2082 insertions(+)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261110-initial-mt6895-16ef1b1aef55
prerequisite-message-id: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
prerequisite-patch-id: 68c077b6ff907e42d02115ed9b95bb5349eae7ef
prerequisite-patch-id: 09c2602edc0cdb6ca34ecbae12f608ab530da477

Best regards,
--  
Alexander Letuchiy <asalde.le1@gmail.com>

