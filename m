Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432741;
	b=f/KFHmgz/B1RETCA+9lPUbBir4aX8zuQyvcYu+j/PEjXkj0BKIxI8i4n+ApE51L5xR2O
	 rAUSU5+d2gpKLDJ4os0AMYf6SXRh2XwJtyLGi89T3GYNKrj6Nd+J8UOdyPAzBSdjgak8r
	 2M5NhYFDbGykmlDtnem26ueOMbzdsr1n2sdxcw5/mxwLGxG7fasX2aIeChLMCXtxrvc/U
	 wMy+PoLXFW+UkhTQ+8Hw+/CQ6l5x79Pz4tK78lpvIG0P4MxB/NWqrIkXBrC+wpNsSuDCj
	 dsG4y69uKBjAMsG6n4Lxz9WXCpkjIdDZ4RD0zg9IjiNiEK5iYjPNdiT1DfREsJQjNtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=n+j7JQq7bAOQ9NxHtgY5eV6al7EOgUbRC6r9lYqsMuA=;
	b=ncXvkx/5DAc+4jxH7Ou3QQL1jeTjiDjF/EdsA/ayQfBWUdZwstxp05Q9Uzc3owcC1twb
	 0mHBl+FzAMk0ywUa56Rb7po6ipmEnXZ78+vapQ+eFdG2HEy5kD3919w/vnFh0Nvfyd+bD
	 TD0MjAEoNXFSkFo4Rg83mAW9w+BceGsm8z6vqC8v/tlrq6AHcRjm8aigYz0unnkYV0yQV
	 yP7ZF53cvfD96ztBHDZcGK9ZWgcPAVi52oYJ0k1W5QiLpncMNqqKuY8ANagEOglOCgBc4
	 S1mgCcVaNyhH0Z/0RWpAYouhkg7PREs5YpmocB8ffo3/Z3T4qaugdiubkdgvKVyda/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hikikHO0;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F964606A321
	for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 11:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F964606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hikikHO0
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4cdc606b47so530194266b.0
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 03:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432738; x=1796037538; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n+j7JQq7bAOQ9NxHtgY5eV6al7EOgUbRC6r9lYqsMuA=;
        b=hikikHO0/Qr+DQGH/tjQXUySPDxBfZpQVvuAeh3OyXSfn7uTLmXeK/Pady0kV6wT+W
         3elifHvG8BNve0KnHpgcorUmFjqiRfa5GM9Lp2UiAAmT/x+MfffpB9PNaizGf/Ir2wMM
         lMzzx8fARAo26MLmpnFldleUZeZ81xxqVe2IJGiZPtc5WRNRH51gK9rQIO+i9HJGoR9k
         Kpp0kvZxERAJq98BbpdhMCSBMJK++Lt/OUvKs3++A6Vc5Rz2JzcnCAuAmE4JspZcosYs
         xBN8mH7DK8Iakgu4ArmYv2K6Qy2tbyh9ZyuH3hqdlB6/x8SL5OnALjt2bGEhsqZPSfXy
         dFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432738; x=1796037538;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n+j7JQq7bAOQ9NxHtgY5eV6al7EOgUbRC6r9lYqsMuA=;
        b=d9jC8YiMGthZTmDDApNeqhHPEWkay3nwdJWyh6KyvHWsZcI48BAG0/L/MeXslqQ9NB
         X6bKLvTaKT+HTjmQenSG8UFjkMtuJHnpXkCH5QCeoy0jI6ekNN2F0ODHQhj1Fz0cRL3c
         2R2p7yW+1CMktOKct2Ig5nsFHrdFsGhKuMYKWJM0U/08lQYz+PZ53x9dl9ElZF/tbSua
         W6nxeJP3zQieMCM7nXA4eTN2Dddt+1UfB0j7rFlJDkaAdhXkgUl3rqX+ST0ua7Zd7PcV
         KVB5U23qrAAlcj3n1JBCsb+x1nmi/miipPY6JtGOJWe0f2ec+uq7qrq8H8H7jzyie6ay
         uQmg==
X-Forwarded-Encrypted: i=1; AL+hErGD+l0syaLnV1K9rUf2DT/aFuSEjCWvUx/GKL46TkUbFhD0UExuCGX6OqomlNxSHbolVJEF7dcg5VcBlA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+/rcYIbvO/LM7jxeLZm9Uz24WJkhpJ8hRW8Q4QQAbdvGg55QAx
	wgzVeie24ntap3b6HHAQ+EFVqPK+REhG03F//k3m5mW+y/uLpli9/mK1
X-Gm-Gg: AZFdTZfqmTTbKoMMflryitTmHuKeqmJm+ckcBxDXc5YHHS1U2Q0cjaif04Dh1TfDBWA
	OOXxRXybBtOeCy5bjtz6jHFG8ZVA+SOIycSsGChKTlzcQ4ZooJeksRxNkalTf8lpc/+McsIU8qU
	u2rBNCuz6bk+DFETwfjsuapCHAiQbq665Nh8yKwn7m10w39URutbBHlC568M8ZyF5SaCmzhjZ8E
	AEmC3ceEOk7tE4vQspgMmnUO8KdCMtTtefQyHJIhRXVanrrGg3K8h68ye500ygkUtfrU5HYRBlg
	h4ZUt5IAVUYu0dHOiWDQH+i/2lLVZCpfEucxcT6LDGekwdWgGsbxx/rgkhXW/TkK3ieScnPqrpT
	nc+R02Zg7hrJfm9lmBcZ1odGy98GU+f7i9Sk+erFRTUwdbPCq5LHyUYND0KYoVOEyLqocPIxTiL
	eSLEaRrHwdusMmdohiB+XM7ajhKMVixkSx2M4RccRiT4hmCY/2Efl+qZ3ECWqj2rp7937k9gSdK
	oD7hSc+F4Gg8VFZi6St9App8G+Izz9MbYtc5PpW9GgGW4y/osdTdiSLXub4/kzGEgvZYmXnEPo0
	94g4kG8yX8n1sjeE0qwul5mSagCTvqmAFMh9NhJDULOAJSyPor7B5yn+lqYlogPYqQ==
X-Received: by 2002:a17:906:6690:b0:c4d:167d:dcee with SMTP id a640c23a62f3a-c513aabb216mr686937766b.40.1795432737778;
        Mon, 23 Nov 2026 03:18:57 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:18:57 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Subject: [PATCH v3 0/7] arm64: mediatek: Add initial MT6895 and Xiaomi Poco
 X4 GT support
Date: Mon, 23 Nov 2026 14:18:33 +0300
Message-Id: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12Py2rDMBBFf8VoXRk9LMkypfQ/ShdjeZSo+JFKi
 mkJ+ffKTqBNlxfmnjn3QhLGgIl01YVEXEMKy1yCfKqIO8J8QBqGkolgQnPOGQ1zyAFGOmXdWkW
 5Rs97DuiVIqV0iujD1w58e7/ldO4/0OWNsl0cQ8pL/N4/rny7u8OZEpxpIWolpGkM5RQSjAPWI
 /LXwwRhrN0ykY26ij89Lv9LrYIy2kDPAKwHaR/q15tVxM9zWZtvqmTClGBf21XPd25LT2F2OT5
 ymRGta3AYHLhf7ss2rYeEtIQp5K6yzKI3YEEyD1xa1BaVUig107plXjkHxghdjK4/QrqXzIcBA
 AA=
X-Change-ID: 20261110-initial-mt6895-16ef1b1aef55
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
 phone-devel@vger.kernel.org, 
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
https://patch.msgid.link/20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com

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

Based on next-20261120.

---
Changes in v3:
- Drop the watchdog binding and driver patches, they are now in
  linux-next (next-20261119).
- Board DT: use a zero-size placeholder for the memory node,
  instead of hardcoding the size.
- Board DT: order properties alphabetically.
- Board DT: drop Angelo's Reviewed-by, as the memory node was changed
  beyond the requested property reordering.
- Rebase onto next-20261120.
- Link to v2: https://patch.msgid.link/20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com

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
Alexander Letuchiy (7):
      dt-bindings: arm: mediatek: Add MT6895 and Xiaomi Poco X4 GT
      dt-bindings: serial: mediatek,uart: Add compatible for MT6895
      dt-bindings: timer: mediatek,timer: Add compatible for MT6895
      dt-bindings: input: mediatek,mt6779-keypad: Add compatible for MT6895
      arm64: dts: mediatek: Add MT6895 pinmux macro header file
      arm64: dts: mediatek: Add MT6895 SoC
      arm64: dts: mediatek: Add Xiaomi Poco X4 GT

 .../devicetree/bindings/arm/mediatek.yaml          |    4 +
 .../bindings/input/mediatek,mt6779-keypad.yaml     |    1 +
 .../devicetree/bindings/serial/mediatek,uart.yaml  |    1 +
 .../devicetree/bindings/timer/mediatek,timer.yaml  |    1 +
 arch/arm64/boot/dts/mediatek/Makefile              |    1 +
 arch/arm64/boot/dts/mediatek/mt6895-pinfunc.h      | 1524 ++++++++++++++++++++
 .../arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts |   87 ++
 arch/arm64/boot/dts/mediatek/mt6895.dtsi           |  461 ++++++
 8 files changed, 2080 insertions(+)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261110-initial-mt6895-16ef1b1aef55
prerequisite-message-id: <20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com>
prerequisite-patch-id: 68c077b6ff907e42d02115ed9b95bb5349eae7ef
prerequisite-patch-id: b404409a8981e9d462b7fdb6eeb092c69bba50bd

Best regards,
--  
Alexander Letuchiy <asalde.le1@gmail.com>

