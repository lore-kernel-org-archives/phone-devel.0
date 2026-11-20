Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190095;
	b=Fbiry2Y6USKogX9ObUVoa5D/GgKpHuT1jp8MMY6wTBGrklsV9T1+Bz2UlRx1BlrhjM7k
	 Z7k/251RXqvADPoWhZKrBszYYJ6hDd9b8rW8HAriXBpdHPgltEh/Vp3mQK7LCB1DYtNwN
	 tjK0ixaODF9D7SSmXNVL134IB8C3pajJ8+HezxzrqQUoupCqAq9Q1gmf2PKJRH+qrFMcU
	 3i2nguaigj2iyyPsNEM2iX/sDKYExxh9QF217U3ppcQ5T/NV57pJHiVTF4yfZbzPFGVga
	 kAMQRYwTGMGK8RUZuzcejbC5kkXMoREOtcXBbPgSaZeoACiITobp3YXIxCxU31ATSUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3+aCHgVYgy4GxhOiFEAFYeoXQcQ3nMSgt2tm+XSQojA=;
	b=3RXfwWZPIdFDBlweXuO0+a3Qtbc9BltddKhSaN4AzV4XJrzqWqSld/AM/+tN81x1/sy3
	 vAHzPAX33x+38vkI0qNZTvUBpQ/Js0BJrBK2CAoHFAQrCoSzrzgkdAd/y68tZY0XldtAu
	 LMKoZKCCbT4NLC6M4ixVkpUbt60XE5JUvMCNv6IudqSwb0tzZEAW4ODeOjn3ExQ8znETF
	 QXGklk25VPq75VsMpl4ShirWTaQ+hPqmmaGfvtXu0RG+o0DZsmHme2KvUwTLC42JdBN7s
	 9dDapmxfCQ9Lj2wyI8q5vBit6pEU/E3XH/DN7jXmkhhQh9vwJ6dUlvX5v9wwscZAp2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RD5/lCtn";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA211606A331
	for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 15:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA211606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RD5/lCtn
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so17252625e9.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 07:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190092; x=1795794892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+aCHgVYgy4GxhOiFEAFYeoXQcQ3nMSgt2tm+XSQojA=;
        b=RD5/lCtnOo+RVTTI7oVZaKgd9Q6AkBDr/99U8FJkjIF5smpOcyVCzuMQxHGfar6mJP
         37JcniEPoUaZpTyUdt7yOTWPLtrvvu8AzDXr/L34n/+/Nc9nXYOPlfV4w2V781MMQM8G
         53Na36tf6jUaKgxhT0zm5Wm3KIMtVpSTLF9W5oh/1KR1iwQmFF+qHaWV8PVJ+kHJX1iX
         RPoDVVb4F+Eh7tSV8FPxMIWWzu8Zhcdj03O6TponxyFSrrZ9YPmtJdT7HnrqNxKkFDQf
         7ojn0P8k9fkZxWsWkHoFIirgqk+ylgTPwXP7F3bPNM7Qc/OO+JHnYCtfr3DUp3YIo8zH
         gQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190092; x=1795794892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+aCHgVYgy4GxhOiFEAFYeoXQcQ3nMSgt2tm+XSQojA=;
        b=VAZkVGIPgpYuAA3vcqjuS+Wz8sAl/pq+U5tTYNsGBOuCWMWBBTW+2mVIk3I2Gucgvx
         aVr8QmQqxOgPTuIPQW8efgoFQ1ixhOlY7vxxi8lkvSL+gRgggv7u8MDGOmrVN+4V1/5w
         EzR0eRQg4W0nuLC7hl0pRPc0KcxnqcZsC+8oVOZUiJT6aUC8wgkS4tySseb/BHoZJIDt
         E8e5iXtSVBLzBXka2JC51vuxqUY3kR6Ot3IyLVnnEg41mTUN8oq0VWQW+jhRILjj3t4o
         HppEkQH/r035FqyJJY3mRiX9Z7+qWH78sU1e21bw2nr2gStuoWOwZPafgAT4su9OR4xS
         ZG+w==
X-Forwarded-Encrypted: i=1; AL+hErEbkruJlfH84mv4SM7/4TI7ml6xYcDRXE/PdhrxnTnjc0919N4lAVM5Efw6BTjKl9/ztdbjOIO7MOvxJA==@vger.kernel.org
X-Gm-Message-State: APuU4Z883W9szo9V3amUx6tKG85yxGXo7uJsMORhi7sxwCC/0oRvNBwL
	4K0yizLyXzBpgtwIIEt5zlGhzOjN5HeKPgiDt3VuZ65OdHpd5JSQWc9v
X-Gm-Gg: AYBFou3khqN8dze4nc0bBXqVjcSblYPjR2MZEQhZuJxVazq1Pv9rhb9My/sB1fZ/1xD
	YfILHmHRj/XMrGFdVgpYbKYwnW5fw2yj6HggeMjdkwzF+nQ/0xnGjIoyu2+3dD/a/M5P24UvRkt
	tlOghYXlB4++kV6klm9vGqu+T+ru38eGr8sn9SiM/3umnmQ1HmUzDY9O0Nn03c+A/qBEcrpfeKN
	kPLtHPJyDwLSgqDbx6KBNvwItG2IMou2jLsBdFrSebj8rbWuxCzMt+qGv2Ny20OubT5PFsi8RqK
	6eJvYrP2EpPxnQmWptLBV8mbLA4iChNgQFBM96X2pgXV0roijD/5YkvAxD17G1sLYMfFj7tyo/5
	uimwbSe9zW1cxGVhfH+cm2zGROGQU1yTuu5jlCVPcVp8lIz4a1uzLgLaO2+94ii5efc9ItI+xmY
	7xch1zV2pPF5/xcUqiRqXCbEIJnl+Lsye3b//zlcnm7fGcNT669ByPOXR8/9pn1JRtJGDta5w1K
	AqqsVh7LVGiTPv/ZhorAsmXtv/EnZPX9wo6a7SXu3Kbd34ds3bz1C49WgHQ+v+zDwNZcZ2GxVwd
	dwCYfbyDXrBnbNM/RX/tWVDgwos8kiVTwb4qvX0gloqMcbgDdiP+nIhNZD5QEiS0/1UPpyTHHT1
	SvXQ0tWnysMcskmZ1edTQ
X-Received: by 2002:a05:600c:4504:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb887fc396mr78640565e9.3.1795190092017;
        Fri, 20 Nov 2026 07:54:52 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:51 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v5 00/10] arm64: dts: qcom: add LG V60 ThinQ 5G (timelm) support
Date: Fri, 20 Nov 2026 16:54:39 +0100
Message-Id: <20261120155450.7719-1-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial mainline device tree and driver support for the
Qualcomm SM8250-based LG V60 ThinQ 5G (timelm / LM-V600) smartphone.

Hardware features supported in this stage:
- Base board devicetree (sm8250-lg-timelm.dts)
- PM8150, PM8150B, PM8150L, and PM8009 PMICs and regulators
- UFS 3.0 storage and MicroSD card slot
- GPIO keys (Volume Down, Assistant) and PON keys (Power, Volume Up)
- Simple framebuffer (continuous splash handed off from bootloader)
- Adreno 650 GPU with GMU and zap shader
- LG SW43103 1080x2460 DSI command mode AMOLED panel with DSC
- Silicon Works SW42902 I2C touchscreen controller
- PM8150B USB Type-C controller in sink mode with USB-PD and
  orientation switch
- QCA6390 Bluetooth HCI controller on UART6

Changes in v5:
- Touchscreen binding & DTS:
  - Replace separate interrupt-parent and interrupts properties with
    interrupts-extended in the lg,sw42902 binding example and the
    touchscreen@48 DTS node.

Changes in v4:
- Base Device Tree (arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts):
  - Drop vendor brand prefix "Google" from the assistant key description
    per review feedback: rename google-assist-state to assist-state,
    google_assist_state to assist_state, and update label to "Assistant".

Changes in v3:
- Base Device Tree (arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts):
  - Model PM8150L SMPS6 as top-level fixed regulator smpc6-regulator
    (0.88V) rather than in regulators-1, because PM8150L SMPS6 is an ARC
    level resource (ebi.lvl) and querying it via VRM causes
    rpmh_regulator_probe() to fail with -ENODEV.
  - Drop conflicting memory-region reference from framebuffer@9c000000 to
    prevent simple-framebuffer/simpledrm driver warning and mapping size
    mismatch with reserved memory.
  - Add board-specific firmware paths for CDSP
    (qcom/sm8250/LG/timelm/cdsp.mbn) and GPU ZAP shader
    (qcom/sm8250/LG/timelm/a650_zap.mbn).
  - Drop duplicate sdc2_sleep_state pin configuration from &tlmm (already
    defined in sm8250.dtsi) and redundant &pon { status = "okay"; }.
  - Adjust ramoops pmsg-size to 0x100000 (1MB, power-of-two) to prevent
    kernel round-down.
  - Drop unused <dt-bindings/phy/phy.h> header.
- Touchscreen driver (drivers/input/touchscreen/sw42902.c):
  - Fix potential unbalanced regulator disable in error and unbind paths
    by registering devm_add_action_or_reset() after sw42902_power_on()
    succeeds.
  - Guard sw42902_power_off() when suspended to avoid calling
    regulator_bulk_disable() while supplies are already turned off.

Changes in v2:
- General / DCO & Identity:
  - Replaced account handle "rofikkerneldev" with real name
    "Abdur Rofik <rofikcoga@gmail.com>" across all commit authors,
    Signed-off-by trailers, MAINTAINERS entries, and copyright headers
    per Documentation/process/submitting-patches.rst.
  - Replaced un-documented "lge" vendor prefix with documented "lg"
    prefix across devicetree bindings, compatible strings, and dts files.
- Devicetree bindings:
  - Added lg,timelm compatible in arm/qcom.yaml.
  - Added lg,sw43103 panel binding with enable-gpios and
    vddi/vpnl supplies.
  - Added lg,sw42902 touchscreen binding with vcl-supply and
    vdd-supply.
- Device Tree (arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts):
  - Renamed file to sm8250-lg-timelm.dts matching vendor prefix.
  - Reserved memory: folded cont_splash_mem and log regions into base dts;
    sorted all nodes by ascending unit-address.
  - Ramoops: adjusted size allocations ensuring panic dump space is kept.
  - Regulators: dropped unused LDO4 from PM8009 regulators-2 node,
    resolving the invalid 1.05V constraint failure.
  - USB QMP PHY: corrected swapped supplies (vdda-phy to 0.9V l18a_0p9,
    vdda-pll to 1.2V l9a_1p2).
  - GPU: enabled &gmu alongside &gpu to ensure MSM DRM component
    binding succeeds without -ENODEV in a6xx_gmu_init().
  - SDHC: added complete pinctrl states (sdc2_default_state,
    sdc2_sleep_state, sdc2_card_det_n) to &sdhc_2.
  - UFS: added regulator-allow-set-load and regulator-allowed-modes for
    dynamic load scaling.
  - Panel: added enable-gpios to panel@0 node; sorted display nodes
    alphabetically.
  - Touchscreen: used fixed regulators reg_ts_vcl and reg_ts_vdd for
    power supplies instead of raw GPIO toggles.
  - USB Type-C: replaced PDO_BATT with PDO_VAR(5000, 9000, 3000) to
    ensure valid 9V/3A PD sink requests without clamping to 600mA;
    added OF graph ports connecting DWC3 HS and SuperSpeed QMP PHY
    orientation switch.
  - Bluetooth: corrected QCA6390 PMU voltages by setting smps6 (0.95V)
    and smps8 (1.35V) constraints.
  - Cleaned up unused dt-bindings headers and enforced strict alphabetical
    ordering of all referenced label nodes.
- Panel driver (drivers/gpu/drm/panel/panel-lg-sw43103.c):
  - Removed redundant manual unprepare call in sw43103_remove().
  - Guarded sw43103_backlight_update_status() against execution when
    unprepared, avoiding unsynchronized DSI DCS writes.
  - Removed hardcoded full brightness writes in sw43103_enable().
  - Expanded Kconfig help paragraph to 4 lines.
- Touchscreen driver (drivers/input/touchscreen/sw42902.c):
  - Converted GPIO power controls to standard regulator bulk supplies
    (vcl and vdd).
  - Pre-scanned for palm touch reports before queueing MT slots.
  - Used named initializer in struct i2c_device_id table.
  - Followed input subsystem error naming conventions.
- MAINTAINERS:
  - Added entries for LG V60 ThinQ 5G, LG SW43103 panel driver, and
    Silicon Works SW42902 touchscreen driver in strict alphabetical
    order.

---

Abdur Rofik (10):
  dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
  arm64: dts: qcom: add LG V60 ThinQ 5G (timelm) support
  dt-bindings: display: panel: add LG SW43103
  drm/panel: add LG SW43103 panel driver
  dt-bindings: input: touchscreen: add Silicon Works SW42902
  Input: touchscreen: add Silicon Works SW42902 support
  arm64: dts: qcom: sm8250-lg-timelm: enable SW43103 panel
  arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
  arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
  arm64: dts: qcom: sm8250-lg-timelm: add QCA6390 Bluetooth

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../bindings/display/panel/lg,sw43103.yaml    |  69 ++
 .../input/touchscreen/lg,sw42902.yaml         |  72 ++
 MAINTAINERS                                   |  19 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 814 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43103.c      | 587 +++++++++++++
 drivers/input/touchscreen/Kconfig             |  13 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/sw42902.c           | 360 ++++++++
 12 files changed, 1951 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
 create mode 100644 drivers/gpu/drm/panel/panel-lg-sw43103.c
 create mode 100644 drivers/input/touchscreen/sw42902.c

-- 
2.39.5
